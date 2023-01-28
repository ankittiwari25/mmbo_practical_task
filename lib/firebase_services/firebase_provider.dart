import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mmbo_practical/model/profie_model.dart';

class FirebaseProvider {
  factory FirebaseProvider() => _singleton;
  static final FirebaseProvider _singleton = FirebaseProvider._internal();

  FirebaseProvider._internal() ;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addUserProfileData(ProfileModel profileModel) async {
    _fireStore.collection("profile").doc().set(profileModel.toJson());
  }

  Future<String> uploadImageToStorage(File imageFile, {String? folderName}) async {
    Reference storageReference = FirebaseStorage.instance.ref().child('$folderName');
    UploadTask storageUploadTask = storageReference.putFile(imageFile);
    TaskSnapshot storageTaskSnapshot = await storageUploadTask;
    return storageTaskSnapshot.ref.getDownloadURL();
  }
}
