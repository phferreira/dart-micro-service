import 'dart:async';
import 'dart:convert';

import 'package:dart_backend/database/query.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  await Query.init();
  return Response.ok(json.encode(await Query.index().whenComplete(() => Query.close())));
}
