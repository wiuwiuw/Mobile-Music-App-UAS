import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';
import 'package:musickuy_app/fitur/models/penyanyi_model.dart';
import 'package:musickuy_app/fitur/models/musik_model.dart';
import 'package:musickuy_app/fitur/models/musik_model2.dart';
import 'package:musickuy_app/fitur/models/user_model.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';

class DetailController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;
  PageController? pageController;

  String _playlistId = '0';

  CollectionReference playlistCollection =
      FirebaseCollectionConstants.getPlaylistCollection();

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  final Rx<PlaylistModel> _playlistModel = PlaylistModel(
          listens: '0',
          playlistId: '',
          playlistImage: '',
          namaPlaylist: '',
          type: Type.other,
          rating: 0,
          )
      .obs;


  Rx<PlaylistModel> get playlistModel => _playlistModel;
  //Rx<PlaylistModel> get musikModel => _musikModel;

  UserModel? userModel;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxBool _isLoadingFavorite = false.obs;
  RxBool get isLoadingFavorite => _isLoadingFavorite;


  //.................... bates
  final RxList<MusikModel2>_musikList = <MusikModel2>[].obs;
  RxList<MusikModel2> get musikList =>_musikList;

    CollectionReference musikCollection =
      FirebaseCollectionConstants.getMusikCollection();

    Future<void> getMusikList() async {
    try {
      final data = await musikCollection
          .get();
      for (final musik in data.docs) {
       _musikList
            .add(MusikModel2.fromJson(musik.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET MUSIK LIST $e $st");
    }
  }


  Future<void> addToFav(
      String playlistId, Map<String, dynamic> user, String userEmail) async {
    try {
      List<String> favList = List.from(user["playlistFavorite"]);
      favList.add(playlistId);
      await userCollection.doc(userEmail).update({"playlistFavorite": favList});
    } catch (e) {
      print('ERROR FROM ADD TO FAV $e');
    }
  }

  Future<void> removeFromFav(
      String playlistId, Map<String, dynamic> user, String userEmail) async {
    try {
      List<String> favList = List.from(user["playlistFavorite"]);
      favList.remove(playlistId);
      await userCollection.doc(userEmail).update({"playlistFavorite": favList});
    } catch (e) {
      print('ERROR FROM REMOVE FROM FAV $e');
    }
  }

  void handleFavorite(String playlistId) async {
    _isLoadingFavorite.value = true;
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    List<String> favList = List.from(userData["playlistFavorite"]);
    if (favList.contains(playlistId)) {
      await removeFromFav(playlistId, userData, userPrefs["email"]);
    } else {
      await addToFav(playlistId, userData, userPrefs["email"]);
    }
    await getCurrentUser();
    _isLoadingFavorite.value = false;
  }

  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    userModel = UserModel.fromJson(userData);
    return userModel!;
  }

  Future<void> getDetailPlaylist() async {
    _isLoading.value = true;
    try {
      final response = await playlistCollection.doc(_playlistId).get();
      _playlistModel.value =
          PlaylistModel.fromJson(response.data() as Map<String, dynamic>);
    } catch (e, st) {
      log('ERROR FROM GET DETAIL PLAYLIST $e $st');
    } finally {
      _isLoading.value = false;
    }
  }

  void runGetDetailPlaylist() async {
    final args = Get.arguments as Map<String, dynamic>;
    await getCurrentUser();
    if (args.isNotEmpty) {
      if (args.containsKey("playlist_id")) {
        _playlistId = args["playlist_id"];
      }
      await getDetailPlaylist();
    }
  }

    Future<void> runGetMusik() async {
    _isLoading.value = true;
    try {
      await getMusikList();
    } catch (e) {
      log('ERROR FROM RUN GET PLAYLIST');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() {
    _isLoading.value = true;
    runGetDetailPlaylist();
    super.onInit();
   runGetMusik();
    pageController = PageController(viewportFraction: 0.85);
    
  }
}
