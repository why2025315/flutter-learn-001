import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../data/classes/activity.dart';

class ActivityModel {
  Future<Activity> getActivity() async {
    final response = await http.get(
      Uri.parse('https://www.boredapi.com/api/activity'),
    );
    if (response.statusCode == 200) {
      return Activity.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }
}
