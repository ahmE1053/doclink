import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/data source/patient_remote_date_source.dart';
import '../../../../domain/entities/doctor.dart';
import 'doc_info_icon_button.dart';

class DocInfoAppBar extends StatelessWidget {
  const DocInfoAppBar({
    super.key,
    required this.doctor,
    required this.colorScheme,
  });

  final Doctor doctor;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DocInfoIconButton(
          onTap: () {},
          color: colorScheme.outline,
          icon: Icons.arrow_back,
        ),
        Consumer(
          builder: (context, ref, child) {
            final isFav = ref
                .watch(patientRemoteDataSourceProvider)
                .value!
                .favoriteDoctors
                .contains(
                  doctor.id,
                );
            return DocInfoIconButton(
              color: colorScheme.outline,
              onTap: () {
                ref
                    .read(
                      patientRemoteDataSourceProvider.notifier,
                    )
                    .handleFavorite(
                      doctor.id,
                    );
              },
              icon: isFav ? Icons.favorite : Icons.favorite_border,
            );
          },
        ),
      ],
    );
  }
}
