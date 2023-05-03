import 'package:flutter/material.dart';

import '../../../../core/consts/app_typography.dart';
import '../../../../domain/entities/doctor.dart';
import 'doc_info_icon_button.dart';

class DocInfoRow extends StatelessWidget {
  const DocInfoRow({
    super.key,
    required this.size,
    required this.colorScheme,
    required this.doctor,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.color,
  });
  final BoxConstraints size;
  final ColorScheme colorScheme;
  final Doctor doctor;
  final IconData icon;
  final String subTitle, title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DocInfoIconButton(
          icon: icon,
          color: color,
        ),
        SizedBox(
          width: size.maxWidth * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                subTitle,
                style: AppTypography.smallSize(
                  context,
                  colorScheme.outline,
                ),
              ),
              Text(
                title,
                style: AppTypography.semiBodySize(
                  context,
                  colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
