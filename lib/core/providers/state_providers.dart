import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/*
* these are some state providers that holds the state of the some text fields, search results, etc.
* their function is to hold the state when the user navigates between the main sections of the app
* */

final homeSearchTextField = StateProvider((ref) => '');

final specialtiesSearchTextField = StateProvider((ref) => '');

final specialtiesSearchResults = StateProvider((ref) => medicalSpecialties);

final doctorSearchResults = StateProvider((ref) => <Doctor>[]);
