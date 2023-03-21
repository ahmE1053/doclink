import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpecialitiesScreen extends HookConsumerWidget {
  const SpecialitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialities'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                // ref
                //     .watch(routerHandlerProvider.notifier)
                //     .enterNewScreen('test');
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
