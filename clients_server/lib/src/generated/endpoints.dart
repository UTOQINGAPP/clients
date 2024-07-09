/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/clientes_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:clients_server/src/generated/cliente.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'clientes': _i2.ClientesEndpoint()
        ..initialize(
          server,
          'clientes',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['clientes'] = _i1.EndpointConnector(
      name: 'clientes',
      endpoint: endpoints['clientes']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'cliente': _i1.ParameterDescription(
              name: 'cliente',
              type: _i1.getType<_i4.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).create(
            session,
            params['cliente'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'cliente': _i1.ParameterDescription(
              name: 'cliente',
              type: _i1.getType<_i4.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).delete(
            session,
            params['cliente'],
          ),
        ),
        'alter': _i1.MethodConnector(
          name: 'alter',
          params: {
            'cliente': _i1.ParameterDescription(
              name: 'cliente',
              type: _i1.getType<_i4.Cliente>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).alter(
            session,
            params['cliente'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).getAll(session),
        ),
        'getLimiter': _i1.MethodConnector(
          name: 'getLimiter',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pageSize': _i1.ParameterDescription(
              name: 'pageSize',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).getLimiter(
            session,
            page: params['page'],
            pageSize: params['pageSize'],
          ),
        ),
        'getTotalPages': _i1.MethodConnector(
          name: 'getTotalPages',
          params: {
            'pageSize': _i1.ParameterDescription(
              name: 'pageSize',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).getTotalPages(
            session,
            pageSize: params['pageSize'],
          ),
        ),
        'getSearch': _i1.MethodConnector(
          name: 'getSearch',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['clientes'] as _i2.ClientesEndpoint).getSearch(
            session,
            id: params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
