import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/painters/auth_painter.dart';
import '../../widgets/authentication_handling_widgets/sign_in_card.dart';
import './sign_in_screen.dart';
import './sign_up_screen.dart';

enum AuthState {
  signin,
  signup,
}

class AuthBackgroundScreen extends HookConsumerWidget {
  const AuthBackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final containerHeight = useState(mq.height * 0.65);
    final pageViewController = useMemoized(() => PageController());
    final bottomText = useState(signinText);
    final bottomButtonText = useState(signinButtonText);
    final authState = useState(AuthState.signin);
    final otherBottomText = useState(otherSigninText);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: containerHeight.value,
                width: mq.width,
                child: CustomPaint(
                  painter: MainPainter(),
                  child: Align(
                    child: SizedBox(
                      width: mq.width * 0.8,
                      child: PageView(
                        controller: pageViewController,
                        allowImplicitScrolling: false,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          SigninScreen(),
                          SignupScreen(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: colorScheme.primary,
                    )),
                    const SizedBox(width: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: Text(
                        otherBottomText.value,
                        key: ValueKey(otherBottomText.value),
                        style: TextStyle(color: colorScheme.primary),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: colorScheme.primary,
                    )),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: mq.height * 0.05,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: SigninCard(
                          icon: const Icon(
                            EvaIcons.google,
                            color: Colors.black54,
                          ),
                          text: const Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          color: Colors.white,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SigninCard(
                          color: Colors.blueAccent,
                          text: const Text(
                            'Facebook',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            EvaIcons.facebook,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: Row(
                    key: ValueKey(bottomButtonText.value),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bottomText.value,
                      ),
                      TextButton(
                        onPressed: () {
                          if (authState.value == AuthState.signin) {
                            bottomText.value = signupText;
                            bottomButtonText.value = signupButtonText;
                            authState.value = AuthState.signup;
                            pageViewController.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                            containerHeight.value = mq.height * 0.8;
                            otherBottomText.value = otherSignupText;
                          } else {
                            otherBottomText.value = otherSigninText;
                            bottomText.value = signinText;
                            bottomButtonText.value = signinButtonText;
                            authState.value = AuthState.signin;
                            pageViewController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                            containerHeight.value = mq.height * 0.6;
                          }
                        },
                        child: Text(
                          bottomButtonText.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

const otherSigninText = 'Or sign in with';
const otherSignupText = 'Or sign up with';
const signinText = 'New here?';
const signupText = 'Been here before?';
const signinButtonText = 'Sign up';
const signupButtonText = 'Sign in';
