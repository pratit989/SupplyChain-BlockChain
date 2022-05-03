import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AdminBlockchainSupplyChainFirebaseUser {
  AdminBlockchainSupplyChainFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AdminBlockchainSupplyChainFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AdminBlockchainSupplyChainFirebaseUser>
    adminBlockchainSupplyChainFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AdminBlockchainSupplyChainFirebaseUser>((user) =>
            currentUser = AdminBlockchainSupplyChainFirebaseUser(user));
