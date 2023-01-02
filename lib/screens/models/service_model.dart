import 'dart:convert';

class ServiceModel {
  final String id;
  final String spName;
  final String address;
  final String title;
  final String subTitle;
  final String description;
  final String note;
  final String cityName;
  final String pinCode;
  final String dateTime;
  // final List<Ratings>? rating;

  ServiceModel({
    required this.id,
    required this.spName,
    required this.address,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.note,
    required this.cityName,
    required this.pinCode,
    required this.dateTime,
    // this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'spName': spName,
      'address': address,
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'note': note,
      // 'images': image.map((e) => jsonDecode(e.toJson())).toList(),
      'cityName': cityName,
      'pinCode': pinCode,
      'dateTime': dateTime,
      // 'rating': rating
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      spName: map['spName'] ?? '',
      address: map['address'] ?? '',
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      description: map['description'] ?? '',
      note: map['note'] ?? '',
      cityName: map['cityName'] ?? '',
      pinCode: map['pinCode'] ?? '',
      dateTime: map['dateTime'] ?? '',
      id: map['_id'] ?? '',
      // image: List<ImagesModel>.from(
      //   map['images']?.map(
      //     (x) => ImagesModel.fromMap(x),
      //   ),
      // ),
      // rating: map['ratings'] != null
      //     ? List<Ratings>.from(
      //         map['ratings']?.map(
      //           (x) => Ratings.fromMap(x),
      //         ),
      //       )
      //     : null,
      // userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
