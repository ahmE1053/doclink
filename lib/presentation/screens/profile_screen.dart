import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/consts/apptypography.dart';
import 'package:doclink/core/providers/auth_provider.dart';
import 'package:doclink/core/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../data/data source/remote_date_source.dart';
import '../widgets/my_list_tile.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(remoteDataSourceProvider).value!;
    final authInfo = ref.watch(authenticationProvider)!;
    final mq = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final listOfSetting = [
      {
        'title': 'Change Language',
        'subtitle': 'Change to Arabic',
        'onTap': () {},
      },
      {},
    ];
    if (!authInfo.emailVerified) {
      listOfSetting.add({
        'title': 'Verify your email',
        'subtitle': 'Your email is not verified',
        'textColor': Colors.red,
        'onTap': () {},
      });
      listOfSetting.add(
        {},
      );
    }
    if (authInfo.phoneNumber == '') {
      listOfSetting.add(
        {
          'title': 'Add a phone number',
          'subtitle': 'For easier logging in and restoration of your account',
          'onTap': () {},
        },
      );
    }
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.3,
                    child: Lottie.asset(
                      'assets/lottie/security.json',
                      repeat: true,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: FittedBox(
                        child: Text(
                          'Your Privacy is Our Priority',
                          style: AppTypography.semiHeadlineSize(context),
                        ),
                      ),
                      subtitle: FittedBox(
                        child: Text(
                          'Your data is protected with us\nand never shared with any \nthird party',
                          style: AppTypography.bodySize(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Info about you',
              style: AppTypography.headlineSize(context),
            ),
            const SizedBox(height: 16),
            ListTile(
              tileColor: theme.colorScheme.primaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              title: Text(
                'Birthday',
                style: AppTypography.semiHeadlineSize(context),
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(userInfo.dateOfBirth),
                style: AppTypography.bodySize(context),
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              tileColor: theme.colorScheme.primaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              title: Text(
                'Appointments',
                style: AppTypography.semiHeadlineSize(context),
              ),
              subtitle: Text(
                'Number of current appointments: ${userInfo.appointments.length}',
                style: AppTypography.bodySize(context),
              ),
              onTap: () {
                ref
                    .read(routerHandlerProvider.notifier)
                    .enterNewScreenFromNavBar(1);
                ref
                    .read(routerHandlerProvider.notifier)
                    .convexBottomBarKey
                    .currentState!
                    .animateTo(1);
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Settings',
              style: AppTypography.headlineSize(context),
            ),
            const SizedBox(height: 16),
            SwitchListTile.adaptive(
              value: false,
              onChanged: (value) {},
              title: FittedBox(
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.scaleDown,
                child: Text(
                  'Change Mode',
                  style: AppTypography.semiHeadlineSize(context),
                ),
              ),
              subtitle: FittedBox(
                alignment: AlignmentDirectional.centerStart,
                fit: BoxFit.scaleDown,
                child: Text(
                  'Change to dark mode',
                  style: AppTypography.bodySize(context),
                ),
              ),
              tileColor: theme.colorScheme.primaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: listOfSetting.asMap().entries.map(
                (e) {
                  if ((e.key == 1 || e.key == 3) && e.value['title'] == null) {
                    return const SizedBox(
                      height: 8,
                    );
                  } else {
                    return MyListTile(
                      tilePlace: e.key == listOfSetting.length - 1 ||
                              listOfSetting.length == 2
                          ? ListTilePlace.last
                          : ListTilePlace.middle,
                      title: e.value['title'] as String,
                      subtitle: e.value['subtitle'] as String,
                      tileColor: theme.colorScheme.primaryContainer,
                      textColor: e.value['textColor'],
                    );
                  }
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
