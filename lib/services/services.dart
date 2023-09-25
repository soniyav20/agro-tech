import 'package:agri/models/orders.dart';
import 'package:built_collection/built_collection.dart';

abstract class Services {
  Future<int?> logIn({required String regno, required String password});
  Future<BuiltList<Orders>?> getHistory();
  Future<BuiltList<Orders>?> getHistory1();
  Future<void> reject({required int code});
  Future<int?> change({required String password});
  Future<void> approve({required int code});
}
