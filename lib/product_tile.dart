import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apionly/shopproduct.dart';

Random randomn = new Random();


class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: product.isFavorite.value
                          ? Icon(Icons.favorite_rounded,color: Colors.pinkAccent,)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        product.isFavorite.toggle();
                      },
                    ),
                  )),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style:
              TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (3>2)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        (randomn.nextInt(4)+1).toString()
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir',color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
