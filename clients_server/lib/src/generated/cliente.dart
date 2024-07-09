/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

/// Contiene un cliente con sus datos de usuario.
abstract class Cliente extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Cliente._({
    int? id,
    required this.names,
    required this.phone,
    required this.email,
    required this.address,
    required this.registered,
  }) : super(id);

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

  static final t = ClienteTable();

  static const db = ClienteRepository._();

  /// The client's content.
  String names;

  int phone;

  String email;

  String address;

  DateTime registered;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'names': names,
      'phone': phone,
      'email': email,
      'address': address,
      'registered': registered.toJson(),
    };
  }

  static ClienteInclude include() {
    return ClienteInclude._();
  }

  static ClienteIncludeList includeList({
    _i1.WhereExpressionBuilder<ClienteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ClienteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClienteTable>? orderByList,
    ClienteInclude? include,
  }) {
    return ClienteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cliente.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cliente.t),
      include: include,
    );
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

class ClienteTable extends _i1.Table {
  ClienteTable({super.tableRelation}) : super(tableName: 'cliente') {
    names = _i1.ColumnString(
      'names',
      this,
    );
    phone = _i1.ColumnInt(
      'phone',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    registered = _i1.ColumnDateTime(
      'registered',
      this,
    );
  }

  /// The client's content.
  late final _i1.ColumnString names;

  late final _i1.ColumnInt phone;

  late final _i1.ColumnString email;

  late final _i1.ColumnString address;

  late final _i1.ColumnDateTime registered;

  @override
  List<_i1.Column> get columns => [
        id,
        names,
        phone,
        email,
        address,
        registered,
      ];
}

class ClienteInclude extends _i1.IncludeObject {
  ClienteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Cliente.t;
}

class ClienteIncludeList extends _i1.IncludeList {
  ClienteIncludeList._({
    _i1.WhereExpressionBuilder<ClienteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cliente.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Cliente.t;
}

class ClienteRepository {
  const ClienteRepository._();

  Future<List<Cliente>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClienteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ClienteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClienteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Cliente>(
      where: where?.call(Cliente.t),
      orderBy: orderBy?.call(Cliente.t),
      orderByList: orderByList?.call(Cliente.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Cliente?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClienteTable>? where,
    int? offset,
    _i1.OrderByBuilder<ClienteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ClienteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Cliente>(
      where: where?.call(Cliente.t),
      orderBy: orderBy?.call(Cliente.t),
      orderByList: orderByList?.call(Cliente.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Cliente?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Cliente>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Cliente>> insert(
    _i1.Session session,
    List<Cliente> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Cliente>(
      rows,
      transaction: transaction,
    );
  }

  Future<Cliente> insertRow(
    _i1.Session session,
    Cliente row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cliente>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Cliente>> update(
    _i1.Session session,
    List<Cliente> rows, {
    _i1.ColumnSelections<ClienteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cliente>(
      rows,
      columns: columns?.call(Cliente.t),
      transaction: transaction,
    );
  }

  Future<Cliente> updateRow(
    _i1.Session session,
    Cliente row, {
    _i1.ColumnSelections<ClienteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cliente>(
      row,
      columns: columns?.call(Cliente.t),
      transaction: transaction,
    );
  }

  Future<List<Cliente>> delete(
    _i1.Session session,
    List<Cliente> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cliente>(
      rows,
      transaction: transaction,
    );
  }

  Future<Cliente> deleteRow(
    _i1.Session session,
    Cliente row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cliente>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Cliente>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ClienteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cliente>(
      where: where(Cliente.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ClienteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cliente>(
      where: where?.call(Cliente.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
