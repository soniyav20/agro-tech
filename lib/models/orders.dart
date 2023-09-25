import 'package:agri/models/consumer.dart';
import 'package:agri/models/product.dart';
import 'package:agri/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'orders.g.dart';

abstract class Orders implements Built<Orders, OrdersBuilder> {
  Orders._();
  factory Orders([void Function(OrdersBuilder) updates]) = _$Orders;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Orders.serializer, this)
        as Map<String, dynamic>;
  }

  static Orders fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Orders.serializer, json)!;
  }

  static Serializer<Orders> get serializer => _$ordersSerializer;
  int? get id;
  String? get status;
  bool? get paid;
  Product? get product;
  Consumer? get consumer;
}
