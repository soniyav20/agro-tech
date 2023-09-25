import 'package:agri/models/appstate.dart';
import 'package:agri/models/consumer.dart';
import 'package:agri/models/orders.dart';
import 'package:agri/models/product.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor([
  // TODO: add the built values that require serialization
  // Appstate, Department, Faculty, History, Hostel, Student
  Appstate, Orders, Product, Consumer
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
