import 'package:flutter/material.dart';
import 'package:technical_task/Constent/common_color.dart';
import 'package:technical_task/Service/service.dart';
import 'package:technical_task/model/product_model.dart';

class ProductBar extends StatefulWidget {
  const ProductBar({super.key});

  @override
  ProductBarState createState() => ProductBarState();
}

class ProductBarState extends State<ProductBar> {
  List<Datum> filterLists = [];
  List<Datum> allProducts = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    fetchProducts();
    searchController.addListener(() {
      filterProducts();
    });
  }

  Future<void> fetchProducts() async {
    setState(() {
      isLoading = true; // Start loading
    });

    try {
      var response = await ApiServices().myFilterList();
      if (response != null) {
        allProducts = response.products.data;
        filterLists = List.from(allProducts);
      }
    } catch (e) {
      print('Error fetching products: $e');
    }

    setState(() {
      isLoading = false; // Stop loading
    });
  }

  void filterProducts() {
    String query = searchController.text.toLowerCase().trim();
    setState(() {
      filterLists = query.isEmpty
          ? List.from(allProducts)
          : allProducts.where((product) {
              return product.entity.title.toLowerCase().contains(query);
            }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 35,
              child: TextField(
                controller: searchController,
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  labelText: 'Search brands & products',
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true; 
                      });
                      await fetchProducts(); 
                      setState(() {
                        isLoading = false; 
                      });
                    },
                    child: Container(
                      color: mainColor,
                      height: 25,
                      width: 25,
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  prefixIcon: const Icon(Icons.arrow_back_ios, size: 16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? Center(
                      child: Image.asset(
                        "assets/preloader.gif", 
                        height: 100,
                      ),
                    )
                  : filterLists.isEmpty
                      ? const Center(child: Text('No products found.'))
                      : ListView.builder(
                          itemCount: filterLists.length,
                          itemBuilder: (context, index) {
                            final product = filterLists[index];
                            final isInStock = !product.isOutOfStock;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.grey),
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  leading: Image.network(
                                    product.entity.featuredImg.thumbnailUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: product.entity.title,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: isInStock
                                              ? " (in Stock)"
                                              : " (Out of Stock)",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: isInStock
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(
                                        "SKU: ${product.sku}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Row(
                                        children: [
                                          Text(
                                            "Quick View",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: mainColor,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Detail View",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff514ea2)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      // ignore: prefer_const_constructors
                                      Text(
                                         "Price: ₹320",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
