import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home_app/core/theming.dart/app_colors.dart';
import 'package:smart_home_app/core/theming.dart/app_size.dart';
import 'package:smart_home_app/core/theming.dart/app_text_styles.dart';
import 'package:smart_home_app/generated/l10n.dart';
import 'package:smart_home_app/presentation/cubits/auth/auth_cubit.dart';
import 'package:smart_home_app/presentation/screens/layout_screen/layout_screen.dart';
import 'package:smart_home_app/presentation/widgets/gradiant_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      context.read<AuthCubit>().login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LayoutScreen()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
      S.of(context).welcome,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 8),
    Text(
      S.of(context).login_prompt,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    ),
    const SizedBox(height: 32),
              GradientTextField(
                controller: _emailController,
                validator: (value) => value!.isEmpty ? S.of(context).email_hint : null,
                hintText: S.of(context).email_hint,
                prefix: Iconsax.sms4,

              ),
              const SizedBox(height: 12),
              GradientTextField(
                controller: _passwordController,
                validator: (value) => value!.isEmpty ? S.of(context).password_hint : null,
                hintText: S.of(context).password_hint,
                prefix: Iconsax.lock4,
                

              ),
      
              const SizedBox(height: 20),
            
              state is AuthLoading
                  ? const CircularProgressIndicator()
                  :  ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: AppColors.darkBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                                side: BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                            ),
                            child:  Text(S.of(context).login_button, style: AppTextStyles.titleSmall.copyWith(
                              color: AppColors.primary,
                            )),
                          ),
            
            ],
          ),
        );
      },
    );
  }
}
