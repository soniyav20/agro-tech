// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Consumer> _$consumerSerializer = new _$ConsumerSerializer();

class _$ConsumerSerializer implements StructuredSerializer<Consumer> {
  @override
  final Iterable<Type> types = const [Consumer, _$Consumer];
  @override
  final String wireName = 'Consumer';

  @override
  Iterable<Object?> serialize(Serializers serializers, Consumer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.consumer_name;
    if (value != null) {
      result
        ..add('consumer_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone_number;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Consumer deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConsumerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'consumer_name':
          result.consumer_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phone_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Consumer extends Consumer {
  @override
  final String? consumer_name;
  @override
  final String? phone_number;
  @override
  final String? address;

  factory _$Consumer([void Function(ConsumerBuilder)? updates]) =>
      (new ConsumerBuilder()..update(updates))._build();

  _$Consumer._({this.consumer_name, this.phone_number, this.address})
      : super._();

  @override
  Consumer rebuild(void Function(ConsumerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsumerBuilder toBuilder() => new ConsumerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Consumer &&
        consumer_name == other.consumer_name &&
        phone_number == other.phone_number &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, consumer_name.hashCode);
    _$hash = $jc(_$hash, phone_number.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Consumer')
          ..add('consumer_name', consumer_name)
          ..add('phone_number', phone_number)
          ..add('address', address))
        .toString();
  }
}

class ConsumerBuilder implements Builder<Consumer, ConsumerBuilder> {
  _$Consumer? _$v;

  String? _consumer_name;
  String? get consumer_name => _$this._consumer_name;
  set consumer_name(String? consumer_name) =>
      _$this._consumer_name = consumer_name;

  String? _phone_number;
  String? get phone_number => _$this._phone_number;
  set phone_number(String? phone_number) => _$this._phone_number = phone_number;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ConsumerBuilder();

  ConsumerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _consumer_name = $v.consumer_name;
      _phone_number = $v.phone_number;
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Consumer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Consumer;
  }

  @override
  void update(void Function(ConsumerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Consumer build() => _build();

  _$Consumer _build() {
    final _$result = _$v ??
        new _$Consumer._(
            consumer_name: consumer_name,
            phone_number: phone_number,
            address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
