import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/infrastructure/home/dto/owner_dto.dart';

part 'repository_dto.g.dart';

@JsonSerializable()
class RepositoryDto {
  RepositoryDto({
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.description,
  });
  @JsonKey(name: 'place_of_publication')
  String? name;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'private')
  bool? private;
  @JsonKey(name: 'owner')
  OwnerDto? owner;
  @JsonKey(name: 'description')
  String? description;

  factory RepositoryDto.fromJson(Map<String, dynamic> json) {
    return _$RepositoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RepositoryDtoToJson(this);
  }

  Repository convertToDomain() {
    return Repository(
      fullName: fullName ?? "",
      name: name ?? "",
      private: private ?? false,
      description: description ?? "",
      owner: owner?.convertToDomain() ?? OwnerDto().convertToDomain(),
    );
  }
}
