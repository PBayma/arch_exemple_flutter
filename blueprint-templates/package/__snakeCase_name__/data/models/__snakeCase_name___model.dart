import 'dart:convert';

class {{pascalCase name}}ModelExample {
  final String variableExample;

  {{pascalCase name}}ModelExample({required this.variableExample});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'variableExample': variableExample,
    };
  }

  factory {{pascalCase name}}ModelExample.fromMap(Map<String, dynamic> map) {
    return {{pascalCase name}}ModelExample(
      variableExample: map['variableExample'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant {{pascalCase name}}ModelExample other) {
    if (identical(this, other)) return true;
  
    return 
      other.variableExample == variableExample;
  }

  @override
  int get hashCode => variableExample.hashCode;
}
