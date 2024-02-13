import 'dart:convert';
import 'package:cinetopia/models/response.dart';
import 'package:http/http.dart' as http;
import 'package:cinetopia/common/api.dart';

class AuthService {
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'email': email.trim(),
          'password': password.trim(),
        },
      ),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return LoginResponse(
        success: responseData['success'],
        message: responseData['message'],
        token: responseData['token'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<BasicResponse> register(Map<String, String> userData) async {
    final url = Uri.parse("$baseUrl/auth/register");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return BasicResponse(
        success: responseData['success'],
        message: responseData['message'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<BasicResponse> initPasswordReset(String email) async {
    final url = Uri.parse("$baseUrl/auth/password");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email.trim(),
      }),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return BasicResponse(
        success: responseData['success'],
        message: responseData['message'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }

  Future<BasicResponse> resetPassword(String password, String resetCode) async {
    final url = Uri.parse("$baseUrl/auth/password");

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'code': resetCode.trim(),
        'newPassword': password.trim(),
      }),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return BasicResponse(
        success: responseData['success'],
        message: responseData['message'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw errorMessage;
    }
  }
}
