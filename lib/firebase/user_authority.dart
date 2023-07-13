import 'package:automotiveapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserAuthorization{
  FirebaseAuth  firebaseAuth=FirebaseAuth.instance;
  Future<bool> signInUser(UserModel userModel)async{
      try{
        firebaseAuth.signInWithEmailAndPassword(email: userModel.userEmail, password: userModel.userPassword);
        return true;
      } catch(e){
        print(e.toString());
        return false;
      }
  }

  Future<bool> signUpUser(UserModel user)async{
    try{
      firebaseAuth.createUserWithEmailAndPassword(email: user.userEmail, password: user.userPassword);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

  Future<void> signOutUser()async{
    try{
        await firebaseAuth.signOut();
    }catch(e){
      print(e);
    }
  }
}