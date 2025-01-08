class Outputcomponent {
  final String skuid;
  final String boxNo;
  final int stock;
  final String? warning;

  Outputcomponent(
      {required this.skuid,
      required this.boxNo,
      required this.stock,
      this.warning});

  factory Outputcomponent.fromJson(Map<String, dynamic> json) {
    return Outputcomponent(
      skuid: json['skuid'],
      boxNo: json['boxNo'],
      stock: json['stock'],
      warning: json['warning'],
    );
  }
}
