import 'package:agri/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consumer.g.dart';

abstract class Consumer implements Built<Consumer, ConsumerBuilder> {
  Consumer._();
  factory Consumer([void Function(ConsumerBuilder) updates]) = _$Consumer;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Consumer.serializer, this)
        as Map<String, dynamic>;
  }

  static Consumer fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Consumer.serializer, json)!;
  }

  static Serializer<Consumer> get serializer => _$consumerSerializer;
  String? get consumer_name;
  String? get phone_number;
  String? get address;
}
