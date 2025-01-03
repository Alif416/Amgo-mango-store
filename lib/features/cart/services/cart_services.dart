import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/constants/error_handling.dart';
import 'package:myapp/constants/utils.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';



class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    print("========> Inside the remove from cart function");
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse(
          '$uri/api/remove-from-cart/${product.id}',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      //use context ensuring the mounted property across async functions
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            print("\nInside on success method..");
            User user =
                userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            userProvider.setUserFromModel(user);
            print("\nUser cart now is ${user.cart}");
          },
        );
      }
    } catch (e) {
      print("\n========>Inside the catch block of remove from cart");
      showSnackBar(context: context, text: e.toString());
    }
  }
}
