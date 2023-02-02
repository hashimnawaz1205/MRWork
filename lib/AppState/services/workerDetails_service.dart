import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrworker/AppState/models/workerDetails.dart';

class WorkerDetailsService {
  Future<List<WorkerDetails>> getWorkerDetails(String user_id) async {
    final url = 'https://mrworker.pk/API/user_detail?user_id=$user_id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final rsbody = jsonDecode(response.body);
      final json = rsbody['user_detail'] as List;
      // print(json.toString() + ' Coming from todo services.');
      final workerDetails = json.map((e) {
        return WorkerDetails(
          id: e['id'],
          sort_id: e['sort_id'],
          name: e['name'],
          email: e['email'],
          image: e['image'],
          phone: e['phone'],
          city: e['city'],
          area: e['area'],
          about: e['about'],
          speciality: e['speciality'],
          tags: e['tags'],
          verification_status: e['verification_status'],
          whatsapp: e['whatsapp'],
          fb_link: e['fb_link'],
          timestamp: e['timestamp'],
        );
      }).toList();
      return workerDetails;
    }
    return [];
    // throw "Something went wrong";
  }
}
