import 'package:dio/dio.dart';
import 'package:dummy_json/feature/terms_policy/data/model/policy_model.dart';
import 'package:dummy_json/feature/terms_policy/data/service/policy_service.dart';

class PolicyRepository {
  final PolicyService policyService;
  PolicyRepository(this.policyService);

  Future<PolicyModel> fetchPolicyData({CancelToken? cancelToken}) async {
    try {
      final policyData = await policyService.getPolicyData(cancelToken: cancelToken);
      return policyData;
    } catch (e) {
      throw Exception('Failed to fetch policy data data: $e');
    }
  }
}
