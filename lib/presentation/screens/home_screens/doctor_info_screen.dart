import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoctorInfoScreen extends HookConsumerWidget {
  const DoctorInfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(doctorsNotifierProvider).when(
            data: (data) {
              final doctorInfo = data.where((doctor) => doctor.id == id).single;
              final mq = MediaQuery.of(context).size;
              final scrollController = useScrollController();
              final index = useState(0);
              useEffect(() {
                scrollController.addListener(
                  () {
                    final scrollIndex = (scrollController.offset / 100).floor();
                    index.value = scrollIndex;
                  },
                );
              }, [
                scrollController,
              ]);
              return Column(
                children: [
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'About Dr. ${doctorInfo.name}',
                                style: AppTypography.semiHeadlineSize(context),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 10,
                                maxHeight: mq.height * 0.2,
                              ),
                              child: SingleChildScrollView(
                                child: Text(
                                  doctorInfo.aboutDoctor,
                                  style: AppTypography.semiBodySize(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text('An error occurred, please try again later'),
            ),
            loading: () => Center(
              child: SpinKitFadingGrid(),
            ),
          ),
    );
  }
}
