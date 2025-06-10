import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/more/profile/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<Auth_Controller>(context, listen: false).user!;
    _userNameController = TextEditingController(text: user.username);
    _phoneController = TextEditingController(text: user.phone);
    _emailController = TextEditingController(text: user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth_Controller>(builder: (context, proAuth, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorManager.w_color,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'تعديل البيانات',
              style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  GestureDetector(
                    onTap: proAuth.pickImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: proAuth.imageFile != null
                              ? FileImage(proAuth.imageFile!)
                              : const AssetImage('assets/images/user.png') as ImageProvider,
                        ),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: ColorManager.primary,
                          child: Icon(Icons.edit, color: Colors.white, size: 18),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  buildEditableField(_userNameController, 'اسم المستخدم', Icons.person),
                  const SizedBox(height: 15),
                  buildEditableField(_phoneController, 'رقم الهاتف', Icons.phone),
                  const SizedBox(height: 15),
                  buildEditableField(_emailController, 'البريد الإلكتروني', Icons.email),

                  const SizedBox(height: 50),

                  // ======================================

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () async {
                      // حفظ التغييرات هنا

                      await proAuth.updateProfile(
                        context,
                        username: _userNameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        imageUrl: proAuth.imageFile!.path,
                      );
                    },
                    child: const Text(
                      'حفظ التغييرات',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
