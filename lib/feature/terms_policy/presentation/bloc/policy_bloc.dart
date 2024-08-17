import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dummy_json/feature/terms_policy/data/model/policy_model.dart';
import 'package:dummy_json/feature/terms_policy/data/repository/policy_repository.dart';
import 'package:equatable/equatable.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  final PolicyRepository _policyRepository;
  CancelToken? _cancelToken;

  PolicyBloc({required PolicyRepository policyRepository})
      : _policyRepository = policyRepository,
        super(PolicyInitial()) {
    on<PolicyFetchEvent>(_onPolicyFetchEvent);
  }

  _onPolicyFetchEvent(PolicyFetchEvent event, Emitter<PolicyState> emit) async {
    try {
      emit(PolicyLoadingState());
      // Initialize the CancelToken
      _cancelToken = CancelToken();
      await Future.delayed(const Duration(seconds: 3));
      final policy =
          await _policyRepository.fetchPolicyData(cancelToken: _cancelToken);
      if (policy.success == 0) {
        emit(const PolicyFailedState("Failed to fetch policy data"));
      } else {
        emit(PolicyLoadedState(policy));
      }
    } catch (e) {
      if (e is DioException && CancelToken.isCancel(e)) {
        print('API call canceled: ${e.message}');
      } else {
        emit(
            PolicyFailedState("Failed to fetch policy data : ${e.toString()}"));
      }
    }
  }

  void cancelRequest() {
    // Cancel the API request if needed
    _cancelToken?.cancel(" \x1B[32m Request was canceled by user.");
  }

  @override
  Future<void> close() {
    // Cancel the API request when the BLoC is closed
    // _policyRepository.cancelRequest();
    cancelRequest();
    print('\x1B[32m policy bloc closed');
    return super.close();
  }
}
