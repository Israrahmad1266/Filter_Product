import 'package:flutter/material.dart';
import 'package:technical_task/Helper/appbaar.dart';
import 'package:technical_task/Helper/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const ProductBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200, // Slightly darker for contrast
        leading: const Icon(Icons.menu, color: Colors.black), // Specify icon color
        title: Image.asset(
          "assets/logoc.png",
          height: 40,
        ),
        actions: [
          const AppBaarNavi(iconPath: "assets/cart.png", label: 'Carttt'),
          const AppBaarNavi(iconPath: "assets/account.png", label: 'Account'),
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Image.asset(
                      "assets/search.png",
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Search',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Center(child: Text('Home Screen Content Here')),
    );
  }
}
