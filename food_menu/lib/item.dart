class Item {
  String id;
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLfXlYfT3kAP6mMQjxF5tydeVfzSCa70eAD3ixi4GPUawH8TDrgQ";
  String title = "MEXICAN BURGER WITH CHIPS";
  bool isVeg = true;
  double price = 15.00;
  String currency = "AED";
  int cartCount = 0;
  int size = 0; // 0 -> Normal, 1 -> Regular, 2 -> Large

  /// get the price of item with currency
  String getFormattedPrice() {
    return currency + " " + price.toStringAsFixed(2);
  }
}
