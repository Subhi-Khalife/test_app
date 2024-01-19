// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryDto _$RepositoryDtoFromJson(Map<String, dynamic> json) =>
    RepositoryDto(
      name: json['place_of_publication'] as String?,
      fullName: json['full_name'] as String?,
      private: json['private'] as bool?,
      owner: json['owner'] == null
          ? null
          : OwnerDto.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RepositoryDtoToJson(RepositoryDto instance) =>
    <String, dynamic>{
      'place_of_publication': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'description': instance.description,
    };
