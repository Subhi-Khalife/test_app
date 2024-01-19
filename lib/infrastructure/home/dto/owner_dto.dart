import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/domain/Entities/home/owner.dart';

part 'owner_dto.g.dart';

@JsonSerializable()
class OwnerDto {
  OwnerDto({this.avatarUrl});
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  factory OwnerDto.fromJson(Map<String, dynamic> json) {
    return _$OwnerDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OwnerDtoToJson(this);
  }

  Owner convertToDomain() {
    return Owner(avatarUrl: avatarUrl ?? "");
  }
}
