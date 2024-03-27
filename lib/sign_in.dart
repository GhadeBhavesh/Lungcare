import 'package:care/reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:care/home.dart';
import 'package:care/login_page.dart';
import 'package:care/signup_controller.dart';
import 'package:care/authentication_repository.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     "email"
//   ]
// );
  GoogleSignInAccount? _currentUser;
  bool _isObsure = true;
  bool pass = true;
  RegExp Reqemail = RegExp(r"(?=.*[a-z])");
  bool validateEmail(String email) {
    String Email = email.trim();
    if (Reqemail.hasMatch(Email)) {
      return true;
    } else {
      return false;
    }
  }

  RegExp Reqpass = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String passord) {
    String pass = passord.trim();
    if (Reqpass.hasMatch(pass)) {
      return true;
    } else {
      return false;
    }
  }

  @override

//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account){

//     setState((){
// _currentUser = account;
//     });
//     });
//     super.initState();
//   }
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(36),
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/hu1.png",
                          height: 200,
                        ),
                        TextFormField(
                          onChanged: (value1) {
                            formKey.currentState!.validate();
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
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "UserName",
                              hintText: "Full Name",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value2) {
                            formKey.currentState!.validate();
                          },
                          validator: (value2) {
                            if (value2!.isEmpty) {
                              return "Please Enter Email Address";
                            } else {
                              bool resEmail = validateEmail(value2);
                              if (resEmail) {
                                return null;
                              } else {
                                return 'Email must contain special character';
                              }
                            }
                          },
                          controller: controller.userEmail,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: "Email",
                              hintText: "Email",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value3) {
                            formKey.currentState!.validate();
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
                              prefixIcon: Icon(Icons.phone_android_outlined),
                              labelText: "Phone no",
                              hintText: "Phone Number",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value4) {
                            formKey.currentState!.validate();
                          },
                          validator: (value4) {
                            if (value4!.isEmpty) {
                              return "Please Enter Password";
                            } else {
                              bool respass = validatePassword(value4);
                              if (respass) {
                                return null;
                              } else {
                                return 'Password must contain special,\nNumber & Capital character';
                              }
                            }
                          },
                          obscureText: pass ? !_isObsure : false,
                          controller: controller.userPass,
                          decoration: InputDecoration(
                              suffixIcon: pass
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObsure = !_isObsure;
                                        });
                                      },
                                      icon: Icon(
                                        _isObsure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ))
                                  : null,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              labelText: "Password",
                              hintText: "Password",
                              border: const OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SignUpController.instance.registerUser(
                                      controller.userEmail.text.trim(),
                                      controller.userPass.text.trim(),
                                      controller.userName.text.trim(),
                                      controller.phoneNo.text.trim());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              child: const Text("Sign up",
                                  style: TextStyle(color: Colors.white)),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              icon: const Image(
                                image: AssetImage("assets/google.png"),
                              ),
                              label: const Text("Sign in with Google",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              onPressed: () {
                                signInWithGoogle().then((result) {
                                  if (result != null) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ));
                                  }
                                });
                              },
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const login_page()));
                            },
                            child: const Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Already have a account ? ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(text: " login", style: TextStyle()),
                            ])))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}















// import 'package:date_time_format/date_time_format.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:newcap/colors.dart';
// import 'package:newcap/space.dart';
// import 'package:newcap/text_stye.dart';
// import 'package:newcap/main_button.dart';
// import 'package:newcap/text_fid.dart';
// import 'package:date_time_format/date_time_format.dart';
// import 'package:intl/intl.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//  bool circular = false;
//   bool _isObsure= false;
//   bool pass = true;
//   // PickedFile _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   TextEditingController userName = TextEditingController();
//   TextEditingController userPass = TextEditingController();
//   TextEditingController userEmail = TextEditingController();
//   TextEditingController userPh = TextEditingController();
//   TextEditingController datetime = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(top: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SpaceVH(height: 70.0),
//               Text(
//                 'Create new account',
//                 style: headline1,
//               ),
//               SpaceVH(height: 20.0),
//               Text(
//                 'Please fill in the form to continue',
//                 style: headline3,
//               ),
//               SpaceVH(height: 50.0),
//                Stack( 
//               children: [
//                 CircleAvatar(
//                   radius: 80,
//                   backgroundImage: AssetImage("assets/ui.png"),
//                   backgroundColor: Colors.white,
//                 ),
//                 // InkWell(
//                 //   onTap: () {
//               // showModalBottomSheet(
//               //   context: context,
//               //   builder: ((builder) => bottomSheet()),
                
//               // );},
//               // child: Icon(
//               // Icons.camera_alt,
//               // color: Colors.teal,
//               // size: 28.0,
//               //   )
//                ]),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   controller: userName,
//                   decoration: InputDecoration(
//                       hintText: "Username",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             userName.clear();
//                           },
//                           icon: Icon(Icons.clear))),
//                 ),
//               ),
//              Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                    obscureText: pass ? _isObsure: false,
//                   controller: userPass,
              
//                   decoration: InputDecoration(
//                           suffixIcon: pass ? IconButton(onPressed: (){
//                     setState((){

// _isObsure = !_isObsure;
//         });
//       }, icon: Icon(_isObsure? Icons.visibility_off : Icons.visibility,))
//    :null ,
//                       hintText: "password",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                   ))
//               ), Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   controller: userEmail,
//                   decoration: InputDecoration(
//                       hintText: "Email Address",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             userEmail.clear();
//                           },
//                           icon: Icon(Icons.clear))),
//                 ),
//               ), Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   controller: userPh,
//                   decoration: InputDecoration(
//                       hintText: "Contact No",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             userPh.clear();
//                           },
//                           icon: Icon(Icons.clear))),
//                 ),
//               ), Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   onTap: () async{
//                     DateTime? date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2100));
//                     if (date != null){
//                       setState(() {
//                         datetime.text = DateFormat("dd-MM-yyyy").format(date);
//                       });
//                     }
//                   },
//                   controller: datetime,
//                   decoration: InputDecoration(
//                       hintText: "DOB",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                           prefixIcon: Icon(Icons.calendar_today_rounded),
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             datetime.clear();
//                           },
//                           icon: Icon(Icons.clear))),
//                 ),
//               ),
          
//               SpaceVH(height: 30.0),
//               Mainbutton(
//                 onTap: () {},
//                 text: 'Sign Up',
//                 txtColor: Colors.white,
//                 btnColor: blueButton,
//               ),
//               SpaceVH(height: 20.0),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: RichText(
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: 'Have an account? ',
//                       style: headline.copyWith(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' Sign In',
//                       style: headlineDot.copyWith(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ]),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // getgall() async {
//   //   // ignore: deprecated_member_use
//   //   var img = await image.getImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     file = File(img!.path);
//   //   });
//   // }

// //  Widget bottomSheet() {
// //     return Container(
// //       height: 100.0,
// //       width: MediaQuery.of(context).size.width,
// //       margin: EdgeInsets.symmetric(
// //         horizontal: 20,
// //         vertical: 20,
// //       ),
// //       child: Column(
// //         children: <Widget>[
// //           Text(
// //             "Choose Profile photo",
// //             style: TextStyle(
// //               fontSize: 20.0,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 20,
// //           ),
// //           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
// //             FlatButton.icon(
// //               icon: Icon(Icons.camera),
// //               onPressed: () {
// //                 takePhoto(ImageSource.camera);
// //               },
// //               label: Text("Camera"),
// //             ),
// //             FlatButton.icon(
// //               icon: Icon(Icons.image),
// //               onPressed: () {
// //                 takePhoto(ImageSource.gallery);
// //               },
// //               label: Text("Gallery"),
// //             ),
// //           ])
// //         ],
// //       ),
// //     );
// //   }
// //  void takePhoto(ImageSource source) async {
// //     final pickedFile = await _picker.getImage(
// //       source: source,
// //     );
// //     setState(() {
// //       _imageFile = pickedFile;
// //     });
// //   }
// }


















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newcap/home.dart';
// import 'package:newcap/login_page.dart';
// import 'package:newcap/signup_controller.dart';


// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   bool _isObsure= true;
//   bool pass = true;
// String userEmail ="", userPass="";

//   @override
//   Widget build(BuildContext context) {
//      final controller = Get.put(SignUpController());
//      final _formKey = GlobalKey<FormState>();
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.all(36),
//               child: Column(
//                 children: [
//                  Form(
//                   key: _formKey,
//                   child: Column(
//                   children: [
//                     Image.asset("assets/hu1.png", height: 200,),
//                      TextFormField(
//                       controller: controller.userName,
//                       decoration: const InputDecoration(
//                         prefixIcon: const Icon(Icons.person_outline_outlined),
//                         labelText: "UserName",
//                         hintText: "Full Name",
//                         border: const OutlineInputBorder()
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       onChanged: (value) {
//                         userEmail = value;
//                       },
//                       decoration: const InputDecoration(
//                         prefixIcon: const Icon(Icons.email_outlined),
//                         labelText: "Email",
//                         hintText: "Email",
//                         border: const OutlineInputBorder()
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       controller: controller.phoneNo,
//                       decoration: const InputDecoration(
//                         prefixIcon: const Icon(Icons.phone_android_outlined),
//                         labelText: "Phone no",
//                         hintText: "Phone Number",
//                         border: const OutlineInputBorder()
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     TextFormField(
//                       onChanged: (value) {
//                         userPass = value;
//                       },
//                        obscureText: pass ? !_isObsure: false,
//                     controller: controller.userPass,
//                       decoration: InputDecoration(
//                         suffixIcon: pass ? IconButton(onPressed: (){
//                       setState((){
//     _isObsure = !_isObsure;
//           });
//         }, icon: Icon(_isObsure? Icons.visibility : Icons.visibility_off,))
//        :null,
//                         prefixIcon: const Icon(Icons.lock_outlined),
                       
//                         labelText: "Password",
//                         hintText: "Password",
//                         border: const OutlineInputBorder()
//                       ),
//                     ),
                    
                   
//                     const SizedBox(height: 20,),
//                     Container(
//                       width: double.infinity,
//                       height: 40,
//                       child: ElevatedButton(onPressed: () async {
//                        try{
//                         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPass);
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//                        }on FirebaseAuthException catch (e) {
//      if (e.code == "weak_password") {
//        print("The passord provided is weak");
//      } else if(e.code == "e-mail is already in use")
//       print("The account alredy in exits.");} catch (e) {
//     print(e);
//                       }}, child: const Text("Sign up"), style: ElevatedButton.styleFrom(
//                         primary: Colors.pink,
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40)
//                         )
//                       ),)),
//                       const SizedBox(height: 10,),
//                       const Text("OR",style: TextStyle(fontWeight: FontWeight.w600),),
//                       const SizedBox(height: 10,),
//                       SizedBox(height: 60,
//                       width: double.infinity,
//                      child: OutlinedButton.icon(
//                         icon: const Image(image: AssetImage("assets/google.png"),),
//                         label: const Text("Sign in with Google",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black)),
//                         onPressed: (){
                          
//                         }, )
//                  ),
//                  const SizedBox(height: 20,),
//                  TextButton(onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
//                  }, child: const Text.rich(TextSpan(children: [
//                   TextSpan(
//                   text: "Already have a account ? ",
//                   style: TextStyle(
//                     color: Colors.black
//                   )
//                  ),
//                   TextSpan(
//                   text: " login",
//                     style: TextStyle(            
//                   )
//                  ),
//                  ])))
//                  ],
//                  ))
//                 ],
//               ),),
              
//             ),
//           ),
//     );
//   }
// }





































// // import 'package:date_time_format/date_time_format.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:newcap/colors.dart';
// // import 'package:newcap/space.dart';
// // import 'package:newcap/text_stye.dart';
// // import 'package:newcap/main_button.dart';
// // import 'package:newcap/text_fid.dart';
// // import 'package:date_time_format/date_time_format.dart';
// // import 'package:intl/intl.dart';

// // class SignUpPage extends StatefulWidget {
// //   const SignUpPage({Key? key}) : super(key: key);

// //   @override
// //   _SignUpPageState createState() => _SignUpPageState();
// // }

// // class _SignUpPageState extends State<SignUpPage> {
// //  bool circular = false;
// //   bool _isObsure= false;
// //   bool pass = true;
// //   // PickedFile _imageFile;
// //   final ImagePicker _picker = ImagePicker();
// //   TextEditingController userName = TextEditingController();
// //   TextEditingController userPass = TextEditingController();
// //   TextEditingController userEmail = TextEditingController();
// //   TextEditingController userPh = TextEditingController();
// //   TextEditingController datetime = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: EdgeInsets.only(top: 10.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               SpaceVH(height: 70.0),
// //               Text(
// //                 'Create new account',
// //                 style: headline1,
// //               ),
// //               SpaceVH(height: 20.0),
// //               Text(
// //                 'Please fill in the form to continue',
// //                 style: headline3,
// //               ),
// //               SpaceVH(height: 50.0),
// //                Stack( 
// //               children: [
// //                 CircleAvatar(
// //                   radius: 80,
// //                   backgroundImage: AssetImage("assets/ui.png"),
// //                   backgroundColor: Colors.white,
// //                 ),
// //                 // InkWell(
// //                 //   onTap: () {
// //               // showModalBottomSheet(
// //               //   context: context,
// //               //   builder: ((builder) => bottomSheet()),
                
// //               // );},
// //               // child: Icon(
// //               // Icons.camera_alt,
// //               // color: Colors.teal,
// //               // size: 28.0,
// //               //   )
// //                ]),
// //               Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: TextField(
// //                   controller: userName,
// //                   decoration: InputDecoration(
// //                       hintText: "Username",
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10)),
// //                       suffixIcon: IconButton(
// //                           onPressed: () {
// //                             userName.clear();
// //                           },
// //                           icon: Icon(Icons.clear))),
// //                 ),
// //               ),
// //              Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: TextField(
// //                    obscureText: pass ? _isObsure: false,
// //                   controller: userPass,
              
// //                   decoration: InputDecoration(
// //                           suffixIcon: pass ? IconButton(onPressed: (){
// //                     setState((){

// // _isObsure = !_isObsure;
// //         });
// //       }, icon: Icon(_isObsure? Icons.visibility_off : Icons.visibility,))
// //    :null ,
// //                       hintText: "password",
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10)),
// //                   ))
// //               ), Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: TextField(
// //                   controller: userEmail,
// //                   decoration: InputDecoration(
// //                       hintText: "Email Address",
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10)),
// //                       suffixIcon: IconButton(
// //                           onPressed: () {
// //                             userEmail.clear();
// //                           },
// //                           icon: Icon(Icons.clear))),
// //                 ),
// //               ), Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: TextField(
// //                   controller: userPh,
// //                   decoration: InputDecoration(
// //                       hintText: "Contact No",
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10)),
// //                       suffixIcon: IconButton(
// //                           onPressed: () {
// //                             userPh.clear();
// //                           },
// //                           icon: Icon(Icons.clear))),
// //                 ),
// //               ), Padding(
// //                 padding: const EdgeInsets.all(20.0),
// //                 child: TextField(
// //                   onTap: () async{
// //                     DateTime? date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2100));
// //                     if (date != null){
// //                       setState(() {
// //                         datetime.text = DateFormat("dd-MM-yyyy").format(date);
// //                       });
// //                     }
// //                   },
// //                   controller: datetime,
// //                   decoration: InputDecoration(
// //                       hintText: "DOB",
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(10)),
// //                           prefixIcon: Icon(Icons.calendar_today_rounded),
// //                       suffixIcon: IconButton(
// //                           onPressed: () {
// //                             datetime.clear();
// //                           },
// //                           icon: Icon(Icons.clear))),
// //                 ),
// //               ),
          
// //               SpaceVH(height: 30.0),
// //               Mainbutton(
// //                 onTap: () {},
// //                 text: 'Sign Up',
// //                 txtColor: Colors.white,
// //                 btnColor: blueButton,
// //               ),
// //               SpaceVH(height: 20.0),
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                 },
// //                 child: RichText(
// //                   text: TextSpan(children: [
// //                     TextSpan(
// //                       text: 'Have an account? ',
// //                       style: headline.copyWith(
// //                         fontSize: 14.0,
// //                       ),
// //                     ),
// //                     TextSpan(
// //                       text: ' Sign In',
// //                       style: headlineDot.copyWith(
// //                         fontSize: 14.0,
// //                       ),
// //                     ),
// //                   ]),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //   // getgall() async {
// //   //   // ignore: deprecated_member_use
// //   //   var img = await image.getImage(source: ImageSource.gallery);
// //   //   setState(() {
// //   //     file = File(img!.path);
// //   //   });
// //   // }

// // //  Widget bottomSheet() {
// // //     return Container(
// // //       height: 100.0,
// // //       width: MediaQuery.of(context).size.width,
// // //       margin: EdgeInsets.symmetric(
// // //         horizontal: 20,
// // //         vertical: 20,
// // //       ),
// // //       child: Column(
// // //         children: <Widget>[
// // //           Text(
// // //             "Choose Profile photo",
// // //             style: TextStyle(
// // //               fontSize: 20.0,
// // //             ),
// // //           ),
// // //           SizedBox(
// // //             height: 20,
// // //           ),
// // //           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
// // //             FlatButton.icon(
// // //               icon: Icon(Icons.camera),
// // //               onPressed: () {
// // //                 takePhoto(ImageSource.camera);
// // //               },
// // //               label: Text("Camera"),
// // //             ),
// // //             FlatButton.icon(
// // //               icon: Icon(Icons.image),
// // //               onPressed: () {
// // //                 takePhoto(ImageSource.gallery);
// // //               },
// // //               label: Text("Gallery"),
// // //             ),
// // //           ])
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //  void takePhoto(ImageSource source) async {
// // //     final pickedFile = await _picker.getImage(
// // //       source: source,
// // //     );
// // //     setState(() {
// // //       _imageFile = pickedFile;
// // //     });
// // //   }
// // }