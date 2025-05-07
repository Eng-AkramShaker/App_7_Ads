// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, unused_element, prefer_typing_uninitialized_variables, unused_field, unused_local_variable

import 'dart:io';
import 'package:app_7/core/constants/navigators.dart';
import 'package:app_7/presentation/screens/add/widgets/photo_album.dart';
import 'package:app_7/presentation/screens/add/widgets/show/show_congratulations.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/widgets/snack_bar/Snack_Bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';

class Add_Controller extends ChangeNotifier {
  //

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();

  bool selectedOption = false;

  List data_City_json = [];
  List data_Items_json = [];
  List data_Status_json = [];
  List data_Payment_json = [];

  //

  final ImagePicker picker = ImagePicker();
  List<XFile?> list_images = [];

  String? selectedValue_City;
  TextEditingController location = TextEditingController();
  String? selectItems;
  TextEditingController price = TextEditingController();
  String? select_Status;

  String? select_Payment;
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController note = TextEditingController();

  // =====================================================================================================

  List city_list = [
    {"ar": "الكل", "en": "Cairo"},
    {"ar": "القاهرة", "en": "Cairo"},
    {"ar": "الجيزة", "en": "Giza"},
    {"ar": "الأسكندرية", "en": "Alexandria"},
    {"ar": "الدقهلية", "en": "Dakahlia"},
    {"ar": "البحر الأحمر", "en": "Red Sea"},
    {"ar": "البحيرة", "en": "Beheira"},
    {"ar": "الفيوم", "en": "Fayoum"},
    {"ar": "الغربية", "en": "Gharbiya"},
    {"ar": "الإسماعلية", "en": "Ismailia"},
    {"ar": "المنوفية", "en": "Menofia"},
    {"ar": "المنيا", "en": "Minya"},
    {"ar": "القليوبية", "en": "Qaliubiya"},
    {"ar": "الوادي الجديد", "en": "New Valley"},
    {"ar": "السويس", "en": "Suez"},
    {"ar": "اسوان", "en": "Aswan"},
    {"ar": "اسيوط", "en": "Assiut"},
    {"ar": "بني سويف", "en": "Beni Suef"},
    {"ar": "بورسعيد", "en": "Port Said"},
    {"ar": "دمياط", "en": "Damietta"},
    {"ar": "الشرقية", "en": "Sharkia"},
    {"ar": "جنوب سيناء", "en": "South Sinai"},
    {"ar": "كفر الشيخ", "en": "Kafr Al sheikh"},
    {"ar": "مطروح", "en": "Matrouh"},
    {"ar": "الأقصر", "en": "Luxor"},
    {"ar": "قنا", "en": "Qena"},
    {"ar": "شمال سيناء", "en": "North Sinai"},
    {"ar": "سوهاج", "en": "Sohag"}
  ];

  city_JsonData(context) async {
    data_City_json = [];
    for (var i in city_list) {
      data_City_json.add(i['ar']);
    }
  }

  // =========
  List data_Items = [
    {"ar": "الكل", "en": "Cairo"},
    {"ar": "عقارات", "en": "Cairo"},
    {"ar": "اجهزة منزلية", "en": "Giza"},
    {"ar": "اجهزة رياضة", "en": "Dakahlia"},
    {"ar": "سيارات", "en": "Alexandria"},
    {"ar": "موبايلات واكسسوارات", "en": "Red Sea"},
    {"ar": "كمبيوتر ولاب توب", "en": "Beheira"},
    {"ar": "اليكترونيات", "en": "Fayoum"},
    {"ar": "وظائف", "en": "Gharbiya"},
    {"ar": "شريك أو شركاء", "en": "Ismailia"},
    {"ar": "ملابس", "en": "Menofia"},
    {"ar": "مستحضرات تجميل", "en": "Minya"},
    {"ar": "كافيهات", "en": "Qaliubiya"},
    {"ar": "مطاعم", "en": "New Valley"},
    {"ar": "صيدليات", "en": "Suez"},
    {"ar": "عيادات", "en": "Aswan"},
    {"ar": "ادوات مدرسية ومكتبة", "en": "Assiut"},
    {"ar": "فنون", "en": "Beni Suef"},
    {"ar": "اشغال يدوية", "en": "Port Said"},
    {"ar": "حيوانات ومستلزماتها", "en": "Damietta"},
    {"ar": "صناعة", "en": "Sharkia"},
    {"ar": "زراعة وحدائق", "en": "South Sinai"},
    {"ar": "صيانة", "en": "Kafr Al sheikh"},
    {"ar": "خدمات اخري (متنوعة)", "en": "Matrouh"}
  ];

  items_JsonData(context) async {
    data_Items_json = [];

    for (var i in data_Items) {
      data_Items_json.add(i['ar']);
    }
  }

  // =========
  List data_Status = [
    {"ar": "جديد", "en": "New"},
    {"ar": "مستعمل", "en": ""},
    {"ar": "إستيراد", "en": ""},
  ];

  Status_JsonData(context) async {
    data_Status_json = [];
    for (var i in data_Status) {
      data_Status_json.add(i['ar']);
    }
  }

  // =========
  List data_Payment = [
    {"ar": "كاش", "en": "New"},
    {"ar": "قسط", "en": ""},
    {"ar": "أخري", "en": ""},
  ];

  Payment_JsonData(context) async {
    data_Payment_json = [];
    for (var i in data_Payment) {
      data_Payment_json.add(i['ar']);
    }
  }

  //  Select Image Picker ------------------------------------------------------------------

  Future<void> pickImages(BuildContext context) async {
    // طلب الإذن للوصول إلى الصور
    final PermissionState permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      debugPrint('الإذن مرفوض. فتح إعدادات الجهاز...');
      PhotoManager.openSetting();
      return;
    }

    debugPrint('تم منح الإذن للوصول إلى الصور');

    // جلب الصور من المعرض
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true, // جلب ألبوم الصور الرئيسي فقط
    );

    if (albums.isNotEmpty) {
      // الحصول على الصور من الألبوم
      final List<AssetEntity> photos = await albums.first.getAssetListPaged(page: 0, size: 1000);

      // فتح شاشة لاختيار الصور
      final List<AssetEntity>? selectedAssets = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Photo_Album_Screen(
            photos: photos,
            maxImages: 5,
          ),
        ),
      );

      if (selectedAssets != null) {
        // تحويل الصور إلى قائمة XFile
        list_images = await Future.wait(selectedAssets.map((asset) async {
          final file = await asset.file;
          return file != null ? XFile(file.path) : null;
        }));

        notifyListeners();
      } else {
        debugPrint('لم يتم اختيار أي صور.');
      }
    } else {
      debugPrint('لا توجد صور في الألبوم.');
    }
  }

  //  set Selected Option ------------------------------------------------------------------

  set_SelectedOption(bool value) {
    selectedOption = value;
    notifyListeners();
  }

  //  Upload Data ------------------------------------------------------------------

  Future<void> upload_ALL_Data_to_Firebase(
    context,
    Cart_Controller proCart, {
    required String? selectedValue_City,
    required String? location,
    required String? selectItems,
    required String? price,
    required String? select_Status,
    required String? select_Payment,
    required String? brand,
    required String? model,
    required String? description,
    required String? note,
    required int? num_views,
  }) async {
    String Date = DateFormat('yyyy-MM-dd').format(now);

    if (selectedValue_City == null ||
        location == null ||
        selectItems == null ||
        price == null ||
        select_Status == null ||
        select_Payment == null ||
        brand == null ||
        model == null ||
        description == null ||
        note == null ||
        num_views == null) {
      //

      await pop(context);

      Snack_Bar(context, Colors.green, " ! يوجد حقل فارغ");
    } else {
      try {
        if (selectedOption == true) {
          await pop(context);

          Snack_Bar(context, Colors.green, " جاري التحميل ....");

          Map<String, dynamic> data = {
            'selectedValue_City': selectedValue_City,
            'location': location,
            'selectItems': selectItems,
            'price': price,
            'select_Status': select_Status,
            'select_Payment': select_Payment,
            'Brand': brand,
            'model': model,
            'description': description,
            'note': note,
            'date': Date,
            'action': 'false',
            'num_views': num_views,
          };

          await uploadImagesAndData(location, list_images, data);

          proCart.get_Values_Ads_Stream();

          await Show_Congratulations_Dialog(context);

          reset_Values();
        } else {
          await pop(context);

          selectedOption = false;

          Snack_Bar(context, Colors.red, "يرجى الموافقة على الشروط والأحكام قبل المتابعة.");
        }

        notifyListeners();
      } catch (e) {
        Snack_Bar(context, Colors.red, 'Error uploading data: $e');
      }
    }
  }

  //

  reset_Values() {
    list_images = [];

    selectedOption = false;

    selectedValue_City = '';
    selectItems = '';
    select_Status = '';
    select_Payment = '';
    location.text = '';
    price.text = '';
    brand.text = '';
    model.text = '';
    description.text = '';
    note.text = '';

    notifyListeners();
  }

  //
  Future<void> uploadImagesAndData(String folderName, List images, Map<String, dynamic> data) async {
    try {
      final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
      List<String> uploadedImageUrls = [];

      for (XFile image in images) {
        final String fileName = image.name;
        final firebase_storage.Reference ref = storage.ref('$folderName/$fileName');
        await ref.putFile(File(image.path));
        final String downloadUrl = await ref.getDownloadURL();
        uploadedImageUrls.add(downloadUrl);
      }

      final docRef = firestore.collection('Values_Ads').doc();
      final docId = docRef.id;

      await docRef.set({
        ...data,
        'imageUrls': uploadedImageUrls,
        'id': docId,
      });

      print('Data and images uploaded successfully with ID: $docId');
    } catch (e) {
      print('Error uploading images and data: $e');
    }
  }
}
