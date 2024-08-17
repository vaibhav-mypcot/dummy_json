import 'package:dummy_json/feature/otp/data/repository/validate_otp_repository.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_event.dart';
import 'package:dummy_json/feature/otp/presentation/bloc/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final ValidateOtpRepository validateOtpRepository;
  OtpBloc({required this.validateOtpRepository}) : super(OtpInitialState()) {
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  void _onVerifyOtp(VerifyOtpEvent event, Emitter<OtpState> emit) async {
    try {
      if (state is VerifyLoadingState) return;

      final verifyOtpStatus =
          await validateOtpRepository.validateOTP(event.phoneNumber, event.otp);

      emit(VerifySuccessState(verifyOtpStatus.success!));
    } catch (e) {
      emit(VerifyErrorState(e.toString()));
    }
  }
}
