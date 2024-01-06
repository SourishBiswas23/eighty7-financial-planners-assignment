import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/joke_bloc/joke_bloc.dart';
import '../routes.dart';
import '../theme/app_theme.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jokes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
            fontSize: AppTheme.bodyBig,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                  child: BlocBuilder<JokeBloc, JokeState>(
                    builder: (context, state) {
                      if (state is SingleJokeState) {
                        return Text(state.joke);
                      } else if (state is TwoPartJokeState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Setup:',
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${state.setup}',
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Delivery:',
                                    style: TextStyle(
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${state.delivery}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  )
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AppNavigator.pushReplace(route: AppRoutes.homePage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTheme.headingSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
