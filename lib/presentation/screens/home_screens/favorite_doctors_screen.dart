import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:doclink/data/data%20source/patient_remote_date_source.dart';
import 'package:doclink/presentation/widgets/home_screen/normal_doctor_card.dart';
import 'package:doclink/presentation/widgets/home_screen/not_found.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/consts/images.dart';

class FavoriteDoctorsScreen extends HookConsumerWidget {
  const FavoriteDoctorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKey = useMemoized(() => GlobalKey<AnimatedListState>());
    final patient = ref.watch(patientRemoteDataSourceProvider).value!;
    final favoriteDoctorsList = patient.favoriteDoctors;
    final doctors = ref
        .read(doctorsNotifierProvider.notifier)
        .getFavoriteDoctors(favoriteDoctorsList);
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Doctors'),
        actions: [
          IconButton(
              onPressed: () async {
                var list = (await FirebaseFirestore.instance
                        .collection('doctors')
                        .get())
                    .docs;

                for (int i = 0; i < list.length; i++) {
                  if (list[i].data()['name'] == 'Esraa Saber') {
                    await FirebaseFirestore.instance
                        .collection('doctors')
                        .doc('${list[i].data()['id']}')
                        .update(
                      {
                        'imageUrl':
                            'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/10.out.png?alt=media&token=d7a10b88-e1c9-4a3a-a321-b807c342e374',
                      },
                    );
                  }
                  // await FirebaseFirestore.instance
                  //     .collection('doctors')
                  //     .doc('${list[i].data()['id']}')
                  //     .update(
                  //   {
                  //     'imageUrl': doctors123456789[i % doctors123456789.length],
                  //   },
                  // );
                }
              },
              icon: const Icon(Icons.h_mobiledata))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: favoriteDoctorsList.isEmpty
            ? NotFound(
                mq: mq,
                text: 'No favorites yet.',
              )
            : AnimatedList(
                key: listKey,
                initialItemCount: favoriteDoctorsList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index, animation) {
                  return NormalDoctorCard(
                    doctor: doctors[index],
                    isFav: true,
                    colorScheme: Theme.of(context).colorScheme,
                    lastItem: favoriteDoctorsList.length == 1,
                    screenRef: favoriteDoctorsList.length == 1 ? ref : null,
                    additionalFunction: () {
                      listKey.currentState!.removeItem(
                        duration: const Duration(milliseconds: 500),
                        index,
                        (context, animation) => SizeTransition(
                          sizeFactor: animation,
                          axis: Axis.vertical,
                          child: NormalDoctorCard(
                            doctor: doctors[index],
                            isFav: false,
                            colorScheme: Theme.of(context).colorScheme,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
