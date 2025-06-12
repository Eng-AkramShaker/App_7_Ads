import 'package:app_7/core/constants/app_sizes.dart';
import 'package:app_7/core/constants/show_dialog.dart';
import 'package:app_7/presentation/screens/add/widgets/add_ads_pic.dart';
import 'package:app_7/presentation/screens/add/widgets/adress_container.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/widgets/drop_down.dart';
import 'package:app_7/core/components/components.dart';
import 'package:app_7/presentation/widgets/custom_tex2.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/ColorManager.dart';
import '../controller/add_controller.dart';

class AddAds extends StatefulWidget {
  final MotionTabBarController controller;

  const AddAds({required this.controller, super.key});

  @override
  _AddAdsState createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  @override
  void initState() {
    super.initState();
    initializeData(context);
  }

  void initializeData(BuildContext context) {
    final proAdd = Provider.of<Add_Controller>(context, listen: false);
    proAdd.items_JsonData(context);
    proAdd.city_JsonData(context);
    proAdd.Status_JsonData(context);
    proAdd.Payment_JsonData(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer2<Cart_Controller, Add_Controller>(builder: (context, proCart, proAdd, child) {
      return Scaffold(
        backgroundColor: const Color(0xfffbfcfc),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'اضافة اعلان',
            style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                const AddAdsPicture(),
                const SizedBox(height: 30),

                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCityDropDown(proAdd, size),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: CustomContainer(
                    text: 'العنوان*',
                    controller: proAdd.location,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 14),
                      child: Drop_Down_Items(
                        w: size.width / 1.49,
                        title: '* أختر القسم بدقة ',
                        selectedValue: proAdd.selectItems ?? '',
                        genderItems: proAdd.data_Items_json,
                        onChanged: (value) => setState(() {
                          proAdd.selectItems = value;
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: CustomContainer2(text: ' السعر  ج.م *', controller: proAdd.price),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 14),
                      child: _buildStatusDropDown(proAdd, size),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 14),
                      child: _buildPaymentDropDown(proAdd, size),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: CustomContainer(text: 'أكتب العلامة التجارية أو الماركة ', controller: proAdd.brand),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: CustomContainer(text: 'الموديل / سنة الصنع', controller: proAdd.model),
                ),
                const SizedBox(height: 20),
                CustomContainer(h: 130, text: 'أكتب وصف تفصيلي ...*', maxLine: 4, controller: proAdd.description),
                const SizedBox(height: 20),
                CustomContainer(text: '! ملحوظة  ', controller: proAdd.note),
                SizedBox(height: 0.1 * size.width),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: customButton(
                    text: 'الانتقال إلى صفحة تنزيل الإعلان',
                    onTap: () {
                      _showDownloadAdsDialog(proCart, proAdd);
                    },
                    width: double.infinity,
                    color: ColorManager.primary,
                    textcolor: ColorManager.w_color,
                    textSize: 20,
                    height: size.height * 0.09,
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCityDropDown(Add_Controller proAdd, Size size) {
    return Drop_Down_City(
      w: size.width / 1.49,
      title: "*  أختر المدينة",
      selectedValueCity: proAdd.selectedValue_City ?? '',
      cityItems: proAdd.data_City_json,
      onChanged: (value) => setState(() {
        proAdd.selectedValue_City = value;
      }),
    );
  }

  Widget _buildStatusDropDown(Add_Controller proAdd, Size size) {
    return Drop_Down_Items(
      w: size.width / 1.49,
      title: '* أختر الحالة',
      selectedValue: proAdd.select_Status ?? '',
      genderItems: proAdd.data_Status_json,
      onChanged: (value) => setState(() {
        proAdd.select_Status = value;
      }),
    );
  }

  Widget _buildPaymentDropDown(Add_Controller proAdd, Size size) {
    return Drop_Down_Items(
      w: size.width / 1.49,
      title: '* أختر الدفع',
      selectedValue: proAdd.select_Payment ?? '',
      genderItems: proAdd.data_Payment_json,
      onChanged: (value) => setState(() {
        proAdd.select_Payment = value;
      }),
    );
  }

  _showDownloadAdsDialog(Cart_Controller proCart, Add_Controller proAdd) {
    Snack_Select_Menu(
      context: context,
      button_tex: 'تنزيل الإعلان',
      widget: SizedBox(
        height: height_media(context) / 2.5,
        child: Consumer<Add_Controller>(builder: (context, proAdd, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: CustomText(
                    text: 'إضافة إعلان',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),

                // تنبيه رئيسي

                Center(
                  child: CustomText(
                    text: 'أنت على وشك تنزيل إعلانك',
                    fontSize: 13,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),

                // النقاط
                Center(
                  child: CustomText(
                    text: "إذا كنت تمتلك نقاط يمكنك استبدالها برصيد المحفظة\nواستخدامها في إعلاناتك",
                    fontSize: 13,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),

                // الشروط والأحكام
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(text: "أوافق على الشروط والأحكام", fontSize: 13),
                    Checkbox(
                      value: proAdd.selectedOption,
                      activeColor: ColorManager.redColor,
                      onChanged: (bool? value) {
                        proAdd.set_SelectedOption(value!);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // ملاحظة
                CustomText(
                  text: '* ملحوظة',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.redColor,
                ),
                const SizedBox(height: 6),
                CustomText(
                  text: 'سوف يتم مراجعة الإعلان طبقاً للشروط والأحكام، وإشعارك بالظهور خلال ٤٨ ساعة.',
                  fontSize: 13,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          );
        }),
      ),
      onPressed: () async {
        proAdd.upload_ALL_Data_to_Firebase(
          context,
          proCart,
          selectedValue_City: proAdd.selectedValue_City,
          location: proAdd.location.text,
          selectItems: proAdd.selectItems,
          price: proAdd.price.text,
          select_Status: proAdd.select_Status,
          select_Payment: proAdd.select_Payment,
          brand: proAdd.brand.text,
          model: proAdd.model.text,
          description: proAdd.description.text,
          note: proAdd.note.text,
          num_views: 0,
        );
      },
    );
  }
}

// ======================================================================
