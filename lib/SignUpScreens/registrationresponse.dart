import 'dart:convert';
import 'package:http/http.dart' as http;

class RegistrationResponse {
  final String message;
  final String jwt;

  RegistrationResponse({required this.message, required this.jwt});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    print("Accessed");
    print(json['message']);

    print(json['JSON']);
    return RegistrationResponse(
      message: json['message'],
      jwt: json['JSON'],
    );
  }
  static Future<RegistrationResponse> registerUser(
      String email, String phone, String name, String otp) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'application/json',
    };

    var data = jsonEncode({
      "json": {
        "email": email,
        "phone": phone,
        "name": name,
        "otp": otp,
      }
    });

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.regUserWithPhone');
    var res = await http.post(url, headers: headers, body: data);
    print(res.body);
    print("You've passed me!!!!!!!");
    // print()
    print(res.statusCode);
    final json = jsonDecode(res.body);
    // print(json.status);
    // print(json['status'].runtimeType);
    print('Yayaya passed');
    if(res.statusCode !=200){
      print('error pe error');
    }
    if (res.statusCode== 200) {
      // var jsonResponse = json.decode(res.body);
      final json = jsonDecode(res.body);
      print("In here ffs");
      print(json);
      //decoded the json
      var data = jsonDecode(res.body);
      print(data["name"]);
      print(data);
      print("Pls work!!!!!!!!");
      String jwtreceived = (data["result"]["data"]["json"]["jwt"]);
      print(jwtreceived);
      var jsonfinal =  RegistrationResponse.fromJson({
        'message': 'User registered successfully',
        'JSON': jwtreceived,
      });
      print("Created final json");
      print(jsonfinal);
      return jsonfinal;
    }
    else if (res.statusCode== 400) {
      return RegistrationResponse(
        message: 'Invalid OTP',
        jwt: '',
      );
    }
    else {
      return RegistrationResponse(
          message: "Error registering user", jwt: "");
    }
  }

}

