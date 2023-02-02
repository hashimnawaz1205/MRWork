import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mrworker/AppState/models/searchModel.dart';
import '../models/popularCategories.dart';

class SearchService {
  Future<List<SearchModel>> getSearch(String city, String curl) async {
    final url = 'https://mrworker.pk/API/search?city=$city&type_tag=$curl';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final rsbody = jsonDecode(response.body);
      final json = rsbody['service_search'] as List;
      // print(json.toString() + ' Coming from todo services.');
      final searchModel = json.map((e) {
        return SearchModel(
          id: e['id'],
          sort_id: e['sort_id'],
          city: e['city'],
          phone: e['phone'],
          email: e['email'],
          area: e['area'],
          name: e['name'],
          speciality: e['speciality'],
          about: e['about'],
          whatsapp: e['whatsapp'],
          fb_link: e['fb_link'],
          image: e['image'],
          tags: e['tags'],
          verification_status: e['verification_status'],
          timestamp: e['timestamp'],
        );
      }).toList();
      return searchModel;
    }
    return [];
    // throw "Something went wrong";
  }
}
