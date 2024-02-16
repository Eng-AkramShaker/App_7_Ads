import 'package:app7ads/components/components.dart';
import 'package:app7ads/widgets/custom_tex2.dart';
import 'package:app7ads/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constes/ColorManager.dart';

class AddAds extends StatefulWidget {
   AddAds({Key? key}) : super(key: key);

  var addressController =TextEditingController() ;
  var descriptionController =TextEditingController() ;

  @override
  State<AddAds> createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(
          text:'اضافة اعلان',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.w_FA,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.b_69.withOpacity(0.9),


      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20 ,right: 20),
             child: Container(
               width: double.infinity,
               height: MediaQuery.of(context).size.height *0.2,
               decoration: BoxDecoration(
                 border: Border.all(color: ColorManager.b_69 ,width: 2 ) ,
                 borderRadius: BorderRadius.circular(20) ,
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomText(
                     text: 'أضف صورة الاعلان' ,
                     fontSize: 12,
                     fontWeight: FontWeight.bold,
                     color: ColorManager.b_69,
                   ),
                   SizedBox(height: 10,) ,

                   CircleAvatar(
                     backgroundColor: ColorManager.b_69,
                       child: Icon(Icons.add,color: ColorManager.w_color,)) ,
                 ],
               ),

             ),
           ) ,
          SizedBox(height: 30,) ,
          Padding(

            padding: const EdgeInsets.only(left: 13,right: 13),
            child: CustomTextField(
              height: 50,
              centerText: true,
              lableStyle: TextStyle(fontSize: 15,color: ColorManager.b_69,),
              lable: ' العنوان  ',
              controller:widget.addressController ,
              borderColor: ColorManager.b_69,
              hasBorder: true,
              radius: 10,


              style: TextStyle(
                color: ColorManager.b_69 ,
                fontSize: 15
              ),
              textInputType: TextInputType.text,

              icon: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorManager.b_69,
                    child: Icon(Icons.place ,color: ColorManager.w_color,),
                ),
              ),
            ),
          ) ,
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 13,right: 13),
            child: CustomTextField(
              centerText: true,
              lableStyle: TextStyle(fontSize: 15,color: ColorManager.b_69,),
              lable: 'وصف الاعلان ',
              controller:widget.descriptionController ,
              borderColor: ColorManager.b_69,
              hasBorder: true,
              radius: 10,

              style: TextStyle(
                  color: ColorManager.b_69 ,
                  fontSize: 15
              ),
              textInputType: TextInputType.text,

              icon: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorManager.b_69,
                  child: Icon(Icons.text_fields ,color: ColorManager.w_color,),
                ),
              ),
            ),
          ) ,
          Spacer() ,
          Padding(
            padding: const EdgeInsets.only(left: 10 ,right: 10),
            child: myButton(text: 'اضف الاعلان', onTap:(){} ,
              width: double.infinity ,
              color: ColorManager.b_69 ,
              textcolor: ColorManager.w_color ,
              textSize: 20 ,
               height: MediaQuery.of(context).size.height *0.09 ,



            ),
          ) ,
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
