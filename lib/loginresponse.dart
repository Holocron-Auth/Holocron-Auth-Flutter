import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class LoginResponse {
  final String message;
  // final String name;
  // final String email;
  // final String mobileNumber;
  // File? image;
  final String JWT;

  LoginResponse({
    required this.message,
    // required this.name,
    // required this.email,
    // required this.mobileNumber,
    required this.JWT,
    // this.image,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      // name: json['name'],
      // email: json['email'],
      // mobileNumber: json['mobile_number'],
      // image: json['image'],
      JWT: json['JSON'],
    );
  }

  static Future<LoginResponse> loginWithPhone(String phone, String otp) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'application/json',
    };

    var data = '{"json": {"phone": "$phone", "otp": "$otp"}}';

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.loginWithPhone');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      String loginjwt = (data["result"]["data"]["json"]["jwt"]);
      return LoginResponse.fromJson({
        'message': 'User registered successfully',
        // 'name': data["result"]["data"]["json"]["user"]["name"],
        // 'email': data["result"]["data"]["json"]["user"]["name"],
        // 'mobile_number': data["result"]["data"]["json"]["user"]["phone"],
        // 'image': json['image'],
        'JSON': loginjwt,
      });
    } else if (res.statusCode == 404) {
      return LoginResponse(
        message: 'Invalid OTP',
        // name: '',
        // email: '',
        // mobileNumber: '',
        // image: File('assets/Change.png'),
        JWT: '',
      );
    } else {
      return LoginResponse(
        message: 'Error registering user',
        // name: '',
        // email: '',
        // mobileNumber: '',
        // image: File('assets/Change.png'),
        JWT: '',
      );
    }
  }
}
