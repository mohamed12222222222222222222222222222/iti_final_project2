import 'package:flutter/material.dart';
import 'package:iti_final_project2/developer_screen.dart';
import 'package:iti_final_project2/product_screen.dart';
import 'package:iti_final_project2/profile_screen.dart';

import 'category_screen.dart';
class AppScreen extends StatefulWidget {
   AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  int currentindex = 0;

  List<Widget> screens=[
    ProductsScreen(),
    categoriesScreen(),
    ProfileScreen(),

  ];

  @override
  void initState()
  {

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: const Center(
            child: Text(
                "Fruits Store",style: TextStyle(fontSize: 25,),
            ),
          ),
          actions: [
            IconButton(
              onPressed: ()
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => DeveloperScreen(),));
              },
              icon:const Icon(
                Icons.developer_board,
              ),
            ),
            IconButton(
              onPressed: ()
              {
              },
              icon:const Icon(
                Icons.inbox,
              ),
            ),
          ],
        ),
        body: screens[currentindex],
        bottomNavigationBar:  BottomNavigationBar(
            elevation: 0,
            currentIndex: currentindex,
            onTap: (index){
              setState(() {
                currentindex= index;
              });
            },
            items:  const [
              BottomNavigationBarItem(
                icon:Icon(
                    Icons.production_quantity_limits) ,
                label: "product",

              ),
              BottomNavigationBarItem(
                icon:Icon(
                    Icons.category) ,
                label: "Category",

              ),
              BottomNavigationBarItem(
                icon:Icon(
                    Icons.account_box),
                label: "profile",

              ),
            ],
            ),
        );
    }
}




