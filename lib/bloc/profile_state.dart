import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbo_practical/model/profie_model.dart';

class ProfileCubit extends Cubit<ProfileModel> {
  ProfileCubit()
      : super(ProfileModel(
          businessName: "",
          collections: [],
          isBusinessRegistered: true,
          orderAverageValue: 100,
          profile: "",
        ));

  void isBusinessRegistered(bool isReg) {
    emit(state.copyWith(isBusinessRegistered: isReg));
  }

  void onOrderValue(int value) {
    emit(state.copyWith(orderAverageValue: value));
  }
}

class FileCubit extends Cubit<XFile?> {
  FileCubit() : super(null);

  Future<void> getImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) emit(image);
  }
}

class LoadingCubit extends Cubit<bool?> {
  LoadingCubit() : super(false);

  void showLoader() => emit(true);

  void hideLoader() => emit(false);
}
