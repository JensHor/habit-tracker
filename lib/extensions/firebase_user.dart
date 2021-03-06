import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:habit_tracker/models/id.dart';
import 'package:habit_tracker/models/user.dart';

extension FirebaseUserParsing on fb.User {
  User toUserModel() {
    fb.User user = this;
    return User(
      id: Id(
        user.uid,
      ),
      email: user.email,
    );
  }
}
