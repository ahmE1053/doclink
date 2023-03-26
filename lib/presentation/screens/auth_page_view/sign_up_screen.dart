import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/consts/date_of_birth_consts.dart';
import '../../../core/providers/create_account_provider.dart';
import '../../widgets/authentication_handling_widgets/account_creation_text_fields.dart';
import '../../widgets/authentication_handling_widgets/date_of_birth_selection_row.dart';
import '../../widgets/authentication_handling_widgets/image_selection_widget.dart';
import '../../widgets/authentication_handling_widgets/loading_button.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(),
        passwordController = useTextEditingController(),
        nameController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final obscure = useState(false);
    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final dateOfBirth = useState(<int?>[null, null, null]);
    final daySelectionList = useState(days);
    final dateOfBirthErrorStateList = useState([false, false, false]);
    final loadingState = useState(LoadingState.nonLoading);
    return Form(
      key: formKey,
      child: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: mq.height * 0.01),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mq.width * 0.07,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.01),
            const Align(child: ImageSelectionWidget()),
            SizedBox(height: mq.height * 0.01),
            EmailNamePasswordEntry(
              nameController: nameController,
              colorScheme: colorScheme,
              mq: mq,
              emailController: emailController,
              passwordController: passwordController,
              obscure: obscure,
            ),
            SizedBox(height: mq.height * 0.01),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Date Of Birth',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: mq.width * 0.05,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: mq.height * 0.01),
            DateOfBirthSelectionRow(
                dateOfBirthErrorStateList: dateOfBirthErrorStateList,
                mq: mq,
                dateOfBirth: dateOfBirth,
                daySelectionList: daySelectionList),
            SizedBox(height: mq.height * 0.02),
            Align(
              child: LoadingButton(
                onTap: () async {
                  loadingState.value = LoadingState.loading;

                  final result = await ref
                      .read(createAccountInfoProvider.notifier)
                      .createAccount(
                        dateOfBirth: dateOfBirth,
                        dateOfBirthErrorStateList: dateOfBirthErrorStateList,
                        formKey: formKey,
                        context: context,
                        name: nameController.value.text,
                        email: emailController.value.text,
                        password: passwordController.value.text,
                      );

                  result == 0
                      ? loadingState.value = LoadingState.complete
                      : loadingState.value = LoadingState.nonLoading;
                },
                text: 'Sign up',
                loading: loadingState,
                mq: mq,
              ),
            ),
            SizedBox(height: mq.height * 0.05),
          ],
        ),
      ),
    );
  }
}
