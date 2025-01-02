import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/bottom_bar.dart';
import 'package:myapp/constants/global_variables.dart';
import 'package:myapp/features/admin/screens/admin_screen.dart';
import 'package:myapp/features/auth/screens/auth_screen.dart';
import 'package:myapp/features/auth/services/auth_service.dart';
import 'package:myapp/features/home/providers/filter_provider.dart';
import 'package:myapp/features/home/providers/search_provider.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => FilterProvider(),
    ),
  ], child: const MyApp()));
}

const String uri = "http://localhost:3000";
late Size mq;
late TextTheme myTextTheme;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
        ),
      ),
      //
      //
      onGenerateRoute: (settings) => generateRoute(settings),
      //
      //
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}



//mq table :
/*

mq.height * .025 = 21
mq.height * .05 = 42
mq.height * .1 = 84
mq.height * .2 = 168
mq.height * .3 = 253
mq.height * .4 = 337
mq.height * .5 = 421
mq.height * .6 = 506
mq.height * .7 = 590
mq.height * .8 = 674
mq.height * .9 = 759
mq.height *  1 = 843

mq.width * 0.0195 = 8
mq.width * .025 = 10
mq.width * .05 = 20
mq.width * .1 = 41    
mq.width * .2 = 82
mq.width * .3 = 123
mq.width * .4 = 164
mq.width * .5 = 205
mq.width * .6 = 246
mq.width * .7 = 288
mq.width * .8 = 329
mq.width * .9 = 370
mq.width *  1 = 411

ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              print(
                  "height ${index + 1} : ${(mq.height * (index + 1) * 0.1).toInt()}");

              print("\n\n\n");
              print("width : ${(mq.width * (index + 1) * 0.1).toInt()}");
              return Row(
                children: [
                  Text(
                      "height ${index + 1} : ${(mq.height * (index + 1) * 0.1).toInt()}"),
                  SizedBox(width: 10),
                  Text("width : ${(mq.width * (index + 1) * 0.1).toInt()}"),
                ],
              );
  }))
*/