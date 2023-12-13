import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/constant/constants_firebase_collections.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';
import 'package:musickuy_app/fitur/models/user_model.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class HomeController extends GetxController {
  PageController? pageController;

  final Rx<UserModel> _userModel = UserModel(
          id: '',
          uid: '',
          accessToken: '',
          token: '',
          fullName: '',
          userName: '',
          email: '',
          password: '',
          createdAt: DateTime.now(),
          productFavorite: [],
          playlistFavorite: [],
          photoUrl: '')
      .obs;
  Rx<UserModel> get userModel => _userModel;

  final RxList<PlaylistModel>_favoritePlaylistList = <PlaylistModel>[].obs;
  RxList<PlaylistModel> get favoritePlaylistList =>_favoritePlaylistList;

  final RxBool _isLoadingGetUser = false.obs;
  RxBool get isLoadingGetUser => _isLoadingGetUser;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxInt _indexSlider = 0.obs;
  RxInt get indexSlider => _indexSlider;

  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();

  CollectionReference playlistCollection =
      FirebaseCollectionConstants.getPlaylistCollection();

  void changeIndex(int value) {
    _indexSlider.value = value;
  }

  Future<void> getFavoritePlaylist() async {
    try {
      final data = await playlistCollection
          .where("type", isEqualTo: "foryou")
          .get();
      for (final playlist in data.docs) {
       _favoritePlaylistList
            .add(PlaylistModel.fromJson(playlist.data() as Map<String, dynamic>));
      }
    } catch (e, st) {
      print("ERROR FROM GET FAVORITE PLAYLIST $e $st");
    }
  }

  final List<Map<String, dynamic>> cardList = [
    {
      'imageUrl': 'assets/album/more_album.png',
      'isCenter': false,
      'contentWidget' :             
              Flexible(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                   Text(
                      "Dengerin Yuk!",
                       style: ConstantTextStyle.stylePoppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 12),
                    Text("Buat harimu menyenangkan dengan musik",
                    style: ConstantTextStyle.stylePoppins(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(height: 10),
                     FilledButton(
                      onPressed: () {},
                      child: Text("Play now",
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                      ), ),
                    ),
                  ],
                ),
              ),

    },
    {
      'imageUrl': 'assets/album/galau_album.jpg',
      'isCenter': true,
      'contentWidget' :  
                Flexible(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 11),
                   Text(
                      "Galau Ya?",
                       style: ConstantTextStyle.stylePoppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 15),
                    Text("Mending asikin aja, bawa santai aja brodyy",
                    style: ConstantTextStyle.stylePoppins(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                      ),),
                      SizedBox(height: 20),
                     FilledButton(
                      onPressed: () {},
                      child: Text("Play now",
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                      ), ),
                    ),
                  ],
                ),
              ),
    },
    
  ];

  final categoryList = [
    {'imageUrl': 'assets/icon_music/blues.png', 'label': 'Blues'},
    {'imageUrl': 'assets/icon_music/kpop.png', 'label': 'K-Pop'},
    {'imageUrl': 'assets/icon_music/dj-music.png', 'label': 'DJ'},
    {'imageUrl': 'assets/icon_music/hip-hop.png', 'label': 'Hip Hop'},
    {'imageUrl': 'assets/icon_music/music.png', 'label': 'POP'},
    {'imageUrl': 'assets/icon_music/rock.png', 'label': 'Rock'},
  ];

  Future<UserModel> getCurrentUser() async {
    _isLoadingGetUser.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString('user');
      final userDecode = jsonDecode(user!);
      _userModel.value = UserModel.fromJson(userDecode);
      print('CURRENT USER ${_userModel.toJson()}');
      return _userModel.value;
    } catch (e) {
      print("ERROR GET CURRENT USER $e");
      return _userModel.value;
    } finally {
      _isLoadingGetUser.value = false;
    }
  }

  Future<void> runGetPlaylist() async {
    _isLoading.value = true;
    try {
      await getFavoritePlaylist();
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
    await getCurrentUser();
    await runGetPlaylist();
  }
}
