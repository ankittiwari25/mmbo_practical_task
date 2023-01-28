import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmbo_practical/app_images.dart';
import 'package:mmbo_practical/screens/location_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMBO TASK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          headline2: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16),
          bodyText2: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
          height: 50,
          buttonColor: Colors.orange,
        ),
      ),
      home: const MyHomePage(title: 'MMBO TASK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.flagOfIndia, height: 30, width: 30),
            const SizedBox(height: 10),
            Text(
              "Proudly make India",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            Center(child: Image.asset(AppImages.locationImages, height: 100, width: 100)),
            const SizedBox(height: 10),
            Center(child: Text("INDIA'S FIRST", style: Theme.of(context).textTheme.headline1)),
            const SizedBox(height: 5),
            Center(child: Text("APP FOR STREET MMBO", style: Theme.of(context).textTheme.bodyText1)),
            const SizedBox(height: 40),
            Text("ALMOST THERE!", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 5),
            Text(
              "Login or Sign up to place your order",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                labelText: 'PHONE NUMBER',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const LocationScreen()));
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
                child: const Text("CONTINUE"),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
