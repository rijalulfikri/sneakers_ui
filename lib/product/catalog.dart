import 'package:flutter/material.dart';
import 'package:sneakers/product/detail_product.dart';
import 'package:sneakers/product/product_list.dart';

class ProductCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          title: Text("Hi Jhon"),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 450) {
            return CatalogList();
          } else if (constraints.maxWidth < 650) {
            return CatalogListGrid(
              gridCount: 2,
            );
          } else if (constraints.maxWidth < 900) {
            return CatalogListGrid(
              gridCount: 3,
            );
          } else {
            return CatalogListGrid(gridCount: 4);
          }
        }));
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final ProductList product = productList[index];

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailProduct(
                product: product,
              );
            }));
          },
          child: Card(
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 12),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffE9C46A)),
                  child: Stack(children: [
                    Image.asset(product.image),
                    Container(
                      alignment: Alignment.topLeft,
                      child: FavoriteButton(),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 4),
                      alignment: Alignment.bottomRight,
                      child: Image.asset("assets/images/icons/Intersect.png"),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailProduct(product: product);
                          }));
                        },
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
                    Text(
                      product.price,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Review",
                      style: TextStyle(fontSize: 8),
                    ),
                    BuildStar(),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
      itemCount: productList.length,
    );
  }
}

class CatalogListGrid extends StatelessWidget {
  final int gridCount;

  const CatalogListGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      children: productList.map((product) {
        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailProduct(
                  product: product,
                );
              }));
            },
            child: Card(
              child: Column(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffE9C46A)),
                    child: Stack(children: [
                      Image.asset(product.image),
                      Container(
                        alignment: Alignment.topLeft,
                        child: FavoriteButton(),
                      ),
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
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
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
                      Text(
                        product.price,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Review",
                        style: TextStyle(fontSize: 8),
                      ),
                      BuildStar(),
                    ],
                  ),
                ),
              ]),
            ));
      }).toList(),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        size: 18,
        color: Color(0xff264653),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class BuildStar extends StatelessWidget {
  const BuildStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Icon(
          Icons.star,
          size: 10,
          color: Color(0xffE9C46A),
        ),
        Icon(
          Icons.star,
          size: 10,
          color: Color(0xffE9C46A),
        ),
        Icon(
          Icons.star,
          size: 10,
          color: Color(0xffE9C46A),
        ),
        Icon(
          Icons.star,
          size: 10,
          color: Color(0xffE9C46A),
        ),
      ]),
    );
  }
}
