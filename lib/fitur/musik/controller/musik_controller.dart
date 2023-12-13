import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';
import 'package:musickuy_app/fitur/models/musik_model2.dart';

class PromoController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxList<PlaylistModel> _onlyForYouProductList = <PlaylistModel>[].obs;
  RxList<PlaylistModel> get onlyForYouProductList => _onlyForYouProductList;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getPlaylistCollection();


      //------------------

  final RxList<MusikModel2>_musikList = <MusikModel2>[].obs;
  RxList<MusikModel2> get musikList =>_musikList;

    final RxList<MusikModel2>_musikFT = <MusikModel2>[].obs;
  RxList<MusikModel2> get musikFT =>_musikFT;

    CollectionReference musikCollection =
      FirebaseCollectionConstants.getMusikCollection();

    Future<void> getMusikList() async {
    try {
      final data = await musikCollection
      .where("page_type", isEqualTo: "onlyForYou")
          .get();
      for (final musik in data.docs) {
       _musikList
            .add(MusikModel2.fromJson(musik.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET MUSIK LIST $e $st");
    }
  }

      Future<void> runGetMusik() async {
    _isLoading.value = true;
    try {
      await getMusikList();
      await getMusikFT();
    } catch (e) {
      log('ERROR FROM RUN GET PLAYLIST');
    } finally {
      _isLoading.value = false;
    }
  }


      Future<void> getMusikFT() async {
    try {
      final data = await musikCollection
      .where("page_type", isEqualTo: "fastTrack")
          .get();
      for (final musik in data.docs) {
       _musikFT
            .add(MusikModel2.fromJson(musik.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET MUSIK LIST $e $st");
    }
  }

  @override
  void onInit() async {
    await runGetMusik();
   // await runGetMusikFT();
    super.onInit();
  }
}
