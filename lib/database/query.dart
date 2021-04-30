import 'package:dart_backend/database/connection.dart';

abstract class Query {
  static Connection _connection;

  static init() async {
    return _connection = await Connection.connect();
  }

  static Future<List<dynamic>> index() async {
    return await _connection.query('select * from tb_pessoa;');
  }

  static close() async {
    _connection.close();
  }
}
