// ignore_for_file: unnecessary_import, unused_import, library_private_types_in_public_api, use_full_hex_values_for_flutter_colors, avoid_print, use_build_context_synchronously, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, camel_case_types, must_be_immutable, prefer_const_literals_to_create_immutables

import 'dart:collection';
import 'dart:ffi';
import 'package:app_7_ads/constes/ColorManager.dart';
import 'package:app_7_ads/controller/home_controller.dart';
import 'package:app_7_ads/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //

  @override
  void initState() {
    super.initState();
    inits();
  }

  inits() async {}

  // --------------------------------------------------------------------

  final crl_home = Get.find<Controller_Home>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: custom_AppBar(context: context, title: 'Companies'),
        resizeToAvoidBottomInset: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorManager.w_FA,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Card(
                    child: Text('${crl_home.counter}'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        crl_home.addCounter();
                      },
                      child: Text('data')),
                  // =================================================

                  Container(
                    margin: const EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(25.7)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5, //spread radius
                          blurRadius: 8, // blur radius
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: null,
                        autofocus: false,
                        style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green,
                          hintText: 'Username',
                          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.green),
                        BoxShadow(color: Colors.white70, spreadRadius: -5.0, blurRadius: 20.0),
                      ],
                    ),
                    child: Center(
                      child: Text('Geeks for Geeks'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "You phone number here...",
                            border: InputBorder.none,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
