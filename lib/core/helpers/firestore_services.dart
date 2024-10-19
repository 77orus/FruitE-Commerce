import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruietecommerceapp/core/helpers/database_services.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    }
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String uid}) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfUserExists(
      {required String path, required String uid}) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.exists;
  }
}
