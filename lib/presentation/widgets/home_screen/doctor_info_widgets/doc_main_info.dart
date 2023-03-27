import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/consts/app_typography.dart';
import '../../../../domain/entities/doctor.dart';
import 'doc_info_row.dart';

class DocMainInfo extends StatelessWidget {
  const DocMainInfo({
    super.key,
    required this.doctor,
    required this.colorScheme,
  });

  final Doctor doctor;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: size.maxWidth * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: const Color(0xfff4f3ef),
                child: Hero(
                  tag: doctor.id,
                  child: CachedNetworkImage(
                    imageUrl: doctor.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: size.maxWidth * 0.1),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.maxHeight * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Dr. ${doctor.name}',
                      style: AppTypography.semiHeadlineSize(
                        context,
                        colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.05,
                  ),
                  Text(
                    '${doctor.speciality} doctor',
                    style: AppTypography.semiBodySize(
                      context,
                      colorScheme.outline,
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.05,
                  ),
                  Expanded(
                    child: DocInfoRow(
                      doctor: doctor,
                      size: size,
                      colorScheme: colorScheme,
                      icon: Icons.star,
                      title: '${doctor.rating} out of 5',
                      subTitle: 'Rating',
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.1,
                  ),
                  Expanded(
                    child: DocInfoRow(
                      doctor: doctor,
                      size: size,
                      colorScheme: colorScheme,
                      icon: Icons.groups_sharp,
                      title: doctor.reviews.length.toString(),
                      subTitle: 'Patients',
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
