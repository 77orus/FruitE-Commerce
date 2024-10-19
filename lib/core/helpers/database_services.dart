abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData(
      {required String path, required String uid});

  Future<bool> checkIfUserExists({required String path, required String uid});
}
