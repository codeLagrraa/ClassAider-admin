import 'package:flutter/material.dart';
import 'package:ucscprojectmad/firebase_services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("./assets/virtual-class.png", width: 188.0,),
            SizedBox(height: 20.0,),
            Text('ClassAider - ADMIN', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
          ],
        ),
      ),
    );
  }
}
