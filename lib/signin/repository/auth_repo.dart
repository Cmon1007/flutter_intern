import 'dart:convert';
import 'package:e_commerce/signin/model/user_auth_model.dart';
import 'package:http/http.dart' as http;
class AuthenticationRepo
{
  static const String apiUrl="https://dummyjson.com/auth/login";
  static const String userDetailsUrl="https://dummyjson.com/users";
  static Future<UserAuthModel> loginInfo(String username,String password)
  async {
    print(username);
    print(password);
        try
            {
              http.Response response=await http.post(Uri.parse(apiUrl),
              headers: {
                'content-type': 'application/json'
              },
              body: json.encode({
                'username':username,
                'password':password,
              }));

              if(response.statusCode==200)
                {
                  Map<String,dynamic> responseData=jsonDecode(response.body);
                  UserAuthModel userDetail=UserAuthModel.fromJson(responseData);
                  print("Token :${userDetail.token}");
                return userDetail;
                }
              else
                {
                  throw Exception(response.reasonPhrase);
                }
            }
            catch(e)
    {
      throw Exception(e.toString());
    }
  }

  static Future<UserAuthModel> getUserDetails(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse(userDetailsUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        UserAuthModel userDetail = UserAuthModel.fromJson(responseData);
        return userDetail;
      } else {
        throw Exception("Failed to fetch user details");
      }
    } catch (e) {
      throw Exception("Failed to fetch user details: $e");
    }
  }
}