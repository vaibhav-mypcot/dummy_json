import 'package:dummy_json/feature/onboarding/data/services/startup_services.dart';
import 'package:dummy_json/feature/onboarding/data/startup_model/startup_model.dart';

class OnBoardingRepository {
  final StartupServices startupServices;
  OnBoardingRepository(this.startupServices);

  Future<StartupModel> fetchStartupData() async {
    try {
      final startupData = await startupServices.fetchStartup();
      return startupData;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
