
class Outputcomponent {
  final String skuid;
  final String boxNo;
  final int stock;

  Outputcomponent({required this.skuid, required this.boxNo, required this.stock});

   factory Outputcomponent.fromJson(Map<String, dynamic> json) {
    return Outputcomponent(
      skuid: json['skuid'],
      boxNo: json['boxNo'],
      stock: json['stock'],
    );
  }
}
