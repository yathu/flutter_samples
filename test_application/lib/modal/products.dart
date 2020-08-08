// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

GetProducts getFromJson(String str) => GetProducts.fromJson(json.decode(str));

String dataToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  GetProducts({
    this.products,
  });

  List<Product> products;

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.category,
    this.name,
    this.shortName,
    this.brand,
    this.isAvailable,
    this.volumeMl,
    this.ratings,
    this.promotion,
    this.price,
    this.stock,
    this.image,
    this.imageList,
    this.isBundle,
    this.packaging,
    this.unitOfMeasure,
    this.unitOfMeasureLabel,
    this.cartLimit,
    this.productUrl,
  });

  int id;
  String category;
  String name;
  String shortName;
  String brand;
  bool isAvailable;
  int volumeMl;
  Ratings ratings;
  dynamic promotion;
  Price price;
  Stock stock;
  Image image;
  List<Image> imageList;
  bool isBundle;
  String packaging;
  String unitOfMeasure;
  String unitOfMeasureLabel;
  int cartLimit;
  String productUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    category: json["category"],
    name: json["name"],
    shortName: json["shortName"],
    brand: json["brand"],
    isAvailable: json["isAvailable"],
    volumeMl: json["volumeMl"],
    ratings: Ratings.fromJson(json["ratings"]),
    promotion: json["promotion"],
    price: Price.fromJson(json["price"]),
    stock: Stock.fromJson(json["stock"]),
    image: Image.fromJson(json["image"]),
    imageList: List<Image>.from(json["imageList"].map((x) => Image.fromJson(x))),
    isBundle: json["isBundle"],
    packaging: json["packaging"],
    unitOfMeasure: json["unitOfMeasure"],
    unitOfMeasureLabel: json["unitOfMeasureLabel"],
    cartLimit: json["cartLimit"],
    productUrl: json["productUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "name": name,
    "shortName": shortName,
    "brand": brand,
    "isAvailable": isAvailable,
    "volumeMl": volumeMl,
    "ratings": ratings.toJson(),
    "promotion": promotion,
    "price": price.toJson(),
    "stock": stock.toJson(),
    "image": image.toJson(),
    "imageList": List<dynamic>.from(imageList.map((x) => x.toJson())),
    "isBundle": isBundle,
    "packaging": packaging,
    "unitOfMeasure": unitOfMeasure,
    "unitOfMeasureLabel": unitOfMeasureLabel,
    "cartLimit": cartLimit,
    "productUrl": productUrl,
  };
}

class Image {
  Image({
    this.thumbnailImage,
    this.heroImage,
    this.bundleHeroImage,
  });

  String thumbnailImage;
  String heroImage;
  dynamic bundleHeroImage;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    thumbnailImage: json["thumbnailImage"],
    heroImage: json["heroImage"],
    bundleHeroImage: json["bundleHeroImage"],
  );

  Map<String, dynamic> toJson() => {
    "thumbnailImage": thumbnailImage,
    "heroImage": heroImage,
    "bundleHeroImage": bundleHeroImage,
  };
}

class Price {
  Price({
    this.current,
    this.normal,
    this.acrossAnySix,
  });

  double current;
  double normal;
  double acrossAnySix;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    current: json["current"].toDouble(),
    normal: json["normal"].toDouble(),
    acrossAnySix: json["acrossAnySix"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "normal": normal,
    "acrossAnySix": acrossAnySix,
  };
}

class Ratings {
  Ratings({
    this.average,
    this.total,
  });

  double average;
  int total;

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    average: json["average"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "average": average,
    "total": total,
  };
}

class Stock {
  Stock({
    this.delivery,
    this.clickAndCollect,
  });

  String delivery;
  String clickAndCollect;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    delivery: json["delivery"],
    clickAndCollect: json["clickAndCollect"],
  );

  Map<String, dynamic> toJson() => {
    "delivery": delivery,
    "clickAndCollect": clickAndCollect,
  };
}
