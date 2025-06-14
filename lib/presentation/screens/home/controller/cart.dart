// ignore_for_file: prefer_final_fields, camel_case_types, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart_Controller extends ChangeNotifier {
  double _price = 0;

  List<Map<String, dynamic>> list_favourites = [];
  bool favourites = false;

  List<Map<String, dynamic>> List_Values_Ads = [];

  int _myNumber = 0;
  int get myNumber => _myNumber;

  int get count => list_favourites.length;
  double get totalPrice => _price;

  // ========================================================================

  List<Map<String, dynamic>> allAds = []; // جميع الإعلانات الأصلية

  //  بحث ============================================================

  void filterByAll({
    String? city,
    String? category,
    String? description,
  }) {
    allAds = List_Values_Ads.where((ad) {
      final matchCity = (city == null || city.isEmpty || city == 'الكل') || ad['selectedValue_City'] == city;
      final matchCategory = (category == null || category.isEmpty || category == 'الكل') || ad['selectItems'] == category;
      final matchDesc = (description == null || description.isEmpty) ||
          (ad['description']?.toLowerCase().contains(description.toLowerCase()) ?? false);

      return matchCity && matchCategory && matchDesc;
    }).toList();

    notifyListeners();
  }

  // ======================================================================

  void updateNumber(int newNumber) {
    _myNumber = newNumber;
    notifyListeners();
  }

  void add(Map<String, dynamic> item) {
    list_favourites.add(item);
    notifyListeners();
  }

  void remove(Map<String, dynamic> item) {
    list_favourites.removeWhere((e) => e['id'] == item['id']);
    notifyListeners();
  }

  // DBتحميل الإعلانات من القاعدة
  Future<Stream<QuerySnapshot<Object?>>> get_Values_Ads_Stream() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    List_Values_Ads.clear();

    try {
      QuerySnapshot snapshot = await firestore.collection('Values_Ads').get();
      for (var doc in snapshot.docs) {
        final adData = doc.data() as Map<String, dynamic>;
        adData['id'] = doc.id;
        adData['action_favourier'] = 'false'; // Default
        List_Values_Ads.add(adData);
      }

      if (user != null) {
        await loadUserFavorites(); // تحميل المفضلات من Firestore

        // تفعيل الإعلانات التي تم حفظها كمفضلة
        for (var ad in List_Values_Ads) {
          final isFav = list_favourites.any((fav) => fav['id'] == ad['id']);
          ad['action_favourier'] = isFav ? 'true' : 'false';
        }
      }
    } catch (e) {
      print('Error fetching ads: $e');
    }

    notifyListeners();
    return firestore.collection('Values_Ads').snapshots();
  }

  // تحديث عدد المشاهدات
  Future<void> update_num_Views(String id_doc, int num) async {
    await FirebaseFirestore.instance.collection('Values_Ads').doc(id_doc).update({
      "num_views": num + 1,
    });
    await get_Values_Ads_Stream();
  }

  // حفظ أو حذف إعلان من المفضلة في Firestore
  Future<void> updateFavoriteStatus({required bool isAdding, required Map<String, dynamic> adData}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print("User not logged in");
        return;
      }

      final favRef = FirebaseFirestore.instance.collection('users').doc(userId).collection('favourites').doc(adData['id']);

      if (isAdding) {
        await favRef.set(adData);
        list_favourites.add(adData);
        print("Ad added to favourites");
      } else {
        await favRef.delete();
        list_favourites.removeWhere((item) => item['id'] == adData['id']);
        print("Ad removed from favourites");
      }

      notifyListeners();
    } catch (e) {
      print('❌ Error in updateFavoriteStatus: $e');
    }
  }

  // تحميل المفضلات من Firestore
  Future<void> loadUserFavorites() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final uid = user.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).collection('favorites').get();

    list_favourites = snapshot.docs.map((doc) => doc.data()).toList();

    notifyListeners();
  }
//
}
