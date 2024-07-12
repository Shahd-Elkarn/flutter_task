import 'package:ffst_task/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'images/sofa2.jpg',
      'name': 'Room Sofa',
      'price': '¥2500',
      'colors': [const Color(0xfff7993ae), const Color(0xfffc9a885), const Color(0xfff282828)],
      'isFavorite': false,
    },
    {
      'image': 'images/tv.jpg',
      'name': 'Toshiba Tv',
      'price': '¥35250',
      'colors': [const Color(0xfff414142), const Color(0xfff717172), const Color(0xfff282828)],
      'isFavorite': false,
    },
    {
      'image': 'images/lamp.jpg',
      'name': 'Table Lamp',
      'price': '¥1500',
      'colors': [const Color(0xfff323232), const Color(0xfffc9a885), const Color(0xfffa05a3f)],
      'isFavorite': false,
    },
    {
      'image': 'images/table.jpg',
      'name': 'Wood Table',
      'price': '¥3200',
      'colors': [const Color(0xfff947146), const Color(0xfffc9a885), const Color(0xfff282828)],
      'isFavorite': false,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      products[index]['isFavorite'] = !products[index]['isFavorite'];
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
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 55, 24, 0),
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Find the home furniture",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xfff282828),
                    ),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
            Selector<FavoriteProvider, int>(
              selector: (_, provider) => provider.selectedTab,
              builder: (_, selectedTab, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .setSelectedTab(0);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: selectedTab == 0
                              ? const Color(0xfff7993ae)
                              : const Color(0xffCFCFCF),
                        ),
                        width: 72,
                        height: 115,
                        child: const Text("All"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .setSelectedTab(1);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: selectedTab == 1
                              ? const Color(0xfff7993ae)
                              : const Color(0xffCFCFCF),
                        ),
                        width: 70,
                        height: 90,
                        child: const Icon(Icons.storefront_sharp),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .setSelectedTab(2);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: selectedTab == 2
                              ? const Color(0xfff7993ae)
                              : const Color(0xffCFCFCF),
                        ),
                        width: 70,
                        height: 90,
                        child: const Icon(Icons.tv),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .setSelectedTab(3);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: selectedTab == 3
                              ? const Color(0xfff7993ae)
                              : const Color(0xffCFCFCF),
                        ),
                        width: 70,
                        height: 90,
                        child: const Icon(Icons.shopify_sharp),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(product: products[i]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          top: 39,
                          child: Container(
                            width: 160,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffffffffff),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[i]['name'],
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: products[i]['colors']
                                        .map<Widget>((color) => Container(
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: color,
                                                shape: BoxShape.circle,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    products[i]['price'],
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Positioned(
                          left: 12,
                          top: 0,
                          child: CircleAvatar(
                            radius: 57,
                            child: Image.asset(
                              products[i]['image'],
                              width: 117,
                              height: 117,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 137,
                          top: 16,
                          child: IconButton(
                            icon: Icon(
                              products[i]['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: products[i]['isFavorite']
                                  ? const Color(0xfff7993ae)
                                  : Colors.black,
                              size: 24,
                            ),
                            onPressed: () => toggleFavorite(i),
                          ),
                        ),
                        Positioned(
                          top: 161,
                          left: 121,
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xfff7993ae),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Color(0xffffffffff)),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

