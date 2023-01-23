import 'package:flutter/material.dart';
import 'package:goly/pages/login_page.dart';
import 'package:goly/utils/constants.dart';

void main() {
  //await Config.initFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,

      theme: (false ? Constants.darkTheme : Constants.lightTheme),
      home: const LoginPage(),
      // StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      // builder: ((BuildContext context, snapshot) {
      //           if (snapshot.hasData) {
      //             return const MyHomePage();
      //           } else {
      //             return const LoginPage();
      //           }
      //         }),
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }
}
