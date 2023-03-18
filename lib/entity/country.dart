class Country {
  final String code;
  final String en;
  final String cn;
  final String prefix;

  const Country(
      {required this.cn,
      required this.en,
      required this.code,
      required this.prefix});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        cn: json['cn'],
        en: json['en'],
        code: json['code'],
        prefix: json['prefix']);
  }
}
