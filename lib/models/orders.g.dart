// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Orders> _$ordersSerializer = new _$OrdersSerializer();

class _$OrdersSerializer implements StructuredSerializer<Orders> {
  @override
  final Iterable<Type> types = const [Orders, _$Orders];
  @override
  final String wireName = 'Orders';

  @override
  Iterable<Object?> serialize(Serializers serializers, Orders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paid;
    if (value != null) {
      result
        ..add('paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.product;
    if (value != null) {
      result
        ..add('product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Product)));
    }
    value = object.consumer;
    if (value != null) {
      result
        ..add('consumer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Consumer)));
    }
    return result;
  }

  @override
  Orders deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paid':
          result.paid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'product':
          result.product.replace(serializers.deserialize(value,
              specifiedType: const FullType(Product))! as Product);
          break;
        case 'consumer':
          result.consumer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Consumer))! as Consumer);
          break;
      }
    }

    return result.build();
  }
}

class _$Orders extends Orders {
  @override
  final int? id;
  @override
  final String? status;
  @override
  final bool? paid;
  @override
  final Product? product;
  @override
  final Consumer? consumer;

  factory _$Orders([void Function(OrdersBuilder)? updates]) =>
      (new OrdersBuilder()..update(updates))._build();

  _$Orders._({this.id, this.status, this.paid, this.product, this.consumer})
      : super._();

  @override
  Orders rebuild(void Function(OrdersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersBuilder toBuilder() => new OrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Orders &&
        id == other.id &&
        status == other.status &&
        paid == other.paid &&
        product == other.product &&
        consumer == other.consumer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, paid.hashCode);
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jc(_$hash, consumer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Orders')
          ..add('id', id)
          ..add('status', status)
          ..add('paid', paid)
          ..add('product', product)
          ..add('consumer', consumer))
        .toString();
  }
}

class OrdersBuilder implements Builder<Orders, OrdersBuilder> {
  _$Orders? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _paid;
  bool? get paid => _$this._paid;
  set paid(bool? paid) => _$this._paid = paid;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  ConsumerBuilder? _consumer;
  ConsumerBuilder get consumer => _$this._consumer ??= new ConsumerBuilder();
  set consumer(ConsumerBuilder? consumer) => _$this._consumer = consumer;

  OrdersBuilder();

  OrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _paid = $v.paid;
      _product = $v.product?.toBuilder();
      _consumer = $v.consumer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Orders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Orders;
  }

  @override
  void update(void Function(OrdersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Orders build() => _build();

  _$Orders _build() {
    _$Orders _$result;
    try {
      _$result = _$v ??
          new _$Orders._(
              id: id,
              status: status,
              paid: paid,
              product: _product?.build(),
              consumer: _consumer?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
        _$failedField = 'consumer';
        _consumer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Orders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
