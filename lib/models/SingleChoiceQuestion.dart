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


/** This is an auto generated class representing the SingleChoiceQuestion type in your schema. */
@immutable
class SingleChoiceQuestion extends Model {
  static const classType = const _SingleChoiceQuestionModelType();
  final String id;
  final String? _key;
  final String? _title;
  final String? _image;
  final String? _equation;
  final String? _description;
  final String? _question;
  final int? _numberOfAnswers;
  final int? _correctAnswer;
  final String? _answer0;
  final String? _answer1;
  final String? _answer2;
  final String? _answer3;
  final String? _answer4;
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
  
  String? get title {
    return _title;
  }
  
  String? get image {
    return _image;
  }
  
  String? get equation {
    return _equation;
  }
  
  String? get description {
    return _description;
  }
  
  String? get question {
    return _question;
  }
  
  int? get numberOfAnswers {
    return _numberOfAnswers;
  }
  
  int? get correctAnswer {
    return _correctAnswer;
  }
  
  String? get answer0 {
    return _answer0;
  }
  
  String? get answer1 {
    return _answer1;
  }
  
  String? get answer2 {
    return _answer2;
  }
  
  String? get answer3 {
    return _answer3;
  }
  
  String? get answer4 {
    return _answer4;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SingleChoiceQuestion._internal({required this.id, key, title, image, equation, description, question, numberOfAnswers, correctAnswer, answer0, answer1, answer2, answer3, answer4, createdAt, updatedAt}): _key = key, _title = title, _image = image, _equation = equation, _description = description, _question = question, _numberOfAnswers = numberOfAnswers, _correctAnswer = correctAnswer, _answer0 = answer0, _answer1 = answer1, _answer2 = answer2, _answer3 = answer3, _answer4 = answer4, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SingleChoiceQuestion({String? id, String? key, String? title, String? image, String? equation, String? description, String? question, int? numberOfAnswers, int? correctAnswer, String? answer0, String? answer1, String? answer2, String? answer3, String? answer4}) {
    return SingleChoiceQuestion._internal(
      id: id == null ? UUID.getUUID() : id,
      key: key,
      title: title,
      image: image,
      equation: equation,
      description: description,
      question: question,
      numberOfAnswers: numberOfAnswers,
      correctAnswer: correctAnswer,
      answer0: answer0,
      answer1: answer1,
      answer2: answer2,
      answer3: answer3,
      answer4: answer4);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleChoiceQuestion &&
      id == other.id &&
      _key == other._key &&
      _title == other._title &&
      _image == other._image &&
      _equation == other._equation &&
      _description == other._description &&
      _question == other._question &&
      _numberOfAnswers == other._numberOfAnswers &&
      _correctAnswer == other._correctAnswer &&
      _answer0 == other._answer0 &&
      _answer1 == other._answer1 &&
      _answer2 == other._answer2 &&
      _answer3 == other._answer3 &&
      _answer4 == other._answer4;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SingleChoiceQuestion {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("key=" + "$_key" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("equation=" + "$_equation" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("question=" + "$_question" + ", ");
    buffer.write("numberOfAnswers=" + (_numberOfAnswers != null ? _numberOfAnswers!.toString() : "null") + ", ");
    buffer.write("correctAnswer=" + (_correctAnswer != null ? _correctAnswer!.toString() : "null") + ", ");
    buffer.write("answer0=" + "$_answer0" + ", ");
    buffer.write("answer1=" + "$_answer1" + ", ");
    buffer.write("answer2=" + "$_answer2" + ", ");
    buffer.write("answer3=" + "$_answer3" + ", ");
    buffer.write("answer4=" + "$_answer4" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SingleChoiceQuestion copyWith({String? id, String? key, String? title, String? image, String? equation, String? description, String? question, int? numberOfAnswers, int? correctAnswer, String? answer0, String? answer1, String? answer2, String? answer3, String? answer4}) {
    return SingleChoiceQuestion._internal(
      id: id ?? this.id,
      key: key ?? this.key,
      title: title ?? this.title,
      image: image ?? this.image,
      equation: equation ?? this.equation,
      description: description ?? this.description,
      question: question ?? this.question,
      numberOfAnswers: numberOfAnswers ?? this.numberOfAnswers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      answer0: answer0 ?? this.answer0,
      answer1: answer1 ?? this.answer1,
      answer2: answer2 ?? this.answer2,
      answer3: answer3 ?? this.answer3,
      answer4: answer4 ?? this.answer4);
  }
  
  SingleChoiceQuestion.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _key = json['key'],
      _title = json['title'],
      _image = json['image'],
      _equation = json['equation'],
      _description = json['description'],
      _question = json['question'],
      _numberOfAnswers = (json['numberOfAnswers'] as num?)?.toInt(),
      _correctAnswer = (json['correctAnswer'] as num?)?.toInt(),
      _answer0 = json['answer0'],
      _answer1 = json['answer1'],
      _answer2 = json['answer2'],
      _answer3 = json['answer3'],
      _answer4 = json['answer4'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'key': _key, 'title': _title, 'image': _image, 'equation': _equation, 'description': _description, 'question': _question, 'numberOfAnswers': _numberOfAnswers, 'correctAnswer': _correctAnswer, 'answer0': _answer0, 'answer1': _answer1, 'answer2': _answer2, 'answer3': _answer3, 'answer4': _answer4, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField KEY = QueryField(fieldName: "key");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField EQUATION = QueryField(fieldName: "equation");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField QUESTION = QueryField(fieldName: "question");
  static final QueryField NUMBEROFANSWERS = QueryField(fieldName: "numberOfAnswers");
  static final QueryField CORRECTANSWER = QueryField(fieldName: "correctAnswer");
  static final QueryField ANSWER0 = QueryField(fieldName: "answer0");
  static final QueryField ANSWER1 = QueryField(fieldName: "answer1");
  static final QueryField ANSWER2 = QueryField(fieldName: "answer2");
  static final QueryField ANSWER3 = QueryField(fieldName: "answer3");
  static final QueryField ANSWER4 = QueryField(fieldName: "answer4");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SingleChoiceQuestion";
    modelSchemaDefinition.pluralName = "SingleChoiceQuestions";
    
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
      key: SingleChoiceQuestion.KEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.EQUATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.QUESTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.NUMBEROFANSWERS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.CORRECTANSWER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.ANSWER0,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.ANSWER1,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.ANSWER2,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.ANSWER3,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SingleChoiceQuestion.ANSWER4,
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

class _SingleChoiceQuestionModelType extends ModelType<SingleChoiceQuestion> {
  const _SingleChoiceQuestionModelType();
  
  @override
  SingleChoiceQuestion fromJson(Map<String, dynamic> jsonData) {
    return SingleChoiceQuestion.fromJson(jsonData);
  }
}