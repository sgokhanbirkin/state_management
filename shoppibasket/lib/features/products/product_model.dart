// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? sId;
  String? name;
  String? image;
  int? total;
  int? price;

  Product({this.sId, this.name, this.image, this.total, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    total = json['total'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['total'] = total;
    data['price'] = price;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.sId == sId &&
        other.name == name &&
        other.image == image &&
        other.total == total &&
        other.price == price;
  }

  @override
  int get hashCode {
    return sId.hashCode ^ name.hashCode ^ image.hashCode ^ total.hashCode ^ price.hashCode;
  }
}
