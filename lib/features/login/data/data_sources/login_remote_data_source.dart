import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../../core/api/api.dart';
import '../../../../core/error/exceptions.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> postLogin(String niy, password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  const LoginRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<LoginModel> postLogin(String niy, password) async {
    final url = Uri.parse('${Api().url}/login');

    final body = {
      'niy': niy,
      'password': password,
    };

    try {
      final response = await http
          .post(
            url,
            body: json.encode(body),
            headers: Api.headers(),
          )
          .timeout(
            const Duration(seconds: 20),
          );

      if (response.statusCode == 200) {
        return LoginModel.fromJson(
          json.decode(response.body),
        );
      } else {
        final data = json.decode(response.body);
        throw ServerException(data['messege']);
      }
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const ConnectionException();
    } on FormatException {
      throw const ServerException();
    }
  }
}
