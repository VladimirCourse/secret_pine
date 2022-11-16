abstract class PineRepository {
  String get userName;

  Future<void> start();

  Future<void> stop();

  Future<void> close();
}
