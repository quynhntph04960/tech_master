mainBTVNBuoi2() {
  print(bai1("02437898989"));
  bai2();
  bai3(19);
  bai4("Happinessh");
}

bai4(String text) {
  print("------Bài 4--------");
  Map<String, dynamic> params = {};
  for (int i = 0; i < text.length; i++) {
    String valueI = text[i];
    int turn = 1;
    for (int j = i + 1; j < text.length; j++) {
      String valueJ = text[j];
      if (valueI.toLowerCase() == valueJ.toLowerCase()) {
        turn++;
      }
    }
    bool isCheck = false;
    params.forEach((key, value) {
      if (key.toLowerCase() == valueI.toLowerCase()) isCheck = true;
    });
    if (isCheck == false) {
      params[valueI] = turn;
    }
  }
  print(params);
}

bai3(int size) {
  print("------Bài 3--------");
  String calcFib = "";
  List<int> listInt = [];
  for (int i = 0; i < size; i++) {
    if (i == 0) {
      calcFib = "0";
      listInt.add(0);
    } else if (i == 1) {
      calcFib = "$calcFib + 1";
      listInt.add(1);
    } else {
      int valueA = listInt[listInt.length - 1];
      int valueB = listInt[listInt.length - 2];
      int value = valueA + valueB;
      listInt.add(value);
      calcFib = "${calcFib} + $value";
      print(calcFib);
    }
  }
}

bai2() {
  print("------Bài 2--------");
  int cube = 3;
  int valueCube = cube * cube * cube;
  print("S Cube: $valueCube");

  int height = 1;
  int width = 2;
  int weight = 3;
  int valueRectangular = weight * width * height;
  print("S Rectangular: $valueRectangular");

  double radius = 1.2;
  double heightCylinder = 4;
  var valueCylinder = 3.14 * radius * radius * heightCylinder;
  print("S Cylinder: $valueCylinder");

  double radiusCircle = 1.3;
  var valueCircle =
      (4 / 3) * 3.14 * (radiusCircle * radiusCircle * radiusCircle);
  print("S Circle: $valueCircle");
}

bool bai1(String phone) {
  print("------Bài 1--------");
  for (int i = 0; i < phone.length; i++) {
    String value = phone[i];
    if (value == "0" ||
        value == "1" ||
        value == "2" ||
        value == "3" ||
        value == "4" ||
        value == "5" ||
        value == "6" ||
        value == "7" ||
        value == "8" ||
        value == "9") {
      continue;
    } else {
      return false;
    }
  }

  String subPhone = phone.substring(0, 2);
  int sizePhone = phone.length;

  if (subPhone == "03" ||
      subPhone == "05" ||
      subPhone == "07" ||
      subPhone == "08" ||
      subPhone == "09" && sizePhone == 10) {
    return true;
  }

  if (phone.substring(0, 3) == "024" && sizePhone == 11) return true;

  return false;
}
