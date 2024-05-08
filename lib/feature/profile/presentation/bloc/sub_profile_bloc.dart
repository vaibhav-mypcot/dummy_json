import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/profile/presentation/bloc/sub_profile_event.dart';
import 'package:dummy_json/feature/profile/presentation/bloc/sub_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubProfileBloc extends Bloc<SubProfileEvent, SubProfileState> {
  final ProfileBloc profileBloc;
  SubProfileBloc({required this.profileBloc})
      : super(SubProfileInitialState()) {

          // on<GetUserDataEvent>(_getUserDetails);
      }

      // void _getUserDetails(_getUserDetails event, Emitter<SubProfileState> emit) async {
      //   final data = profileBloc.
      // }
}
