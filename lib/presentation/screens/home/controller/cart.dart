// ignore_for_file: prefer_final_fields, camel_case_types, non_constant_identifier_names, avoid_print, unused_local_variable

import 'package:app_7/model/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart_Controller extends ChangeNotifier {
  double _price = 0;

  List<Map<String, dynamic>> list_favourites = [];
  bool favourites = false;

// --------------------------------------------------------------------------

  List<Map<String, dynamic>> List_Values_Ads = [];

// --------------------------------------------------------------------------

  int _myNumber = 0;
  int get myNumber => _myNumber;

  void updateNumber(int newNumber) {
    _myNumber = newNumber;
    notifyListeners();
  }

  // =========================================================================

  void add(item) {
    list_favourites.add(item);

    notifyListeners();
  }

  void remove(item) {
    list_favourites.remove(item);

    notifyListeners();
  }

  int get count {
    return list_favourites.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Item> get basket {
    return [];
  }

  // get Values Ads Stream  ----------------------------------------------------------

  Future<Stream<QuerySnapshot<Object?>>> get_Values_Ads_Stream() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    List_Values_Ads = [];

    try {
      QuerySnapshot snapshot = await firestore.collection('Values_Ads').get();
      for (var doc in snapshot.docs) {
        List_Values_Ads.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching advertisements: $e');
    }

    for (var ad in List_Values_Ads) {
      ad['action_favourier'] = 'false';
    }

    for (var fav in list_favourites) {
      for (var ad in List_Values_Ads) {
        if (fav['location'] == ad['location']) {
          ad['action_favourier'] = 'true';
        }
      }
    }

    notifyListeners();

    return firestore.collection('Values_Ads').snapshots();
  }

  // update num Views  ----------------------------------------------------------

  update_num_Views(String id_doc, int num) async {
    await FirebaseFirestore.instance.collection('Values_Ads').doc(id_doc).update(
      {
        "num_views": num + 1,
      },
    );

    get_Values_Ads_Stream();
  }

  // update favourites  ----------------------------------------------------------

  update_Favourites(String id_doc, String action) async {
    if (action == 'true') {
      await FirebaseFirestore.instance.collection('Values_Ads').doc(id_doc).update(
        {
          "action": "false",
        },
      );
    } else {
      await FirebaseFirestore.instance.collection('Values_Ads').doc(id_doc).update(
        {
          "action": "true",
        },
      );
    }

    get_Values_Ads_Stream();
  }
}
