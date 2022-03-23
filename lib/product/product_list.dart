class ProductList {
  String prodName;
  String prodType;
  String prodPrice;
  String prodDesc;
  String prodImage;

  ProductList(
      {required this.prodName,
      required this.prodType,
      required this.prodPrice,
      required this.prodDesc,
      required this.prodImage});
}

var productList = [
  ProductList(
      prodName: "Nike Rx4",
      prodType: "Running Specialist",
      prodPrice: "\$345",
      prodDesc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
      prodImage: "assets/images/nike.png"),
  ProductList(
      prodName: "Nike JR",
      prodType: "Gym Specialist",
      prodPrice: "\$273",
      prodDesc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
      prodImage: "assets/images/nike3.png"),
  ProductList(
      prodName: "Nike QB",
      prodType: "Running Specialist",
      prodPrice: "\$571",
      prodDesc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
      prodImage: "assets/images/nike4.png"),
  ProductList(
      prodName: "Nike RQ",
      prodType: "Jogging Specialist",
      prodPrice: "\$350",
      prodDesc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elitsed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
      prodImage: "assets/images/nike2.png"),
];
