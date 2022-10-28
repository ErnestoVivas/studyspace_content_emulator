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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the MultipleChoiceQuestionSet type in your schema. */
@immutable
class MultipleChoiceQuestionSet extends Model {
  static const classType = const _MultipleChoiceQuestionSetModelType();
  final String id;
  final String? _key;
  final int? _difficulty;
  final List<MultipleChoiceQuestion>? _questions;
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
  
  int? get difficulty {
    return _difficulty;
  }
  
  List<MultipleChoiceQuestion>? get questions {
    return _questions;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MultipleChoiceQuestionSet._internal({required this.id, key, difficulty, questions, createdAt, updatedAt}): _key = key, _difficulty = difficulty, _questions = questions, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MultipleChoiceQuestionSet({String? id, String? key, int? difficulty, List<MultipleChoiceQuestion>? questions}) {
    return MultipleChoiceQuestionSet._internal(
      id: id == null ? UUID.getUUID() : id,
      key: key,
      difficulty: difficulty,
      questions: questions != null ? List<MultipleChoiceQuestion>.unmodifiable(questions) : questions);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MultipleChoiceQuestionSet &&
      id == other.id &&
      _key == other._key &&
      _difficulty == other._difficulty &&
      DeepCollectionEquality().equals(_questions, other._questions);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MultipleChoiceQuestionSet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("key=" + "$_key" + ", ");
    buffer.write("difficulty=" + (_difficulty != null ? _difficulty!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MultipleChoiceQuestionSet copyWith({String? id, String? key, int? difficulty, List<MultipleChoiceQuestion>? questions}) {
    return MultipleChoiceQuestionSet._internal(
      id: id ?? this.id,
      key: key ?? this.key,
      difficulty: difficulty ?? this.difficulty,
      questions: questions ?? this.questions);
  }
  
  MultipleChoiceQuestionSet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _key = json['key'],
      _difficulty = (json['difficulty'] as num?)?.toInt(),
      _questions = json['questions'] is List
        ? (json['questions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MultipleChoiceQuestion.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'key': _key, 'difficulty': _difficulty, 'questions': _questions?.map((MultipleChoiceQuestion? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField KEY = QueryField(fieldName: "key");
  static final QueryField DIFFICULTY = QueryField(fieldName: "difficulty");
  static final QueryField QUESTIONS = QueryField(
    fieldName: "questions",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MultipleChoiceQuestion).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MultipleChoiceQuestionSet";
    modelSchemaDefinition.pluralName = "MultipleChoiceQuestionSets";
    
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
      key: MultipleChoiceQuestionSet.KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MultipleChoiceQuestionSet.DIFFICULTY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: MultipleChoiceQuestionSet.QUESTIONS,
      isRequired: false,
      ofModelName: (MultipleChoiceQuestion).toString(),
      associatedKey: MultipleChoiceQuestion.MULTIPLECHOICEQUESTIONSETID
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

class _MultipleChoiceQuestionSetModelType extends ModelType<MultipleChoiceQuestionSet> {
  const _MultipleChoiceQuestionSetModelType();
  
  @override
  MultipleChoiceQuestionSet fromJson(Map<String, dynamic> jsonData) {
    return MultipleChoiceQuestionSet.fromJson(jsonData);
  }
}