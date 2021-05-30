class IndonesiaCase {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;

  IndonesiaCase({
    required this.name,
    required this.positif,
    required this.sembuh,
    required this.meninggal
  });

  factory IndonesiaCase.fromJson(Map<String, dynamic> json) {
    return IndonesiaCase(
        name: json['name'] == null ? '' : json['name'],
        positif: json['positif'] == null ? 0 : json['positif'],
        sembuh: json['sembuh'] == null ? 0 : json['sembuh'],
        meninggal: json['meninggal'] == null ? 0 : json['meninggal']
    );
  }

}