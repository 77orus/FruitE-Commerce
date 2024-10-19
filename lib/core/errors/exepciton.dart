class CustomExepciton implements Exception {
  String message;
  CustomExepciton({required this.message});

  @override
  String toString() {
    return message;
  }
}
