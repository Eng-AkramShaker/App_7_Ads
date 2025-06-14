// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_element, prefer_typing_uninitialized_variables, use_build_context_synchronously, await_only_futures

import 'dart:io';
import 'package:app_7/core/constants/app_navigators.dart';
import 'package:app_7/model/user_model.dart';
import 'package:app_7/presentation/screens/auth/screens/sign_In_screen.dart';
import 'package:app_7/presentation/screens/home/screens/home.dart';
import 'package:app_7/presentation/widgets/snack_bar/Snack_Bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth_Controller extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User_Model? user;

  bool isLoding = false;

  final ImagePicker picker = ImagePicker();
  File? imageFile;

  String? verif_Id;
  String? phoneNumber;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController C_password = TextEditingController();

  // Forget Password ====

  final formKey_Password_Reset = GlobalKey<FormState>();
  final formKey_New_Password = GlobalKey<FormState>();

  TextEditingController Otp = TextEditingController();

  TextEditingController New_password = TextEditingController();
  TextEditingController New_C_password = TextEditingController();

  //  IF <8> / A Z $#@ ===================================================================================================

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'اسم المستخدم مطلوب';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صالح';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'الباسورد مطلوب';
    }
    if (value.length <= 6) {
      return 'الباسورد يجب ان يكون اكثر من 8 احرف';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'الباسورد يجب ان يكون احرف وارقام ورموز';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'تاكيد الباسورد مطلوب';
    }
    if (value != password.text) {
      return "الباسورد غير متطابق";
    }
    return null;
  }

  /// اختيار صورة من المعرض
  ///

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  //------------------------------------------------------------------

  PhoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        //

        verif_Id = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //  Sign In  ============================================

  Future<String?> Sign_In(BuildContext context, String email, String password) async {
    isLoding = true;

    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      User? currentUser = userCredential.user;

      // جلب بيانات المستخدم من Firestore
      final userData = await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get();

      if (userData.exists) {
        final data = userData.data();
        user = await User_Model.fromMap(data!, currentUser.uid);

        // ✅ طباعة بيانات المستخدم
        print('👤 اسم المستخدم: ${user!.username}');

        // Provider.of<Auth_Controller>(context, listen: false).setCurrentUser(currentUser);
      } else {
        print('🚫 لا توجد بيانات للمستخدم في Firestore');
      }

      // حفظ بيانات أساسية في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', user!.uid);
      await prefs.setString('email', user!.username);
      await prefs.setString('email', user!.email);

      Snack_Bar(context, 'تم تسجيل الدخول بنجاح', color: Colors.green);
      pushAndRemoveUntil(context, const Home());

      return 'تم تسجيل الدخول بنجاح';
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'invalid-credential':
          errorMessage = 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
          break;
        case 'wrong-password':
          errorMessage = 'كلمة المرور غير صحيحة';
          break;
        case 'user-not-found':
          errorMessage = 'لا يوجد حساب مرتبط بهذا البريد الإلكتروني';
          break;
        case 'invalid-email':
          errorMessage = 'صيغة البريد الإلكتروني غير صالحة';
          break;
        case 'user-disabled':
          errorMessage = 'هذا الحساب معطل من قبل الإدارة';
          break;
        case 'too-many-requests':
          errorMessage = 'عدد محاولات كثيرة، يرجى الانتظار والمحاولة لاحقاً';
          break;
        case 'operation-not-allowed':
          errorMessage = 'طريقة التسجيل هذه غير مفعّلة';
          break;
        case 'network-request-failed':
          errorMessage = 'مشكلة في الاتصال بالإنترنت';
          break;
        default:
          errorMessage = 'حدث خطأ غير متوقع أثناء تسجيل الدخول: ${e.code}';
      }
      Snack_Bar(context, errorMessage);
    } catch (e) {
      Snack_Bar(context, 'حدث خطأ غير متوقع');
      debugPrint('خطأ في تسجيل الدخول: ${e.toString()}');
    } finally {
      isLoding = false;
      notifyListeners();
    }

    return null;
  }

  //  check Login Status  ============================================

  Future<void> checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUID = prefs.getString('uid');
    final savedEmail = prefs.getString('email');

    if (savedUID != null && savedEmail != null) {
      try {
        // محاولة جلب بيانات المستخدم من Firestore
        final userData = await FirebaseFirestore.instance.collection('users').doc(savedUID).get();

        if (userData.exists) {
          final data = userData.data();
          user = await User_Model.fromMap(data!, savedUID);

          // ✅ التنقل إلى الصفحة الرئيسية
          pushAndRemoveUntil(context, const Home());
        } else {
          // 🚫 لا توجد بيانات للمستخدم → الرجوع إلى شاشة تسجيل الدخول
          pushAndRemoveUntil(context, const Sign_in_Screen());
        }
      } catch (e) {
        debugPrint("❌ خطأ أثناء التحقق من بيانات المستخدم: $e");
        pushAndRemoveUntil(context, const Sign_in_Screen());
      }
    } else {
      // 🚫 لا يوجد مستخدم محفوظ → شاشة تسجيل الدخول
      pushAndRemoveUntil(context, const Sign_in_Screen());
    }
  }

  //  Sign Up  ============================================

  Future<String?> Sign_up(
    BuildContext context,
    String username,
    String email,
    String password,
    String confirmPassword,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      if (password != confirmPassword) {
        Snack_Bar(context, 'كلمتا المرور غير متطابقتين');
        return null;
      }

      isLoding = true;
      notifyListeners();

      try {
        // إنشاء الحساب باستخدام Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        User? user = userCredential.user;

        if (user != null) {
          // حفظ بيانات المستخدم في Firestore
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'username': username,
            'email': email,
            'createdAt': FieldValue.serverTimestamp(),
          });

          Snack_Bar(context, 'تم إنشاء الحساب بنجاح', color: Colors.green);

          // الانتقال إلى شاشة تسجيل الدخول
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Sign_in_Screen()));

          return 'تم إنشاء الحساب بنجاح';
        } else {
          Snack_Bar(context, 'فشل في إنشاء الحساب');
          return null;
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'حدث خطأ أثناء التسجيل';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'البريد مستخدم بالفعل';
        } else if (e.code == 'weak-password') {
          errorMessage = 'كلمة المرور ضعيفة جداً';
        }

        Snack_Bar(context, errorMessage);
        return null;
      } catch (e) {
        Snack_Bar(context, 'خطأ غير متوقع: ${e.toString()}');
        return null;
      } finally {
        isLoding = false;
        notifyListeners();
      }
    }

    return null;
  }

  //  Forget_password  ============================================

  Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    if (email.isEmpty) {
      Snack_Bar(context, 'يرجى إدخال البريد الإلكتروني.');
      return;
    }

    isLoding = true;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      Snack_Bar(context, 'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.', color: Colors.green);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Sign_in_Screen()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ غير متوقع.';
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'صيغة البريد الإلكتروني غير صحيحة.';
          break;
        case 'user-not-found':
          errorMessage = 'لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.';
          break;
        case 'too-many-requests':
          errorMessage = 'تم حظر الطلبات المؤقتة، يرجى المحاولة لاحقاً.';
          break;
      }
      Snack_Bar(context, errorMessage);
    } catch (e) {
      Snack_Bar(context, 'حدث خطأ أثناء إرسال الرابط.');
    } finally {
      isLoding = false;
      notifyListeners();
    }
  }

  // sign Out     ======================================================================================

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // مسح البيانات من SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Snack_Bar(context, ' تم تسجيل الخروج بنجاح', color: Colors.green);
      // إرجاع المستخدم لواجهة تسجيل الدخول
      pushAndRemoveUntil(context, const Sign_in_Screen());
    } catch (e) {
      Snack_Bar(context, 'فشل تسجيل الخروج');
      debugPrint('Logout Error: $e');
    }
  }

  ///  update Profile =====================================================================
  Future<void> updateProfile(
    BuildContext context, {
    required String username,
    required String email,
    required String phone,
    required String imageUrl,
  }) async {
    try {
      final uid = auth.currentUser!.uid;

      // 1. رفع الصورة إن وُجدت
      if (imageFile != null) {
        final ref = FirebaseStorage.instance.ref().child('users_img/$uid.jpg');
        await ref.putFile(imageFile!);
        imageUrl = await ref.getDownloadURL();
      }

      // 2. تجهيز بيانات التحديث
      final updateData = {
        'username': username,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
        'updatedAt': Timestamp.now(),
      };

      // 3. تحديث البيانات في Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set(updateData, SetOptions(merge: true));

      // 4. تحديث البيانات المحلية
      user = User_Model(
        uid: uid,
        username: username,
        email: email,
        phone: phone,
        createdAt: user?.createdAt ?? DateTime.now(),
        imageUrl: imageUrl,
      );

      notifyListeners();

      // ✅ إظهار الرسالة بعد النجاح
      Snack_Bar(context, 'تم حفظ التعديلات بنجاح', color: Colors.green);

      popRoute(context);
    } catch (e) {
      debugPrint('❌ Update Error: $e');
      // يمكنك عرض رسالة خطأ هنا إن أردت:
      Snack_Bar(context, 'حدث خطأ أثناء الحفظ', color: Colors.red);
      rethrow;
    }
  }

  // clear   ======================================================================================

  void clearFields() {
    username.clear();
    email.clear();
    password.clear();
    C_password.clear();
  }
}
