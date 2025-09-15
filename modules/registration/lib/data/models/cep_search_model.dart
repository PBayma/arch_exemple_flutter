// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CepSearchModel {
  final String ddd;
  final String logradouro;

  CepSearchModel({required this.ddd, required this.logradouro});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'logradouro': logradouro,
    };
  }

  factory CepSearchModel.fromMap(Map<String, dynamic> map) {
    return CepSearchModel(
      ddd: map['ddd'] as String,
      logradouro: map['logradouro'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepSearchModel.fromJson(String source) =>
      CepSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CepSearchModel other) {
    if (identical(this, other)) return true;

    return other.ddd == ddd && other.logradouro == logradouro;
  }

  @override
  int get hashCode => ddd.hashCode ^ logradouro.hashCode;
}
