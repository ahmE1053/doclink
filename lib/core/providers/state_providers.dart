import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeSearchTextField = StateProvider((ref) => '');

final specialtiesSearchTextField = StateProvider((ref) => '');

final specialtiesSearchResults = StateProvider((ref) => medicalSpecialties);
