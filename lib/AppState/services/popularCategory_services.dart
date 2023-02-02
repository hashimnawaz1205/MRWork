import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/popularCategories.dart';

class PopularCategoriesService {
  Future<List<PopularCategories>> getAllPopularCategories() async {
    const url = 'https://mrworker.pk/API/popular';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final rsbody = jsonDecode(response.body);
      final json = rsbody['popular'] as List;
      // print(json.toString() + ' Coming from todo services.');
      final popularCategories = json.map((e) {
        return PopularCategories(
          id: e['id'],
          sort_id: e['sort_id'],
          name: e['name'],
          color: e['color'],
          title: e['title'],
          icon: e['icon'],
          timestamp: e['timestamp'],
        );
      }).toList();
      return popularCategories;
    }
    return [];
    // throw "Something went wrong";
  }
}
