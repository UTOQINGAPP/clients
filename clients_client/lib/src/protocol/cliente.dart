/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Contiene un cliente con sus datos de usuario.
abstract class Cliente implements _i1.SerializableModel {
  Cliente._({
    this.id,
    required this.names,
    required this.phone,
    required this.email,
    required this.address,
    required this.registered,
  });

  factory Cliente({
    int? id,
    required String names,
    required int phone,
    required String email,
    required String address,
    required DateTime registered,
  }) = _ClienteImpl;

  factory Cliente.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cliente(
      id: jsonSerialization['id'] as int?,
      names: jsonSerialization['names'] as String,
      phone: jsonSerialization['phone'] as int,
      email: jsonSerialization['email'] as String,
      address: jsonSerialization['address'] as String,
      registered:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['registered']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The client's content.
  String names;

  int phone;

  String email;

  String address;

  DateTime registered;

  Cliente copyWith({
    int? id,
    String? names,
    int? phone,
    String? email,
    String? address,
    DateTime? registered,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'names': names,
      'phone': phone,
      'email': email,
      'address': address,
      'registered': registered.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClienteImpl extends Cliente {
  _ClienteImpl({
    int? id,
    required String names,
    required int phone,
    required String email,
    required String address,
    required DateTime registered,
  }) : super._(
          id: id,
          names: names,
          phone: phone,
          email: email,
          address: address,
          registered: registered,
        );

  @override
  Cliente copyWith({
    Object? id = _Undefined,
    String? names,
    int? phone,
    String? email,
    String? address,
    DateTime? registered,
  }) {
    return Cliente(
      id: id is int? ? id : this.id,
      names: names ?? this.names,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      registered: registered ?? this.registered,
    );
  }
}
