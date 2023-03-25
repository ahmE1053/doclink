import 'package:doclink/presentation/widgets/authentication_handling_widgets/my_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {this.enabled = true,
      Key? key,
      required this.controller,
      required this.colorScheme,
      required this.searchFunction,
      required this.formKey,
      required this.ref,
      required this.provider})
      : super(key: key);

  final TextEditingController controller;
  final ColorScheme colorScheme;
  final void Function() searchFunction;
  final GlobalKey<FormState> formKey;
  final WidgetRef ref;
  final StateProvider provider;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: MyTextField(
        enabled: enabled,
        controller: controller,
        colorScheme: colorScheme,
        label: 'Search',
        suffix: IconButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            searchFunction();
            FocusManager.instance.primaryFocus!.unfocus();
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        onChanged: (value) {
          ref.read(provider.notifier).update((state) => value);
        },
        validator: (value) {
          if (value!.isEmpty || value.trim().isEmpty) {
            return 'Text can\'t be empty';
          }
          if (value.length < 3) {
            return 'Text can\'t be less than 3 characters';
          }
          return null;
        },
        inputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (!formKey.currentState!.validate()) return;
          searchFunction();
          FocusManager.instance.primaryFocus!.unfocus();
        },
      ),
    );
  }
}
