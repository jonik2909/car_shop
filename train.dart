// ignore_for_file: avoid_print, prefer_const_constructors

// async // await

Future<Map<String, dynamic>> fetchUserData(String name) async {
  await Future.delayed(Duration(seconds: 3));

  throw Exception("FAILED!");

  return {'name': name, 'age': 25};
}

// then/catchError & async/await
void main() async {
  try {
    print("Starting request to backend...");
    final johnData = await fetchUserData("John");
    print("result-1: ${johnData['name']}");

    final davidData = await fetchUserData("David");
    print("result-2: ${davidData['name']}");

    final justinData = await fetchUserData("Justin");
    print("result-2: ${justinData['name']}");
  } catch (err) {
    print("ERROR: $err");
  }
}
