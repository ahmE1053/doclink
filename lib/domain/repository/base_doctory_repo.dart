abstract class BaseDoctorRepository {
  Future<List> getDoctorsList();

  Future<void> addRatingToDoctor();
}
