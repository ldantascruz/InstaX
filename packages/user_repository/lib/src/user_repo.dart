import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<void> signIn({required String email, required String password});
  Future<void> logOut();
  Future<MyUser> signUp({required MyUser myUser, required String password});
  Future<void> resetPassword({required String email});
  Future<void> setUserData({required MyUser myUser});
  Future<MyUser> getMyUser({required String myUserId});
}
