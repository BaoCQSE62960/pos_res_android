class Note {
  Note({required this.note});

  final String note;

  // ignore: non_constant_identifier_names
  static Note EMPTY = Note(note: '');

  factory Note.fromJson(Map<String, dynamic> json) => Note(note: json['note']);

  Map<String, dynamic> toJson() => {'note': note};
}
