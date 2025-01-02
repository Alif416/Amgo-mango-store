
import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/color_loader_2.dart';
import 'package:myapp/constants/global_variables.dart';
import 'package:myapp/features/account/services/account_services.dart';
import 'package:myapp/features/account/widgets/single_product.dart';
import 'package:myapp/features/admin/services/admin_services.dart';
import 'package:myapp/features/order_details/screens/order_details_screen.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/order.dart';



class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final AdminServices adminServices = AdminServices();
  List<Order>? orders;

  @override
  void initState() {
    super.initState();
    fetchAllOrders();
  }

  void fetchAllOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalVariables.getAdminAppBar(
        title: "Orders",
        context: context,
      ),
      body: orders == null
          ? const ColorLoader2()
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.75,
                  crossAxisCount: 2),
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                final orderData = orders![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                        arguments: orderData);
                  },
                  child: SizedBox(
                    height: mq.height * .18,
                    child:
                        SingleProduct(image: orderData.products[0].images[0]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        icon: const Icon(Icons.logout_outlined),
        onPressed: () {
          AccountServices().logOut(context);
        },
        backgroundColor: Colors.deepPurple.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        label: const Text(
          "LogOut",
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
