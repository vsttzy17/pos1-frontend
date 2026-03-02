import 'package:flutter/material.dart';
import 'package:fe/features/product/data/product_api.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductApi _api = ProductApi();
  List<Map<String, dynamic>> cart = [];

  List products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final data = await _api.getProducts();

      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      // print("ERROR FETCH PRODUCTS: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void addToCart(Map<String, dynamic> product) {
    final index = cart.indexWhere((item) => item['id'] == product['id']);

    if (index != -1) {
      cart[index]['qty'] += 1;
    } else {
      cart.add({
        "id": product['id'],
        "name": product['name'],
        "price": product['price'],
        "stock": product['stock'],
      });
    }

    setState(() {});
  }

int calculateTotal() {
  double total = 0;
  for (var item in cart) {
    double price = double.parse(item['price'].toString());
    double stock = double.parse(item['stock'].toString());
    total += price * stock;
  }
  return total.toInt();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text("No Products"))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        title: Text(item['name']),
                        subtitle: Text("Stock: ${item['stock']}"),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Rp ${item['price']}"),
                              IconButton(
                                icon: const Icon(Icons.add_shopping_cart),
                                onPressed: () => addToCart(item),
                              ),
                            ],
                          ),
                        ),

                      ),
                    );
                  },
                ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Total: Rp ${calculateTotal()}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}