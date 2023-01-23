import 'package:flutter/material.dart';
import 'package:goly/components/password_form_builder.dart';
import 'package:goly/components/text_form_builder.dart';
import 'package:goly/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              SizedBox(
                height: 170.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(height: 10.0),
              const Center(
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Log into your account and get started!',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Form(
                  child: Column(
                children: [
                  TextFormBuilder(
                    hintText: "Email",
                    textInputAction: TextInputAction.next,
                  ),
                  PasswordFormBuilder(
                    suffix: Icons.visibility,
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                ],
              ))
            ])
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       Padding(
        //         padding: const EdgeInsets.only(top: 60.0),
        //         child: Center(
        //           child: SizedBox(
        //               width: 200,
        //               height: 150,
        //               /*decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(50.0)),*/
        //               child: Image.asset('assets/images/logo.png')),
        //         ),
        //       ),
        //       const Padding(
        //         //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        //         padding: EdgeInsets.symmetric(horizontal: 15),
        //         child: TextField(
        //           decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               labelText: 'Email',
        //               hintText: 'Enter valid email id as abc@gmail.com'),
        //         ),
        //       ),
        //       const Padding(
        //         padding: EdgeInsets.only(
        //             left: 15.0, right: 15.0, top: 15, bottom: 0),
        //         //padding: EdgeInsets.symmetric(horizontal: 15),
        //         child: TextField(
        //           obscureText: true,
        //           decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               labelText: 'Password',
        //               hintText: 'Enter secure password'),
        //         ),
        //       ),
        //       Container(
        //         height: 50,
        //         width: 250,
        //         decoration: BoxDecoration(
        //             color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        //         child: ElevatedButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (_) => const MyHomePage()));
        //           },
        //           child: const Text(
        //             'Login',
        //             style: TextStyle(color: Colors.white, fontSize: 25),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 130,
        //       ),
        //       Text('New User? Create Account')
        //     ],
        //   ),
        // ),
        );
  }
}
