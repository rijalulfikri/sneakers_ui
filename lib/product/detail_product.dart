import 'package:flutter/material.dart';
import 'package:sneakers/product/catalog.dart';
import 'package:sneakers/product/product_list.dart';

class DetailProduct extends StatelessWidget {
  final ProductList product;

  DetailProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return DetailMobilePage(product: product);
      } else {
        return DetailWebPage(
          product: product,
        );
      }
    });
  }
}

class DetailMobilePage extends StatelessWidget {
  final ProductList product;

  DetailMobilePage({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffE9C46A)),
                  child: Image.asset(product.image),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Back",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.type,
                      style: TextStyle(fontFamily: "OpenSans", fontSize: 12),
                    ),
                    BuildStar(),
                  ]),
                  Expanded(
                    child: BuildOrder(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 24,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text(product.desc),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final ProductList product;

  DetailWebPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          width: 1000,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffE9C46A)),
                      child: Image.asset(product.image),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(product.desc),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Text(
                      "Note and Qty Order",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                    ),
                    BuildOrder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOrder extends StatefulWidget {
  @override
  State<BuildOrder> createState() => _BuildOrderState();
}

class _BuildOrderState extends State<BuildOrder> {
  int _qtyOrder = 1;
  int stock = 35;

  int get qtyOrder => _qtyOrder;
  set qtyOrder(newQtyOrder) {
    if (newQtyOrder <= 0) {
      newQtyOrder = 1;
    }
    _qtyOrder = newQtyOrder;
  }

  void incrementOrder() {
    setState(() {
      qtyOrder++;
    });
  }

  void decrementOrder() {
    setState(() {
      qtyOrder--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              decrementOrder();
            },
            icon: Icon(Icons.remove_circle)),
        Text(_qtyOrder.toString()),
        IconButton(
            onPressed: () {
              incrementOrder();
            },
            icon: Icon(Icons.add_circle)),
        Text("Stock : "),
        Text(
          "${stock - qtyOrder}".toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
