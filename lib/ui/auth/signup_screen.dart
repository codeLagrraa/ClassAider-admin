import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucscprojectmad/ui/auth/login_screen.dart';
import 'package:ucscprojectmad/utils/utils.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp(){
    setState(() {
      loading = true ;
    });
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
      Utils().toastMessage("User created");
      setState(() {
        loading = false ;
      });
      Navigator.push(context,
          MaterialPageRoute(
              builder:(context) => LoginScreen())
      );

    }).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false ;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0,),
                  Image.asset("./assets/virtual-class.png", width: 78.0,),
                  SizedBox(height: 20.0,),
                  Text('ClassAider - ADMIN', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                  Text('version - 1.0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.italic),),
                  SizedBox(height: 40.0,),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const  InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null ;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const  InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_open)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter password';
                        }
                        return null ;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              RoundButton(
                title: 'Sign up',
                loading: loading,
                onTap: () {
                if(_formKey.currentState!.validate()){
                  signUp();
                }
              },
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder:(context) => LoginScreen())
                    );
                  },
                      child: Text('Login'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
