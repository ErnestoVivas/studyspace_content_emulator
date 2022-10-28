/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the DisplayElement type in your schema. */
@immutable
class DisplayElement extends Model {
  static const classType = const _DisplayElementModelType();
  final String id;
  final String? _key;
  final int? _page;
  final int? _index;
  final int? _type;
  final String? _value;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get key {
    return _key;
  }
  
  int? get page {
    return _page;
  }
  
  int? get index {
    return _index;
  }
  
  int? get type {
    return _type;
  }
  
  String? get value {
    return _value;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const DisplayElement._internal({required this.id, key, page, index, type, value, createdAt, updatedAt}): _key = key, _page = page, _index = index, _type = type, _value = value, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DisplayElement({String? id, String? key, int? page, int? index, int? type, String? value}) {
    return DisplayElement._internal(
      id: id == null ? UUID.getUUID() : id,
      key: key,
      page: page,
      index: index,
      type: type,
      value: value);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DisplayElement &&
      id == other.id &&
      _key == other._key &&
      _page == other._page &&
      _index == other._index &&
      _type == other._type &&
      _value == other._value;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DisplayElement {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("key=" + "$_key" + ", ");
    buffer.write("page=" + (_page != null ? _page!.toString() : "null") + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("type=" + (_type != null ? _type!.toString() : "null") + ", ");
    buffer.write("value=" + "$_value" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DisplayElement copyWith({String? id, String? key, int? page, int? index, int? type, String? value}) {
    return DisplayElement._internal(
      id: id ?? this.id,
      key: key ?? this.key,
      page: page ?? this.page,
      index: index ?? this.index,
      type: type ?? this.type,
      value: value ?? this.value);
  }
  
  DisplayElement.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _key = json['key'],
      _page = (json['page'] as num?)?.toInt(),
      _index = (json['index'] as num?)?.toInt(),
      _type = (json['type'] as num?)?.toInt(),
      _value = json['value'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'key': _key, 'page': _page, 'index': _index, 'type': _type, 'value': _value, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField KEY = QueryField(fieldName: "key");
  static final QueryField PAGE = QueryField(fieldName: "page");
  static final QueryField INDEX = QueryField(fieldName: "index");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DisplayElement";
    modelSchemaDefinition.pluralName = "DisplayElements";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DisplayElement.KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DisplayElement.PAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DisplayElement.INDEX,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DisplayElement.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DisplayElement.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DisplayElementModelType extends ModelType<DisplayElement> {
  const _DisplayElementModelType();
  
  @override
  DisplayElement fromJson(Map<String, dynamic> jsonData) {
    return DisplayElement.fromJson(jsonData);
  }
}