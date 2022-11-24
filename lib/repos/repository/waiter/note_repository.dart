import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/repos/models/waiter/note.dart';
import 'package:pos_res_android/repos/services/waiter/note_service.dart';

class NoteRepositoryImpl extends NoteService {
  String uriConnect = uri;
  final LocalStorage storage = LocalStorage('cookie');
  Map<String, String> headers = {"content-type": "application/json"};

  @override
  Future<Note> getNoteByCheckID(String checkID) async {
    headers = storage.getItem('headers');
    http.Response response = await http.get(
        Uri.parse(uriConnect + "/order/check/" + checkID + "/note/"),
        headers: headers);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Note.fromJson(responseJson);
    } else {
      throw Exception('Failed to load table info');
    }
  }

  @override
  Future<http.Response> updateNoteByCheckID(String checkID, Note note) async {
    headers = storage.getItem('headers');
    var body = json.encode(note.toJson());
    http.Response response = await http.put(
        Uri.parse(uriConnect + "/order/check/" + checkID + "/note/"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update table info');
    }
  }
}
