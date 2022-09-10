class Item {
  final String code;
  final String photo;
  bool? isFlip;

  Item({required this.code, required this.photo, this.isFlip = false});

  static List<Item> getLevelOne() {
    final catOne = Item(code: "Cat", photo: "cat1.jpeg");
    final catTwo = Item(code: "Cat", photo: "cat2.jpeg");
    final chickenOne = Item(code: "Chicken", photo: "chicken1.jpeg");
    final chickenTwo = Item(code: "Chicken", photo: "chicken2.jpeg");
    final dogOne = Item(code: "Dog", photo: "dog1.jpeg");
    final dogTwo = Item(code: "Dog", photo: "dog2.jpeg");

    final items = <Item>[];
    items.add(catOne);
    items.add(catTwo);
    items.add(chickenOne);
    items.add(chickenTwo);
    items.add(dogOne);
    items.add(dogTwo);

    return items;
  }
}
