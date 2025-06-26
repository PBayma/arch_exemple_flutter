import 'dart:convert';

class CepDetails {
  final String ddd;
  final String logradouro;

  CepDetails({required this.ddd, required this.logradouro});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'logradouro': logradouro,
    };
  }

  factory CepDetails.fromMap(Map<String, dynamic> map) {
    return CepDetails(
      ddd: map['ddd'] as String,
      logradouro: map['logradouro'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepDetails.fromJson(String source) =>
      CepDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
