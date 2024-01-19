import 'package:test_app/domain/Entities/home/owner.dart';

class Repository {
  Repository({
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.description,
  });
  Owner owner;
  String name;
  String fullName;
  bool private;
  String description;
}
