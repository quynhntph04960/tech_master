class ProductModel {
  final int? id;
  final String? name;
  final int? offer; // ưu đãi
  final int? price; // giá bán
  final int? sold; // đã bán
  final String? image;

  ProductModel({
    this.id,
    this.name,
    this.offer,
    this.price,
    this.sold,
    this.image,
  });
}
