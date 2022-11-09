import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/note.dart';

abstract class NoteService {
  Future<Note> getNoteByCheckID(String checkID);
  Future<http.Response> updateNoteByCheckID(String checkID, Note note);
}
