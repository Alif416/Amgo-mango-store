// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:myapp/features/account/services/account_services.dart';
import 'package:myapp/features/account/widgets/account_button.dart';
import 'package:myapp/features/cart/screens/cart_screen.dart';
import 'package:myapp/features/home/screens/wish_list_screen.dart';
import 'package:myapp/main.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  // final List<String> buttonNames = [
  //   "Your Orders",
  //   "Turn Seller",
  //   "Log out",
  //   "Your Wishlist",
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your Orders", onTap: () {}),
            AccountButton(
                text: "Your Wishlist",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const WishListScreen()));
                }),
          ],
        ),
        SizedBox(height: mq.height * .01),
        Row(
          children: [
            AccountButton(
                text: "Cart",
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                }),
            AccountButton(
                text: "Log out",
                onTap: () => AccountServices().logOut(context)),
          ],
        )
      ],
    );
  }
}




// Using GridView
/*
// import 'package:ecommerce_major_project/main.dart';
// import 'package:flutter/material.dart';

// class TopButtons extends StatefulWidget {
//   const TopButtons({super.key});

//   @override
//   State<TopButtons> createState() => _TopButtonsState();
// }

// class _TopButtonsState extends State<TopButtons> {
//   List<String> buttonNames = [
//     "Your Orders",
//     "Turn Seller",
//     "Log out",
//     "Your Wishlist"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: mq.width * .03),
//         child: GridView(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: mq.width * 0.04,
//             mainAxisSpacing: mq.width * 0.015,
//             childAspectRatio: 3.4,
//           ),
//           children: [
//             for (int index = 0; index < 4; index++)
//               InkWell(
//                 onTap: () {},
//                 child: Card(
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.grey, width: 1),
//                     ),
//                     child: Text(
//                       buttonNames[index],
//                       style: const TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
*/

