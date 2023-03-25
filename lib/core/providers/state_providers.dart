import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeSearchTextField = StateProvider((ref) => '');

final specialtiesSearchTextField = StateProvider((ref) => '');

final specialtiesSearchResults = StateProvider((ref) => medicalSpecialties);

final doctorSearchResults = StateProvider((ref) => <Doctor>[]);
