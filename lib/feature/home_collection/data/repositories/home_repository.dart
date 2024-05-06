import 'package:dummy_json/feature/home_collection/data/home_model/home_model.dart';
import 'package:dummy_json/feature/home_collection/data/services/home_services.dart';

class HomeRepository {
  final HomeServices homeServices;
  HomeRepository(this.homeServices);

  Future<HomeModel> fetchHomeData() async {
    try {
      final homeData = await homeServices.fetchHomeList();
      return homeData;
    } catch (e) {
      throw Exception('Failed to fetch home data: $e');
    }
  }
}
