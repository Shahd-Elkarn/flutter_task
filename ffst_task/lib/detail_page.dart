import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int itemCounter = 0;

  void _incrementCounter() {
    setState(() {
      itemCounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (itemCounter > 0) {
        itemCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedIconTheme: IconThemeData(color: Color(0xfff7993AE)),
        unselectedIconTheme: IconThemeData(color: Color(0xfff7993AE)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "*",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "*"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "*"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "*"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  
                  Image.asset(
                    'images/sofa.jpg',
                    width: 277,
                    height: 303,
                  ),
                 
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(height: 21),
              Row(
                children: [
                  Text(
                    "Roma Sofa",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfffE7E7E7)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: _decrementCounter,
                          child: Icon(Icons.remove),
                        ),
                        //SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '$itemCounter',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: _incrementCounter,
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 14.72,
                    decoration: BoxDecoration(
                      color: Color(0xfff7993AE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 3.93,
                  ),
                  Container(
                    height: 15,
                    width: 14.72,
                    decoration: BoxDecoration(
                      color: Color(0xfffC9A885),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: 3.93,
                  ),
                  Container(
                    height: 15,
                    width: 14.72,
                    decoration: BoxDecoration(
                      color: Color(0xfff282828),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Drawing Room Wooden Sofa Set is solid wooden sofa set which you can contrast the cushion of any color. The good sight caused ue to the furniture help us relax for a longer time. ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥2500",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: () {},
                    color: Color(0xfff7993AE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5), // Adjust the value as needed
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 38),
                      child: Text(
                        'add to cart',
                        style: TextStyle(
                          color: Color(0xfffFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
