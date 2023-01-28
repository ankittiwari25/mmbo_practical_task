import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mmbo_practical/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.free_breakfast_sharp),
          label: 'Fresh',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Food',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.smart_toy),
          label: 'Mart',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: Colors.black,
        ),
      ], type: BottomNavigationBarType.fixed, currentIndex: 0, selectedItemColor: Colors.orange, iconSize: 40, onTap: (data) {}, elevation: 5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.navigation, color: Colors.orange),
                        Text(
                          "Block C3A",
                          style: Theme.of(context).textTheme.headline1,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Block C3, Janakpuri, New Delhi...",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  child: const Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                    size: 70,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Search for veggies. fruits and more...",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.search_sharp,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.delivery_dining,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Delivery Slot",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
                  ),
                  Text(
                    " - Dec 05. Mon (6am-9am)",
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(height: 200, viewportFraction: 1.0),
              itemBuilder: (context, i, id) {
                //for onTap to redirect to another screen
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    //ClipRRect for image border radius
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://media.istockphoto.com/id/1409236261/photo/healthy-food-healthy-eating-background-fruit-vegetable-berry-vegetarian-eating-superfood.jpg?s=1024x1024&w=is&k=20&c=ZVp7_qM1hRjKR-nfx3u_L7Mb16og4S4QwqYxUtWiM8c=',
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    var url =
                        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80';
                    print(url.toString());
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flash Deals", style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("See more", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16)),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 235,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: 120,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.withOpacity(0.3))),
                          child: Image.network(
                            "https://media.istockphoto.com/id/1258142863/photo/tomatoes-isolate-on-white-background-tomato-half-isolated-tomatoes-side-view-whole-cut-slice.jpg?b=1&s=170667a&w=0&k=20&c=hFvgq7wOVkoxHR7O2KE3DDbO127FJT4Ub_NZJ6FQCTQ=",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Tomato",
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
                        ),
                        Text(
                          "(Tamatar)",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "₹42",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14, decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "₹24/kg",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14, decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "24",
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Pack:500gm",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                          child: Text(
                            "ADD",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 60),
            Text("Categories", style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 17)),
            SizedBox(
              height: 300,
              child: GridView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 15),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/fruit-background-4270990.jpg"),
                          radius: 50,
                        ),
                        const SizedBox(height: 7),
                        Text("Fruit ${index + 1}", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16))
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 60),
            CarouselSlider.builder(
              itemCount: 2,
              options: CarouselOptions(height: 180, viewportFraction: 0.7, reverse: false),
              itemBuilder: (context, i, id) {
                //for onTap to redirect to another screen
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    //ClipRRect for image border radius
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://media.istockphoto.com/id/1409236261/photo/healthy-food-healthy-eating-background-fruit-vegetable-berry-vegetarian-eating-superfood.jpg?s=1024x1024&w=is&k=20&c=ZVp7_qM1hRjKR-nfx3u_L7Mb16og4S4QwqYxUtWiM8c=',
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    var url =
                        'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80';
                    print(url.toString());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
