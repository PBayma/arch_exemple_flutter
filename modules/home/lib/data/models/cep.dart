import 'dart:convert';

class Cep {
  final String localidade;

  Cep({required this.localidade});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localidade': localidade,
    };
  }

  factory Cep.fromMap(Map<String, dynamic> map) {
    return Cep(
      localidade: map['localidade'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant Cep other) {
    if (identical(this, other)) return true;

    return other.localidade == localidade;
  }

  @override
  int get hashCode => localidade.hashCode;
}
