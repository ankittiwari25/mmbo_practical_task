import 'package:flutter/material.dart';
import 'package:mmbo_practical/screens/widgets/map_view.dart';

import 'home_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SELECT DELIVERY LOCATION",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.pin_drop,color: Colors.grey,),
                Text("Block 47",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 21)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical:3),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(3.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.4))

                  ),
                  child: Text("CHANGE",style: Theme.of(context).textTheme.bodyText2!.copyWith(color:Colors.orange,fontSize: 11),),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("Block C3, Janakpuri, New Delhi,\nDelhi 110058, India",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13)),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
                child: const Text("CONFIRM LOCATION"),
              ),
            )
          ],
        ),
      ),
      body: const MapView(),
    );
  }
}
