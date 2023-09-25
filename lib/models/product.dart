import 'package:agri/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  Product._();
  factory Product([void Function(ProductBuilder) updates]) = _$Product;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Product.serializer, this)
        as Map<String, dynamic>;
  }

  static Product fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Product.serializer, json)!;
  }

  static Serializer<Product> get serializer => _$productSerializer;

  int? get id;
  String? get name;
}
