import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/apply_job/apply_job_binding.dart';
import 'package:job_seeker/feature/apply_job/apply_job_page.dart';
import 'package:job_seeker/feature/dashboard/binding/dashboard_binding.dart';
import 'package:job_seeker/feature/dashboard/view/dashboard_page.dart';
import 'package:job_seeker/feature/job_details/view/job_details_page.dart';
import 'package:job_seeker/feature/job_list/job_list_binding.dart';
import 'package:job_seeker/feature/job_list/job_list_page.dart';
import 'package:job_seeker/feature/login/login_binding.dart';
import 'package:job_seeker/feature/login_entry/login_entry_page.dart';
import 'package:job_seeker/feature/signup/signup_page.dart';
import 'package:job_seeker/feature/splash/splash_screen.dart';

import 'feature/login/login_page.dart';
import 'feature/login_entry/login_entry_binding.dart';
import 'feature/signup/signup_binding.dart';
import 'feature/splash/splash_binding.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ThemeColor().blue,
          fontFamily: GoogleFonts.lato().fontFamily,
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ThemeColor().black,
              ),
              headline2: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ThemeColor().black,
              ),
              headline3: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ThemeColor().black,
              ),
              bodyText1: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
              bodyText2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
              subtitle1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColor().black,
              ))),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/entry',
          page: () => LoginEntryPage(),
          binding: LoginEntryBinding(),
        ),
        GetPage(
          name: '/entry/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/entry/signup',
          page: () => SignupPage(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: '/job/details',
          page: () => JobDetailsPage(),
        ),
        GetPage(
          name: '/job/list',
          page: () => JobListPage(),
          binding: JobListBinding(),
        ),
        GetPage(
          name: '/job/apply',
          page: () => ApplyJobPage(),
          binding: ApplyJobBinding(),
        )
      ],
      initialRoute: '/splash',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
