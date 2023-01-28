import 'dart:io';

import 'package:mmbo_practical/firebase_services/firebase_provider.dart';
import 'package:mmbo_practical/model/profie_model.dart';

class FirebaseRepository {
  final _firebaseProvider = FirebaseProvider();

  Future<void> addUserProfileData(ProfileModel profileModel){
    return _firebaseProvider.addUserProfileData(profileModel);
  }
  Future<String> uploadImageToStorage(File imageFile, {String? folderName}){
    return _firebaseProvider.uploadImageToStorage(imageFile,folderName: folderName);
  }
}
