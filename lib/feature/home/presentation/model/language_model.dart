class LanguageModel {
  String? language;
  String? subLanguage;
  String? languageCode;
  LanguageModel({
    this.language,
    this.subLanguage,
    this.languageCode,
  });
}

// --

List<LanguageModel> get languageModel => [
      LanguageModel(
        language: 'English',
        subLanguage: 'English',
        languageCode: 'en',
      ),
      LanguageModel(
        language: 'मराठी',
        subLanguage: 'Marathi',
        languageCode: 'mr',
      ),
      LanguageModel(
        language: 'हिंदी',
        subLanguage: 'Hindi',
        languageCode: 'hi',
      ),
    ];
