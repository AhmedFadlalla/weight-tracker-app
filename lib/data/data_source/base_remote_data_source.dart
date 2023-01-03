import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/core/utils/constrant.dart';
import 'package:weight_tracker/data/models/user_model.dart';

import '../models/weight_model.dart';

abstract class BaseRemoteDataSource {
  Future<String> signInAnonymously(UserParameter parameter);
  Future<void>  signOut(NoParameters parameters);
  Future<void> createUser(String name, String uId);

  Future<UserModel> getUserData(String uId);

  Future<void> sendWeightData(WeightParameter parameter);

  Stream<List<WeightModel>>? getWeightsData();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<String> signInAnonymously(UserParameter parameter) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      createUser(parameter.name, userCredential.user!.uid);
      print(userCredential.user!.uid);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      rethrow;
    }
  }

  @override
  Future<void> createUser(String name, String uId) async {
    UserModel model = UserModel(name: name, uId: uId);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      debugPrint("User Created Successfully");
    }).catchError((error) {
      print("error");
    });
  }

  @override
  Future<UserModel> getUserData(String uId) async {
    try {
      var data =
          await FirebaseFirestore.instance.collection("users").doc(uId).get();
      print(data.data());
      return UserModel.fromJson(data.data()!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      rethrow;
    }
  }

  @override
  Future<void> sendWeightData(WeightParameter parameter) async {
    try {
      WeightModel model =
          WeightModel(weight: parameter.weight, dateTime: parameter.dateTime);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uId)
          .collection("weights")
          .add(model.toMap());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      rethrow;
    }
  }

  @override
  Stream<List<WeightModel>>? getWeightsData() {
   return  FirebaseFirestore.instance.collection("users")
       .doc(uId).collection("weights").orderBy("dateTime").snapshots().map((event) {
      return event.docs.map((e) {
        return WeightModel.fromJson(e.data());
      }).toList();
   });
  }

  @override
  Future<void> signOut(NoParameters parameters) async{

    try{
      await FirebaseAuth.instance.signOut();
    }on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      rethrow;
    }
  }


}
