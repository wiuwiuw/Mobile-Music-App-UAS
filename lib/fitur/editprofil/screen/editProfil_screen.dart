import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/fitur/editprofil/controller/editProfil_controller.dart';

class EditProfileScreen extends StatelessWidget {


  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: _editProfileController.email,
                decoration: InputDecoration(labelText: 'Email'),
                controller: TextEditingController(text: _editProfileController.email.value),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: _editProfileController.fullname,
                decoration: InputDecoration(labelText: 'Full Name'),
                controller: TextEditingController(text: _editProfileController.fullname.value),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: _editProfileController.password,
                decoration: InputDecoration(labelText: 'Password'),
                controller: TextEditingController(text: _editProfileController.password.value),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: _editProfileController.username,
                decoration: InputDecoration(labelText: 'Username'),
                controller: TextEditingController(text: _editProfileController.username.value),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _editProfileController.updateProfile('user123'); // Replace 'user123' with the actual user ID
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
