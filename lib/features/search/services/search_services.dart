import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/constants/error_handling.dart';
import 'package:myapp/constants/utils.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';


class SearchServices {
  Future<List<Product>> fetchSearchedProduct(
      {required BuildContext context, required String searchQuery}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/products/search/$searchQuery"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      var data = jsonDecode(res.body);

      // List listLength = jsonDecode(res.body);
      //jsonEncode => [object] to a JSON string.
      //jsonDecode => String to JSON object.
      if (context.mounted) {
        httpErrorHandle(
          //handling the http errors quiet efficiently
          response: res,
          context: context,
          onSuccess: () {
            for (Map<String, dynamic> item in data) {
              // print(item['name']);
              productList.add(Product.fromJson(item));
            }
          },
        );
      }

      // print("Products length : ${jsonDecode(res.body).length}");
    } catch (e) {
      showSnackBar(
          // ignore: use_build_context_synchronously
          context: context,
          text:
              "Following Error in fetching Products [Search] : ${e.toString()}");
    }
    return productList;
  }
}
