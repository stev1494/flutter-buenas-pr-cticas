import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountApi {
  String _url = "reqres.in";

  login(String email, String password) async {
    try {
      final response = await http.post(Uri.https(_url, 'api/login'), 
      body: jsonEncode({
        "email": email,
        "password": password,
        "age": 25
      }),
      headers: {
        'Content-Type': 'application/json'
      });

      if( response.statusCode == 200){
        final dynamic parsed = jsonDecode(response.body);
        print("TOKEN: ${parsed["token"]}");
        return true;
      } else {
        return false;
      }
    } catch(e){
      print(e);
      return false;
    }
  }

  Future<List<dynamic>> getUsers() async {
    try {
      final http.Response response = await http.get(Uri.https(_url, 'api/users?page=2'));
      
      if(response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print(parsed['data']);
        print(response.body);
        return parsed['data'];
      }
      print("error ${response.statusCode}");
      return [];

    } catch(e) {
      print(e);
      return [];
    }
  }
}