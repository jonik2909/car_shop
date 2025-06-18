import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchCars() async {
  try {
    final url = Uri.parse('http://localhost:3004/car/all'); // string =-> URL

    final response = await http.get(url);

    print("statusCode: ${response.statusCode}");
    print("body ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
    } else {
      throw json.decode(response.body)['message'];
    }
  } catch (err) {
    print("ERROR: $err");
    // show error (UI)
  }
}

void main() {
  fetchCars();
}
