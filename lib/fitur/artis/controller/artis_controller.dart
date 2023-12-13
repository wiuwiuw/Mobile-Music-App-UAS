import 'package:get/get.dart';
import 'dart:developer';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:musickuy_app/fitur/models/favorite_model.dart';
import 'package:musickuy_app/fitur/models/penyanyi_model.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class FavoriteController extends GetxController {

    PageController? pageController;
      final RxBool _isGrid = false.obs;
  RxBool get isGrid => _isGrid;


  CollectionReference penyanyiCollection =
    FirebaseCollectionConstants.getPenyanyiCollection();

  final RxList<PenyanyiModel>_penyanyi = <PenyanyiModel>[].obs;
  RxList<PenyanyiModel> get penyanyi =>_penyanyi;

    final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxInt _indexSlider = 0.obs;
  RxInt get indexSlider => _indexSlider;

    void changeIndex(int value) {
    _indexSlider.value = value;
  }

  
  Future<void> getPenyanyi() async {
    try {
      final data = await penyanyiCollection
          .get();
      for (final penyanyi in data.docs) {
       _penyanyi
            .add(PenyanyiModel.fromJson(penyanyi.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET FAVORITE PLAYLIST $e $st");
    }
  }



  void toggleIsGrid() {
    _isGrid.toggle();
  }
    Future<void> runGetPenyanyi() async {
    _isLoading.value = true;
    try {
      await getPenyanyi();
    } catch (e) {
      log('ERROR FROM RUN GET PLAYLIST');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(viewportFraction: 0.85);
    await runGetPenyanyi();
  }
}
