import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';
import 'package:musickuy_app/fitur/models/musik_model2.dart';
import 'package:musickuy_app/fitur/models/user_model.dart';

class PlayController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;
  PageController? pageController;


  CollectionReference playlistCollection =
      FirebaseCollectionConstants.getPlaylistCollection();

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  final RxList<MusikModel2>_playMusik = <MusikModel2>[].obs;
  RxList<MusikModel2> get playMusik =>_playMusik;

 /* final Rx<MusikModel> _musikModel = MusikModel(
          listens: '0',
          playlistId: '',
          playlistImage: '',
          namaPlaylist: '',
          pageType: Type.other,
          rating: 0,
          restoModel: PenyanyiModel(name: '', imagePenyanyi: ''),
          )
      .obs; */


 // Rx<PlaylistModel> get playlistModel => _playlistModel;
  //Rx<PlaylistModel> get musikModel => _musikModel;

  UserModel? userModel;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxBool _isLoadingFavorite = false.obs;
  RxBool get isLoadingFavorite => _isLoadingFavorite;

    String _musikId = '0';

    final Rx<MusikModel2> _musikModel = MusikModel2(
      musikId: '',
      judul:'',
      penyanyi: '',
      musikImage: '',
      durasi:0,
      pageTypee: PageTypee.other,
          )
      .obs;


        Rx<MusikModel2> get musikModel => _musikModel;


  //.................... bates

    CollectionReference musikCollection =
      FirebaseCollectionConstants.getMusikCollection();


          Future<void> getDetailMusik() async {
    _isLoading.value = true;
    try {
      final response = await musikCollection.doc(_musikId).get();
      _musikModel.value =
          MusikModel2.fromJson(response.data() as Map<String, dynamic>);
    } catch (e, st) {
      log('ERROR FROM GET DETAIL MUSIK $e $st');
    } finally {
      _isLoading.value = false;
    }
  }

  void runGetDetailMusik() async {
    final args = Get.arguments as Map<String, dynamic>;
    await getCurrentUser();
    if (args.isNotEmpty) {
      if (args.containsKey("id_musik")) {
        _musikId = args["id_musik"];
      }
      await getDetailMusik();
    }
  }

    

    Future<void> getMusikList() async {
    try {
      final data = await musikCollection
      //.where("judul", isEqualTo: PlayCard.judul)
          .get();
      for (final musik in data.docs) {
       _playMusik
            .add(MusikModel2.fromJson(musik.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET MUSIK LIST $e $st");
    }
  }


  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    userModel = UserModel.fromJson(userData);
    return userModel!;
  }



    Future<void> runGetMusik() async {
    _isLoading.value = true;
    try {
      await getMusikList();
    } catch (e) {
      log('ERROR FROM RUN GET MUSIK');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() {
    _isLoading.value = true;
    super.onInit();
   runGetMusik();
   runGetDetailMusik();
    pageController = PageController(viewportFraction: 0.85);
    
  }
}
