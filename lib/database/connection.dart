import 'package:postgres/postgres.dart';

class Connection {
  PostgreSQLConnection _connection;

  static Future<Connection> connect() async {
    int _port = 4321;
    // String _host = env['DB_HOST'];
    // String _user = env['DB_USER'];
    // String _pass = env['DB_PASS'];
    // String _name = env['DB_NAME'];
    String _host = 'localhost';
    String _user = 'postgres';
    String _pass = '123456';
    String _name = 'dados';

    Connection connection = Connection();
    connection._connection = PostgreSQLConnection(_host, _port, _name, username: _user, password: _pass);
    await connection._connection.open();
    return connection;
  }

  Future<List<dynamic>> query(String sql, {Map<String, dynamic> values}) async {
    try {
      return await _connection.mappedResultsQuery(sql, substitutionValues: values);
    } catch (e) {
      return Future.value([]);
    }
  }

  void close() async {
    await _connection.close();
  }
}
