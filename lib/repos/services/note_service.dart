import 'package:pos_res_android/repos/models/item.dart';
import 'package:pos_res_android/repos/models/note.dart';
import 'package:http/http.dart' as http;

abstract class NoteService {
  Future<Note> getNoteByCheckID(String checkID);
  Future<http.Response> updateNoteByCheckID(String checkID, Note note);
}
