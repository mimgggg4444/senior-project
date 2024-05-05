class UserModel {
  final String name;
  final String id;
  final int age;
  final int weight;
  final String guardian;
  final int systolic;
  final int diastolic;
  final int bloodSugar;

  UserModel({
    required this.name,
    required this.id,
    required this.age,
    required this.weight,
    required this.guardian,
    required this.systolic,
    required this.diastolic,
    required this.bloodSugar,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'age': age,
      'weight': weight,
      'guardian': guardian,
      'systolic': systolic,
      'diastolic': diastolic,
      'bloodSugar': bloodSugar,
    };
  }
}