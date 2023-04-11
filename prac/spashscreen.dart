// import 'package:care/wellcome.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class SpashScreen extends StatefulWidget {
//   const SpashScreen({super.key});

//   @override
//   State<SpashScreen> createState() => _SpashScreenState();
// }

// class _SpashScreenState extends State<SpashScreen> {
//   change(){
//     Future.delayed(Duration(seconds: 3),(){
// Get.to(()=> Wellcome());
//     });
//   }
//   @override
//   void initState() {
//     change();
//     super.initState();
    
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children:[
//       Image.asset("assets/hu4.png", width: 150,height: 150,),
//       Text("lUngCare")
//    ])) );
//   }
// }
