import 'package:dummy_json/core/services/api/api_helper.dart';
import 'package:dummy_json/core/utils/header/headers.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';
import 'package:dummy_json/feature/address/data/repository/profile_repository.dart';
import 'package:dummy_json/feature/address/data/services/profile_service.dart';
import 'package:dummy_json/feature/onboarding/data/repository/startup_repository.dart';
import 'package:dummy_json/feature/onboarding/data/services/startup_services.dart';
import 'package:dummy_json/feature/suggest_question/data/repository/suggest_question_repository.dart';
import 'package:dummy_json/feature/suggest_question/data/services/suggest_question_service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    ApiHelper,
    ProfileRepository,
    ProfileServices,
    HeaderClass,
    //--
    SuggestQuestionRepository,
    SuggestQuestionService,

    //--
    StartupServices,
    OnBoardingRepository,

    // Profile model
    Result,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
