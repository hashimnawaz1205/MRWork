import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/topRecomendations.dart';

class TopRecommendationsService {
  Future<List<TopRecommendations>> getAllTopRecommendations() async {
    const url = 'https://mrworker.pk/API/search.php';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final rsbody = jsonDecode(response.body);
      final json = rsbody['service_search'] as List;
      // print(json.toString() + ' Coming from todo services.');
      final topRecommendations = json.map((e) {
        return TopRecommendations(
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
            timestamp: e['timestamp']);
      }).toList();
      return topRecommendations;
    }
    return [];
    // throw "Something went wrong";
  }
}
