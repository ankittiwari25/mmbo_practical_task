class ProfileModel {
  String? profile;
  String? businessName;
  bool? isBusinessRegistered;
  List<String>? collections;
  int? orderAverageValue;

  ProfileModel({this.profile, this.businessName, this.isBusinessRegistered, this.collections, this.orderAverageValue});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
    businessName = json['businessName'];
    isBusinessRegistered = json['isBusinessRegistered'];
    collections = json['collections'].cast<String>();
    orderAverageValue = json['orderAverageValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile'] = profile;
    data['businessName'] = businessName;
    data['isBusinessRegistered'] = isBusinessRegistered;
    data['collections'] = collections;
    data['orderAverageValue'] = orderAverageValue;
    return data;
  }

  ProfileModel copyWith({
    String? profile,
    String? businessName,
    bool? isBusinessRegistered,
    List<String>? collections,
    int? orderAverageValue,
  }) {
    return ProfileModel(
        profile: profile ?? this.profile,
        businessName: businessName ?? this.businessName,
        isBusinessRegistered: isBusinessRegistered ?? this.isBusinessRegistered,
        collections: collections ?? this.collections,
        orderAverageValue: orderAverageValue ?? this.orderAverageValue);
  }
}
