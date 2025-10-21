abstract class AuthDatasource {
  String? getUserId();
  Future<void> logout();
  Future<void> deleteAccount();
  Future<String?> getUserIdFromEmail(String email);
  Future<void> changePassword(String password);
}
