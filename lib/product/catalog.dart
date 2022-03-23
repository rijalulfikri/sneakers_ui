import 'package:flutter/material.dart';
import 'package:sneakers/product/detail_product.dart';
import 'package:sneakers/product/product_list.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi Jhon")),
      body: ProductCatalogList(),
    );
  }
}

class ProductCatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final ProductList product = productList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailProduct();
            }));
          },
          child: Card(
              child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 12),
                margin: EdgeInsets.all(5),
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE9C46A)),
                child: Stack(children: [
                  Image.asset(product.prodImage),
                  Container(
                    padding: const EdgeInsets.only(right: 10, bottom: 4),
                    alignment: Alignment.bottomRight,
                    child: Image.asset("assets/images/icons/Intersect.png"),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.prodName,
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.prodType,
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 12),
                  ),
                  Text(
                    product.prodPrice,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Review",
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ),
          ])),
        );
      },
      itemCount: productList.length,
    );
  }
}

/*


      */