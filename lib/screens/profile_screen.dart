import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbo_practical/bloc/profile_state.dart';
import 'package:mmbo_practical/firebase_services/firebase_repository.dart';
import 'package:mmbo_practical/model/profie_model.dart';
import 'package:mmbo_practical/model/radio_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FirebaseRepository firebaseRepository;
  late ProfileCubit profileCubit;
  late FileCubit fileCubit;
  late LoadingCubit loadingCubit;
  late TextEditingController textEditingController;
  List<RadioModel> data = [
    RadioModel(true, "I have registered business"),
    RadioModel(false, "I Don't have registered business"),
  ];

  @override
  void initState() {
    firebaseRepository = FirebaseRepository();
    textEditingController = TextEditingController();
    profileCubit = ProfileCubit();
    fileCubit = FileCubit();
    loadingCubit = LoadingCubit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => profileCubit),
          BlocProvider(create: (context) => fileCubit),
          BlocProvider(create: (context) => loadingCubit),
        ],
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Complete Your Profile",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<ProfileCubit, ProfileModel>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        horizontalTitleGap: 3,
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        title: Text(
                          "Add General Details",
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
                        ),
                        subtitle: const Text("Summarize if needed", style: TextStyle(color: Colors.green)),
                        trailing: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black.withOpacity(0.6),
                          size: 35,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          fileCubit.getImageFromGallery();
                        },
                        child: BlocBuilder<FileCubit, XFile?>(
                          builder: (context, fileState) {
                            if (fileState == null) {
                              return const Center(
                                child: Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.grey,
                                  size: 130,
                                ),
                              );
                            } else {
                              return Center(
                                child: ClipOval(
                                  child: Image.file(
                                    File(fileState.path),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Upload Store Pic",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                            labelText: "Enter Business Name",
                            labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      ),
                      for (int i = 0; i < data.length; i++) ...{
                        RadioListTile(
                          value: data[i].isChecked,
                          selectedTileColor: Colors.green,
                          activeColor: Colors.green,
                          groupValue: state.isBusinessRegistered,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            profileCubit.isBusinessRegistered(value!);
                          },
                          title: Text(
                            data[i].title,
                            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
                          ),
                        )
                      },
                      const Text("Collections", style: TextStyle(color: Colors.grey, fontSize: 15)),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Momos", style: TextStyle(color: Colors.grey, fontSize: 15)),
                                CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  child: const Icon(
                                    Icons.close,
                                    size: 9,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Biryani", style: TextStyle(color: Colors.grey, fontSize: 15)),
                                CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  child: const Icon(
                                    Icons.close,
                                    size: 9,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1, color: Colors.grey, thickness: 1),
                      const SizedBox(height: 20),
                      const Text("Enter average value for one", style: TextStyle(color: Colors.grey, fontSize: 15)),
                      const SizedBox(height: 20),
                      DropdownButton(
                          value: state.orderAverageValue,
                          isDense: true,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 25,
                          ),
                          underline: const SizedBox(),
                          items: [100, 200, 300, 400, 500]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.toString(),
                                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            profileCubit.onOrderValue(value!);
                          }),
                      const SizedBox(height: 10),
                      const Divider(height: 1, color: Colors.grey, thickness: 1),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () async {
                            loadingCubit.showLoader();
                            ProfileModel profileModel = ProfileModel();
                            profileModel.businessName = textEditingController.text ?? "";
                            profileModel.orderAverageValue = state.orderAverageValue;
                            if (fileCubit.state == null) {
                              profileModel.profile = "";
                            } else {
                              profileModel.profile = await firebaseRepository.uploadImageToStorage(File(fileCubit.state!.path), folderName: "Test User");
                            }
                            profileModel.collections = ["momos", "Biryani"];
                            profileModel.isBusinessRegistered = state.isBusinessRegistered;
                            firebaseRepository.addUserProfileData(profileModel).then((value) {
                              loadingCubit.hideLoader();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Profile data updated successfully",
                                    style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }).catchError((eee) {
                              loadingCubit.hideLoader();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Something Went Wrong",
                                    style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            });
                          },
                          child: BlocBuilder<LoadingCubit, bool?>(
                            builder: (context, loadingState) {
                              return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: loadingState ?? false?Colors.white:Colors.green,
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                                      margin: const EdgeInsets.only(right: 10),
                                      child:loadingState ?? false
                                          ? const CircularProgressIndicator(): Text(
                                        "SUBMIT",
                                        style: Theme.of(context).textTheme.headline1!.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
