import 'package:flutter/material.dart';
//import starterscreen2
import 'starter2.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class StarterScreen extends StatefulWidget {
  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {

  // final auth = LocalAuthentication();
  // bool _canCheckBiometrics = false;
  // List<BiometricType> _availableBiometrics = [];
  // String _authorized = 'Not Authorized';
  // bool _isAuthenticating = false;


  @override
  void initState() {
    super.initState();
    // _checkBiometrics();
    // _getAvailableBiometrics();
  }

  //
  // Future<void> _checkBiometrics() async {
  //   bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //     print(_canCheckBiometrics);
  //   });
  // }
  //
  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(() {
  //     _availableBiometrics = availableBiometrics;
  //     print(_availableBiometrics);
  //   });
  // }
  //
  //
  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(
  //           () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.25 * height),
                child: Image.asset('assets/Logo.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.05 * height),
                child: Text(
                  'Your Key to Seamless Access',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0.05 * height, left: 0.04 * width, right: 0.04 * width),
                child: Text(
                  'Access multiple services with just one click, making the login process faster and more convenient than ever before.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.1 * height),
                width: 80,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    // _authenticate();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StarterScreen2()),
                    );
                  },
                  child: Image.asset(
                    'assets/starterbutton1.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
