class Note {
  Note({required this.note});

  final String note;

  static Note EMPTY = Note(note: '');

  factory Note.fromJson(Map<String, dynamic> json) => Note(note: json['note']);

  Map<String, dynamic> toJson() => {'note': note};
}
