import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/utils/background.dart';
import 'package:smart_home_app/data/datasources/firebase_auth_datasource.dart';
import 'package:smart_home_app/data/repositories/auth_repository_impl.dart';
import 'package:smart_home_app/domain/usecases/login_usecase.dart';
import 'package:smart_home_app/presentation/cubits/auth/auth_cubit.dart';
import 'package:smart_home_app/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        LoginUseCase(
          AuthRepositoryImpl(FirebaseAuthDataSource()),
        ),
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: LoginForm(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
