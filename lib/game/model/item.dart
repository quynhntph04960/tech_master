class Item {
  int? id;
  String? code;
  String? photo;
  bool? isFlip;
  bool? isEnable;
  int? currentClick;

  Item(
      {this.code,
      this.id,
      this.photo,
      this.currentClick,
      this.isFlip = false,
      this.isEnable = false});

  static List<Item> getLevelOne() {
    // final catOne = Item(code: "Cat", photo: "cat1.jpeg");
    // final catTwo = Item(code: "Cat", photo: "cat2.jpeg");
    // final chickenOne = Item(code: "Chicken", photo: "chicken1.jpeg");
    // final chickenTwo = Item(code: "Chicken", photo: "chicken2.jpeg");
    // final dogOne = Item(code: "Dog", photo: "dog1.jpeg");
    // final dogTwo = Item(code: "Dog", photo: "dog2.jpeg");

    final items = <Item>[];
    for (int i = 0; i < 12; i++) {
      items.add(Item(id: i, code: "Cat", photo: "cat1.jpeg"));
    }
    // items.add(catOne);
    // items.add(catTwo);
    // items.add(chickenOne);
    // items.add(chickenTwo);
    // items.add(dogOne);
    // items.add(dogTwo);

    return items;
  }
}
