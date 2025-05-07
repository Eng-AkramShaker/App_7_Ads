// ignore_for_file: avoid_print, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:io';
import 'package:app_7/core/constants/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/add_controller.dart';

class AddAdsPicture extends StatefulWidget {
  const AddAdsPicture({super.key});

  @override
  _AddAdsPictureState createState() => _AddAdsPictureState();
}

class _AddAdsPictureState extends State<AddAdsPicture> {
  Add_Controller add_ctl = Add_Controller();
  @override
  void initState() {
    add_ctl = Provider.of<Add_Controller>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    add_ctl = Provider.of<Add_Controller>(context, listen: false);

    return Consumer<Add_Controller>(builder: (context, add_ctl, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primary, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'أضف صورة الاعلان',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () async {
                        add_ctl.pickImages(context);
                      },
                    ),
                  ),
                ],
              ),
            ),

            //

            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: add_ctl.list_images.isNotEmpty
                  ? ListView.builder(
                      itemCount: add_ctl.list_images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Image.file(File(add_ctl.list_images[index]!.path), fit: BoxFit.contain),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("يمكنك اختيار بحد اقصي 5 صور "),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
