import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageCodeModel  extends Equatable{
   final String languageCode;

  const LanguageCodeModel({this.languageCode = 'en'});


  // Edit the value of immutable state
  LanguageCodeModel copyWith({String? languageCode}) {
    return LanguageCodeModel(languageCode: languageCode ?? this.languageCode);
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'languageCode': languageCode};
  }

  factory LanguageCodeModel.fromJson(Map<String, dynamic> json) {
    return LanguageCodeModel(languageCode: json['languageCode']);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [languageCode];
   

  
}