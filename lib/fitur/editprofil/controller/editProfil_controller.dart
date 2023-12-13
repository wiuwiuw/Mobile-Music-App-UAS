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

class  EditProfileController extends GetxController {
  final RxInt _itemCount = 1.obs;
  RxInt get itemCount => _itemCount;
  PageController? pageController;


  CollectionReference userCollection =
      FirebaseCollectionConstants.getUserCollection();


  UserModel? userModel;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final RxBool _isLoadingFavorite = false.obs;
  RxBool get isLoadingFavorite => _isLoadingFavorite;




  //.................... bates


  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userPrefs = jsonDecode(prefs.getString("user")!);
    final user = await userCollection.doc(userPrefs["email"]).get();
    final userData = user.data() as Map<String, dynamic>;
    userModel = UserModel.fromJson(userData);
    return userModel!;
  }


   final RxString _email = ''.obs;
  final RxString _fullname = ''.obs;
  final RxString _password = ''.obs;
  final RxString _username = ''.obs;

  RxString get email => _email;
  RxString get fullname => _fullname;
  RxString get password => _password;
  RxString get username => _username;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> getUserData(String userId) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await usersCollection.doc(userId).get();

      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        _email.value = data['email'] ?? '';
        _fullname.value = data['fullname'] ?? '';
        _password.value = data['password'] ?? '';
        _username.value = data['username'] ?? '';
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
  }

  Future<void> updateProfile(String userId) async {
    try {
      await usersCollection.doc(userId).update({
        'email': _email.value,
        'fullname': _fullname.value,
        'password': _password.value,
        'username': _username.value,
      });

      // Optionally, you can update the local state or trigger a reload
      // depending on your application's requirements.

      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      print('Error updating profile: $e');
      Get.snackbar('Error', 'Failed to update profile');
    }
  }



  @override
  void onInit() {
    _isLoading.value = true;
    super.onInit();
    pageController = PageController(viewportFraction: 0.85);
    
  }
}
