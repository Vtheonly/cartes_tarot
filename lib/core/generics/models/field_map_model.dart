import '../base_classes/field_map.dart';

class FieldMapModel<T> extends FieldMap<T> {
  const FieldMapModel({required super.name, required super.value});

  factory FieldMapModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return FieldMapModel(
      name: json[_Keys.name] as String,
      value: fromJsonT(json[_Keys.value]),
    );
  }

  factory FieldMapModel.fromJsonKV(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    final entry = json.entries.first;
    return FieldMapModel(
      name: entry.key,
      value: fromJsonT(entry.value),
    );
  }

  FieldMapModel.fromEntity(FieldMap<T> e) : super(name: e.name, value: e.value);

  Map<String, dynamic> toJson<R>(R Function(T) toJsonT) {
    return {
      _Keys.name: name,
      _Keys.value: toJsonT(value),
    };
  }

  Map<String, dynamic> toJsonKV<R>(R Function(T) toJsonT) {
    return {
      name: toJsonT(value),
    };
  }
}

typedef _Keys = FieldMapKeys;

class FieldMapKeys {
  static const String name = 'name';
  static const String value = 'value';
}


/*
void main() {
  ValuableVarModel<Person> personVar = ValuableVarModel<Person>(
    name: 'personVar',
    value: Person(name: 'John Doe', age: 25),
  );

  Map<String, dynamic> json = personVar.toJson((person) => person.toJson());
  String jsonString = jsonEncode(json);
  print(jsonString);

  Map<String, dynamic> decodedJson = jsonDecode(jsonString);
  ValuableVarModel<Person> decodedVar = ValuableVarModel<Person>.fromJson(decodedJson, (json) => Person.fromJson(json));
  print(decodedVar.name); // Output: personVar
  print(decodedVar.value.name); // Output: John Doe
  print(decodedVar.value.age); // Output: 25
}
*/