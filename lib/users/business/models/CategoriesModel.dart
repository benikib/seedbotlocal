// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  Meta meta;
  List<Datum> data;

  CategoriesModel({
    required this.meta,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int categoryId;
  int quantity;
  Category category;

  Datum({
    required this.categoryId,
    required this.quantity,
    required this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["categoryId"],
    quantity: json["quantity"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "quantity": quantity,
    "category": category.toJson(),
  };
}

class Category {
  String designation;
  String description;
  double dailyRentalPrice;
  double weeklyRentalPrice;
  double purchasePrice;
  double monthlyRentalPrice;
  double yearlyRentalPrice;
  String categoryImage;
  int id;

  Category({
    required this.designation,
    required this.description,
    required this.dailyRentalPrice,
    required this.weeklyRentalPrice,
    required this.purchasePrice,
    required this.monthlyRentalPrice,
    required this.yearlyRentalPrice,
    required this.categoryImage,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    designation: json["designation"],
    description: json["description"],
    dailyRentalPrice: json["dailyRentalPrice"]?.toDouble(),
    weeklyRentalPrice: json["weeklyRentalPrice"]?.toDouble(),
    purchasePrice: json["purchasePrice"]?.toDouble(),
    monthlyRentalPrice: json["monthlyRentalPrice"]?.toDouble(),
    yearlyRentalPrice: json["yearlyRentalPrice"]?.toDouble(),
    categoryImage: json["categoryImage"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "designation": designation,
    "description": description,
    "dailyRentalPrice": dailyRentalPrice,
    "weeklyRentalPrice": weeklyRentalPrice,
    "purchasePrice": purchasePrice,
    "monthlyRentalPrice": monthlyRentalPrice,
    "yearlyRentalPrice": yearlyRentalPrice,
    "categoryImage": categoryImage,
    "id": id,
  };
}

class Meta {
  int total;
  int perPage;
  int currentPage;
  int lastPage;
  int firstPage;
  String firstPageUrl;
  String lastPageUrl;
  dynamic nextPageUrl;
  dynamic previousPageUrl;

  Meta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.firstPage,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.previousPageUrl,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    perPage: json["perPage"],
    currentPage: json["currentPage"],
    lastPage: json["lastPage"],
    firstPage: json["firstPage"],
    firstPageUrl: json["firstPageUrl"],
    lastPageUrl: json["lastPageUrl"],
    nextPageUrl: json["nextPageUrl"],
    previousPageUrl: json["previousPageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "perPage": perPage,
    "currentPage": currentPage,
    "lastPage": lastPage,
    "firstPage": firstPage,
    "firstPageUrl": firstPageUrl,
    "lastPageUrl": lastPageUrl,
    "nextPageUrl": nextPageUrl,
    "previousPageUrl": previousPageUrl,
  };
}
