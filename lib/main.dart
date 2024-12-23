import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_finances/pages/Login/login.dart';
import 'package:flutter_finances/pages/MonthOverall/month_overall.dart';
import 'package:flutter_finances/provider/entries_provider.dart';
import 'package:flutter_finances/provider/user_provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/pages/AddEntry/add_entry.dart';
import 'package:flutter_finances/pages/App/app.dart';
import 'package:flutter_finances/pages/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => EntriesProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.getUserData;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors().blue,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      home: userData != null ? App() : Login(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/addEntry': (context) => AddEntryScreen(),
        '/monthOverall': (context) => MonthOverall(),
      },
    );
  }
}
