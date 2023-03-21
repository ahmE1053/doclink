import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/providers/auth_provider.dart';
import '../../widgets/authentication_handling_widgets/error_dialog.dart';
import '../../widgets/authentication_handling_widgets/loading_button.dart';
import '../../widgets/authentication_handling_widgets/my_text_field_widget.dart';

class SigninScreen extends HookConsumerWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(),
        passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final obscure = useState(false);
    final loading = useState(LoadingState.nonLoading);
    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
              child: Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 40),
            MyTextField(
              controller: emailController,
              colorScheme: colorScheme,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Your email can\'t be empty!';
                }
                return value.isValidEmail() ? null : 'Check your email!';
              },
              label: 'Email',
              inputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            MyTextField(
              label: 'Password',
              controller: passwordController,
              colorScheme: colorScheme,
              obscure: obscure.value,
              suffix: GestureDetector(
                onTap: () {
                  obscure.value = !obscure.value;
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: obscure.value
                      ? Icon(
                          key: const ValueKey(1),
                          Bootstrap.eye,
                          color: colorScheme.primary)
                      : Icon(
                          Bootstrap.eye_slash,
                          key: const ValueKey(2),
                          color: colorScheme.primary,
                        ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Your password can\'t be empty';
                }
                if (value.length < 8) {
                  return 'Your password can\'t be less than 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Align(
              child: LoadingButton(
                loading: loading,
                mq: mq,
                onTap: () async {
                  loading.value = LoadingState.loading;
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  await ref.read(authenticationProvider.notifier).signIn(
                        emailController.value.text,
                        passwordController.value.text,
                      );
                  if (ref.read(authenticationProvider.notifier).errorState &&
                      context.mounted) {
                    await errorDialog(
                      ref.read(authenticationProvider.notifier).errorText,
                      context,
                    );
                    loading.value = LoadingState.nonLoading;
                    return;
                  }
                  await Future.delayed(const Duration(milliseconds: 500),
                      () => loading.value = LoadingState.complete);
                  if (context.mounted) {
                    context.go('/home');
                  }
                },
                text: 'Sign in',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot your password?'),
            ),
          ],
        ),
      ),
    );
  }
}
