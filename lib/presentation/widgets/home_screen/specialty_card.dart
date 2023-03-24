import 'package:doclink/core/consts/app_typography.dart';
import 'package:flutter/material.dart';

class SpecialityCard extends StatelessWidget {
  const SpecialityCard(
      {Key? key, required this.specialty, required this.colorIndex})
      : super(key: key);
  final Specialty specialty;
  final int colorIndex;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Align(
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.primaries[colorIndex % 18],
                  colorScheme.background,
                ],
                stops: const [0.4, 1],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 9,
                  child: FittedBox(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        colorScheme.onBackground,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        specialty.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      specialty.simpleName,
                      style: AppTypography.bodySize(
                        context,
                        colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Specialty {
  final String name, simpleName, imagePath;
  const Specialty(this.name, this.simpleName, this.imagePath);
}
