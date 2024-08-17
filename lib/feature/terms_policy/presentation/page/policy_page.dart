import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/feature/terms_policy/presentation/bloc/policy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<PolicyBloc>().add(PolicyFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        context.read<PolicyBloc>().cancelRequest();
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: BlocBuilder<PolicyBloc, PolicyState>(
            builder: (context, state) {
              if (state is PolicyLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PolicyLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.data.data!.result!.content.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      )),
    );
  }
}
