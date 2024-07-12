import 'package:ffst_task/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const DetailPage({required this.product, super.key});

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
        selectedIconTheme: const IconThemeData(color: Color(0xfff7993ae)),
        unselectedIconTheme: const IconThemeData(color: Color(0xfff7993ae)),
        items: const [
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
                    child: const Icon(Icons.arrow_back),
                  ),
                  Image.asset(
                    widget.product['image'],
                    width: 277,
                    height: 303,
                  ),
                  Selector<FavoriteProvider, bool>(
                    selector: (_, p) => p.isFavorite,
                    builder: (_, isFavorite, __) {
                      return IconButton(
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavorite
                              ? const Color(0xfff7993ae)
                              : Colors.black,
                          size: 24,
                        ),
                        onPressed: Provider.of<FavoriteProvider>(context,
                                listen: false)
                            .favorite,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 21),
              Row(
                children: [
                  Text(
                    widget.product['name'],
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xfffe7e7e7)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: _decrementCounter,
                          child: const Icon(Icons.remove),
                        ),
                        //SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '$itemCounter',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: _incrementCounter,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: widget.product['colors']
                    .map<Widget>(
                      (color) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    .toList(),
              ),
              // const SizedBox(
              //   width: 3.93,
              // ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Drawing Room Wooden Sofa Set is solid wooden sofa set which you can contrast the cushion of any color. The good sight caused ue to the furniture help us relax for a longer time. ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product['price'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xfff7993ae),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 38),
                      child: Text(
                        'add to cart',
                        style: TextStyle(
                          color: Color(0xfffffffff),
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
