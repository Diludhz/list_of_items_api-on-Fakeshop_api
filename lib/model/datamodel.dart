class DataModel {
  int? id;
  String? title;
  double price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  DataModel(
      {this.id,
      this.title,
      required this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromjson(json["rating"]));
  }
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating
    };
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromjson(Map<String, dynamic> json) {
    return Rating(rate: json["rate"].toDouble(), count: json["count"]);
  }
  Map<String, dynamic> tojson() {
    return {"rate": rate, "count": count};
  }
}
