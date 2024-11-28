import 'dart:convert';
import 'package:bizbooster/models/onboarding.dart';
import 'package:bizbooster/screens/Lead_Details_onboarding/model/restaurant_onboarding_model';
import 'package:bizbooster/screens/category_onboarding/model/OnboardingCategory.dart';
import 'package:bizbooster/screens/my_team_lead/components/service_card.dart';
import 'package:bizbooster/screens/onboarding_lifeline/onboarding_screens/components/model/servicecard.dart';
import 'package:http/http.dart' as http;
import 'package:bizbooster/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User? user;

  // Future<bool> login(String username, String password) async {
  //   try {
  //     String API_BASE_URL = "http://43.205.22.150:5000";
  //     final response = await http.post(
  //       Uri.parse("$API_BASE_URL/auth/login"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'email': username, // Assuming 'username' is actually the email
  //         'password': password,
  //         'expiresInMins': 30, // Optional parameter, if needed
  //       }),
  //     );

  //     final jsonResponse = jsonDecode(response.body);

  //     if (jsonResponse['msg'] == "1") {
  //       user =
  //           User.fromJson(jsonResponse); // Assuming `User` is a defined model
  //       String? accessToken = jsonResponse['accessToken'];
  //       print("User: $user");
  //       print("Response: $jsonResponse");

  //       // Additional handling for accessToken or other login-related processes
  //       return true; // Login successful
  //     } else if (jsonResponse['msg'] == "0") {
  //       print("Password incorrect");
  //       return false;
  //     } else {
  //       // Handle other unexpected response codes or messages
  //       print('Login failed with status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     return false;
  //   }
  // }
  Future<bool> login(String email, String password) async {
    const String API_BASE_URL = "http://43.205.22.150:5000";
    try {
      final response = await http.post(
        Uri.parse("$API_BASE_URL/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
      );
      print("hii$response");
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['msg'] == "1") {
          // Login successful
          String? token = jsonResponse['id'];
          String loginID = jsonResponse['loginID'];
// Store session data using shared_preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
          prefs.setString('token', token!); // Store additional data as needed
          prefs.setString('loginID', loginID);

          return true;
        } else {
          // Incorrect credentials
          return false;
        }
      } else {
        // Any status other than 200 means login failed
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false; // Login failed due to an error
    }
  }

  Future<bool> registerUser(
      String username, String password, String email, String mobileno) async {
    try {
      String API_BASE_URL = "http://43.205.22.150:5000/user/createUser";
      final response = await http.post(
        Uri.parse("$API_BASE_URL/users/add"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': username,
          'email': email,
          'mobileno': mobileno,
          'password': password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        // Handle the register response, e.g., store user info, show success message, etc.
        print("Registration successful: $jsonResponse");

        return true; // Return true if registration is successful
      } else {
        // Handle errors like invalid data
        print('Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  Future<bool> createAuth(
      String username, String password, String email, String loginID) async {
    try {
      String API_BASE_URL = "http://43.205.22.150:5000";
      final response = await http.post(
        Uri.parse("$API_BASE_URL/auth/createAuth"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': username,
          'email': email,
          'password': password,
          "loginID": loginID
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        // Handle the register response, e.g., store user info, show success message, etc.
        print(" Auth Registration successful: $jsonResponse");

        return true; // Return true if registration is successful
      } else {
        // Handle errors like invalid data
        print(
            'Auth Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  Future<bool> sellerOnboard(String name, String email, String mobileno,
      String bname, String btype, String baddress, String pincode) async {
    const String API_BASE_URL = "http://43.205.22.150:5000";
    try {
      final response = await http.post(
        Uri.parse("$API_BASE_URL/selleronboarding/createSeller"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "email": email,
          "mobileno": mobileno,
          "bname": bname,
          "btype": btype,
          "baddress": baddress,
          "pincode": pincode
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // if (jsonResponse['msg'] == "1") {
        //   // Login successful
        //   return true;
        // } else {
        //   // Incorrect credentials
        //   return false;
        // }

        return true;
      } else {
        // Any status other than 200 means login failed
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false; // Login failed due to an error
    }
  }

  Future<bool> merchantOnboard(String name, String email, String mobileno,
      String bname, String btype, String baddress, String pincode) async {
    const String API_BASE_URL = "http://43.205.22.150:5000";
    try {
      final response = await http.post(
        Uri.parse("$API_BASE_URL/merchantonboarding/createMerchant"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "email": email,
          "mobileno": mobileno,
          "bname": bname,
          "btype": btype,
          "baddress": baddress,
          "pincode": pincode
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // if (jsonResponse['msg'] == "1") {
        //   // Login successful
        //   return true;
        // } else {
        //   // Incorrect credentials
        //   return false;
        // }

        return true;
      } else {
        // Any status other than 200 means login failed
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false; // Login failed due to an error
    }
  }

// api for fetching onboarding module

  Future<List<Onboarding>> fetchOnboardingItem() async {
    const String apiUrl = 'http://43.205.22.150:5000/module/getAllModule';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Onboarding.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lifeline items');
    }
  }

  Future<List<OnboardingCategory>> fetchCategories(String id) async {
    final url = Uri.parse(
        "http://43.205.22.150:5000/category/getCategoriesByModule/$id");

    try {
      final response = await http.get(url);
      print(response);

      if (response.statusCode == 200) {
        // Parse the JSON data and map it to a list of OnboardingCategory objects
        final List<dynamic> jsonData = json.decode(response.body);
        print(jsonData);
        // Map each dynamic object to OnboardingCategory and return the list
        var data =
            jsonData.map((json) => OnboardingCategory.fromJson(json)).toList();

        return data;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<ServiceCardd>> fetchService(String id) async {
    final url = Uri.parse(
        "http://43.205.22.150:5000/service/getServicesByCategory/$id");
    print("fetchService  url : $url");
    try {
      print(id);
      final response = await http.get(url);
      print(response);

      if (response.statusCode == 200) {
        // Parse the JSON data and map it to a list of OnboardingCategory objects
        final List<dynamic> jsonData = json.decode(response.body);
        print(jsonData);
        // Map each dynamic object to OnboardingCategory and return the list
        var data = jsonData.map((json) => ServiceCardd.fromJson(json)).toList();

        return data;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<ServiceLeadProduct>> fetchServiceLeadProduct(String id) async {
    final url = Uri.parse(
        "http://43.205.22.150:5000/serviceleaddetails/getServiceleadByServices/$id");
    print("servivelead detail url : $url");

    try {
      print("hello");
      print(id);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData
            .map((json) => ServiceLeadProduct.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  // Future<List<ServiceLeadProduct>> fetchServiceLeadProduct() async {
  //   final response = await http.get(Uri.parse("http://43.205.22.150:5000/serviceleaddetails/getServiceleadByServices/672cb550b13e18f8e7c39a5a"));

  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse
  //         .map((data) => ServiceLeadProduct.fromJson(data))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<User?> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('loginID');
    const String baseUrl = 'http://43.205.22.150:5000';
    final url = Uri.parse('$baseUrl/user/getSingleUser/$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        print('Failed to load user. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}
