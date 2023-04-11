import 'package:care/screens/authentication_repository.dart';
import 'package:care/screens/login_page.dart';
import 'package:care/screens/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:care/services/firebase_service.dart';
import 'package:care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
 bool isLoading = false;
  GoogleSignInAccount? _currentUser;
  bool _isObsure= true;
  bool pass = true;
  RegExp Reqemail = RegExp(r"(?=.*[a-z])");
bool validateEmail(String email){
  String _Email = email.trim();
  if (Reqemail.hasMatch(_Email)) {
    return true;
  } else {
    return false;
  }
}

  RegExp Reqpass = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
bool validatePassword(String passord){
  String _pass = passord.trim();
  if (Reqpass.hasMatch(_pass)) {
    return true;
  } else {
    return false;
  }
}
  @override
  Widget build(BuildContext context) {
     const homeNavigate = '/home';
    GoogleSignInAccount? user = _currentUser;
     final controller = Get.put(SignUpController());
     final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(36),
              child: Column(
                children: [
                 Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    Image.asset("assets/hu1.png", height: 200,),
                     TextFormField(
                      onChanged: (value1) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value1) {
                        if (value1!.isEmpty) {
                          return "Please Enter UserName";
                        } else {
                          return null;
                        }
                      },
                      controller: controller.userName,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline_outlined),
                        labelText: "UserName",
                        hintText: "Full Name",
                        border: const OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                       onChanged: (value2) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value2) {
                        if (value2!.isEmpty) {
                          return "Please Enter Email Address";
                        } else {
                          bool resEmail = validateEmail(value2);
                          if (resEmail) {
                          return null;
                          }
                          else {
                            return 'Email must contain special character';
                          }
                        }
                      },
                      controller: controller.userEmail,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: "Email",
                        hintText: "Email",
                        border: const OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                       onChanged: (value3) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value3) {
                        if (value3!.isEmpty) {
                          return "Please Enter Mobile No";
                        } else {
                          return null;
                        }
                      },
                      controller: controller.phoneNo,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                        labelText: "Phone no",
                        hintText: "Phone Number",
                        border: const OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                       onChanged: (value4) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value4) {
                        if (value4!.isEmpty) {
                          return "Please Enter Password";
                        } else {
                          bool respass = validatePassword(value4);
                          if (respass) {
                          return null;
                          }
                          else {
                            return 'Password must contain special,Number & Capital character';
                          }
                        }
                      },
                       obscureText: pass ? !_isObsure: false,
                    controller: controller.userPass,
                      decoration: InputDecoration(
                        suffixIcon: pass ? IconButton(onPressed: (){
                      setState((){
    _isObsure = !_isObsure;
          });
        }, icon: Icon(_isObsure? Icons.visibility : Icons.visibility_off,))
       :null,
                        prefixIcon: const Icon(Icons.lock_outlined),
                       
                        labelText: "Password",
                        hintText: "Password",
                        border: const OutlineInputBorder()
                      ),
                    ),
                    
                   
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(onPressed: (){
                        if (_formKey.currentState!.validate()){
                          SignUpController.instance.registerUser(controller.userEmail.text.trim(),controller.userPass.text.trim(),controller.userName.text.trim(),controller.phoneNo.text.trim());
                          
                        }
                      }, child: const Text("Sign up"), style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                        )
                      ),)),
                      const SizedBox(height: 10,),
                      const Text("OR",style: TextStyle(fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      SizedBox(height: 60,
                      width: double.infinity,
                     child: OutlinedButton.icon(
                        icon: const Image(image: AssetImage("assets/google.png"),),
                        label: const Text("Sign in with Google",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
                        onPressed: () async {
                       setState(() {
            isLoading = true;
          });
          AuthenticationRepository service = new AuthenticationRepository();
          try {
           await service.GoogleSign();
           Navigator.pushNamedAndRemoveUntil(context,homeNavigate, (route) => false);
          } catch(e){
            if(e is FirebaseAuthException){
              showMessage(e.message!);
            }
          }
          setState(() {
            isLoading = false;
          });
                        }, )
                 ),
                 const SizedBox(height: 20,),
                 TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
                 }, child: const Text.rich(TextSpan(children: [
                  TextSpan(
                  text: "Already have a account ? ",
                  style: TextStyle(
                    color: Colors.black
                  )
                 ),
                  TextSpan(
                  text: " login",
                    style: TextStyle(            
                  )
                 ),
                 ])))
                 ],
                 ))
                ],
              ),),
              
            ),
          ),
    );
  }

void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}








