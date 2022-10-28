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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Subtopic type in your schema. */
@immutable
class Subtopic extends Model {
  static const classType = const _SubtopicModelType();
  final String id;
  final int? _subject;
  final int? _topic;
  final int? _key;
  final int? _index;
  final bool? _isGroupLabel;
  final String? _name;
  final TopicCategories? _categories;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int get subject {
    try {
      return _subject!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get topic {
    try {
      return _topic!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get key {
    try {
      return _key!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get index {
    try {
      return _index!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isGroupLabel {
    try {
      return _isGroupLabel!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TopicCategories get categories {
    try {
      return _categories!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Subtopic._internal({required this.id, required subject, required topic, required key, required index, required isGroupLabel, required name, required categories, createdAt, updatedAt}): _subject = subject, _topic = topic, _key = key, _index = index, _isGroupLabel = isGroupLabel, _name = name, _categories = categories, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Subtopic({String? id, required int subject, required int topic, required int key, required int index, required bool isGroupLabel, required String name, required TopicCategories categories}) {
    return Subtopic._internal(
      id: id == null ? UUID.getUUID() : id,
      subject: subject,
      topic: topic,
      key: key,
      index: index,
      isGroupLabel: isGroupLabel,
      name: name,
      categories: categories);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subtopic &&
      id == other.id &&
      _subject == other._subject &&
      _topic == other._topic &&
      _key == other._key &&
      _index == other._index &&
      _isGroupLabel == other._isGroupLabel &&
      _name == other._name &&
      _categories == other._categories;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Subtopic {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("subject=" + (_subject != null ? _subject!.toString() : "null") + ", ");
    buffer.write("topic=" + (_topic != null ? _topic!.toString() : "null") + ", ");
    buffer.write("key=" + (_key != null ? _key!.toString() : "null") + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isGroupLabel=" + (_isGroupLabel != null ? _isGroupLabel!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("categories=" + (_categories != null ? _categories!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Subtopic copyWith({String? id, int? subject, int? topic, int? key, int? index, bool? isGroupLabel, String? name, TopicCategories? categories}) {
    return Subtopic._internal(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      topic: topic ?? this.topic,
      key: key ?? this.key,
      index: index ?? this.index,
      isGroupLabel: isGroupLabel ?? this.isGroupLabel,
      name: name ?? this.name,
      categories: categories ?? this.categories);
  }
  
  Subtopic.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _subject = (json['subject'] as num?)?.toInt(),
      _topic = (json['topic'] as num?)?.toInt(),
      _key = (json['key'] as num?)?.toInt(),
      _index = (json['index'] as num?)?.toInt(),
      _isGroupLabel = json['isGroupLabel'],
      _name = json['name'],
      _categories = json['categories']?['serializedData'] != null
        ? TopicCategories.fromJson(new Map<String, dynamic>.from(json['categories']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'subject': _subject, 'topic': _topic, 'key': _key, 'index': _index, 'isGroupLabel': _isGroupLabel, 'name': _name, 'categories': _categories?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField SUBJECT = QueryField(fieldName: "subject");
  static final QueryField TOPIC = QueryField(fieldName: "topic");
  static final QueryField KEY = QueryField(fieldName: "key");
  static final QueryField INDEX = QueryField(fieldName: "index");
  static final QueryField ISGROUPLABEL = QueryField(fieldName: "isGroupLabel");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField CATEGORIES = QueryField(fieldName: "categories");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Subtopic";
    modelSchemaDefinition.pluralName = "Subtopics";
    
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
      key: Subtopic.SUBJECT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Subtopic.TOPIC,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Subtopic.KEY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Subtopic.INDEX,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Subtopic.ISGROUPLABEL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Subtopic.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'categories',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TopicCategories')
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

class _SubtopicModelType extends ModelType<Subtopic> {
  const _SubtopicModelType();
  
  @override
  Subtopic fromJson(Map<String, dynamic> jsonData) {
    return Subtopic.fromJson(jsonData);
  }
}