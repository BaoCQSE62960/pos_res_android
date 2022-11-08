import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/note.dart';
import 'package:pos_res_android/repos/services/note_service.dart';

class NoteRepositoryImpl extends NoteService {
  @override
  Future<Note> getNoteByCheckID(String checkID) async {
    http.Response response = await http.get(
        Uri.parse("http://10.0.2.2:5000/order/check/" + checkID + "/note/"));
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Note.fromJson(responseJson);
    } else {
      throw Exception('Failed to load table info');
    }
  }

  @override
  Future<http.Response> updateNoteByCheckID(String checkID, Note note) async {
    var body = json.encode(note.toJson());
    http.Response response = await http.put(
        Uri.parse("http://10.0.2.2:5000/order/check/" + checkID + "/note/"),
        headers: {
          "Content-Type": "application/json",
          "Cookie":
              "connect.sid=s%3AE5t9At-wFmzDNzbWXPNP_FoiLyBUDzpq.%2BNzso8HEoUfQwDVp4viwieuBtEdKQCb3slkJdu8pqow"
        },
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update table info');
    }
  }
}
