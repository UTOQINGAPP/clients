/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:clients_client/src/protocol/cliente.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointClientes extends _i1.EndpointRef {
  EndpointClientes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'clientes';

  _i2.Future<void> create(_i3.Cliente cliente) =>
      caller.callServerEndpoint<void>(
        'clientes',
        'create',
        {'cliente': cliente},
      );

  _i2.Future<void> delete(_i3.Cliente cliente) =>
      caller.callServerEndpoint<void>(
        'clientes',
        'delete',
        {'cliente': cliente},
      );

  _i2.Future<void> alter(_i3.Cliente cliente) =>
      caller.callServerEndpoint<void>(
        'clientes',
        'alter',
        {'cliente': cliente},
      );

  _i2.Future<List<_i3.Cliente>> getAll() =>
      caller.callServerEndpoint<List<_i3.Cliente>>(
        'clientes',
        'getAll',
        {},
      );

  _i2.Future<List<_i3.Cliente>> getLimiter({
    required int page,
    required int pageSize,
  }) =>
      caller.callServerEndpoint<List<_i3.Cliente>>(
        'clientes',
        'getLimiter',
        {
          'page': page,
          'pageSize': pageSize,
        },
      );

  _i2.Future<int> getTotalPages({required int pageSize}) =>
      caller.callServerEndpoint<int>(
        'clientes',
        'getTotalPages',
        {'pageSize': pageSize},
      );

  _i2.Future<_i3.Cliente?> getSearch({required int id}) =>
      caller.callServerEndpoint<_i3.Cliente?>(
        'clientes',
        'getSearch',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    clientes = EndpointClientes(this);
    example = EndpointExample(this);
  }

  late final EndpointClientes clientes;

  late final EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'clientes': clientes,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
