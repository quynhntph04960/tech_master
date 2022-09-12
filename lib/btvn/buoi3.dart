mainBTVNBuoi3() {
  User user = User(
    id: 1998,
    address: "Hà Nội",
    avatar:
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-22.jpg",
    birtDay: "18/09/1998",
    email: "trongquynh180998@gmail.com",
    fullName: "Nguyễn Trọng Quỳnh",
    password: "123456",
    phone: "0393923233",
    registerDate: "27/08/2022",
  );

  Post postOne = Post(
      id: 1,
      content: "Content 1",
      createDate: "20/08/2022",
      status: "Status 1",
      title: "Đôi bạn học rủ nhau góp tiền ‘khởi nghiệp’ bán ma túy",
      user: user,
      listImage: [
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-11.jpg",
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-15.jpg",
        "https://anhnendep.net/wp-content/uploads/2016/03/anh-che-facebook-hai-huoc-bua-vui-nhon-48-300x229.jpg",
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-20.jpg",
      ]);

  Post postTwo = Post(
      id: 2,
      content: "Content 2",
      createDate: "22/08/2022",
      status: "Status 2",
      title: "Title 2",
      user: user,
      listImage: [
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-23.jpg",
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-21.jpg",
        "https://hanoispiritofplace.com/wp-content/uploads/2017/10/anh-bua-19.jpg",
      ]);

  print(postOne.getUrl());
  print("-----------------------");
  print(postTwo.getUrl());
}

extension StringExtension on String {
  static const _vietnamese = 'aAeEoOuUiIdDyY';
  static final _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];
}

abstract class TiengVietCore {
  static const _vietnamese = 'aAeEoOuUiIdDyY';
  static final _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];
  // static final keyWordEspecially = RegExp(
  //     r'~|`|!|@|#|$|%|^|&|*|(|)|-|_|+|=|<|,|>|.|?|/|\|;|:|"|[|{|]|}|' '');

  static String unsigned(final String text) {
    var result = text;
    result = result.replaceAll("’", "");
    result = result.replaceAll("‘", "");
    result = result.replaceAll(" ", "-");
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }
}

class Post {
  int? id;
  String? createDate, title, content, status;
  List<String>? listImage;
  User? user;

  Post(
      {this.id,
      this.createDate,
      this.title,
      this.content,
      this.status,
      this.listImage,
      this.user});

  String getUrl() {
    print("Post Id: $id");
    print("Post Title: $title");
    print("Post content: $content");
    print("Post status: $status");
    print("Post listImage: ${listImage.toString()}");

    String? titleNews = TiengVietCore.unsigned(title!);
    return "/$titleNews-$id.html";
  }
}

class User {
  int? id;
  String? registerDate,
      fullName,
      birtDay,
      address,
      phone,
      email,
      avatar,
      password;

  User(
      {this.id,
      this.registerDate,
      this.fullName,
      this.birtDay,
      this.address,
      this.phone,
      this.email,
      this.avatar,
      this.password});
}
