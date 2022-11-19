// ignore_for_file: file_names

class SplitCheckDTO {
  SplitCheckDTO(
      {required this.currentCheckID,
      required this.targetTableID,
      required this.percent});

  final int currentCheckID;
  final int targetTableID;
  final int percent;

  Map<String, dynamic> toJson() =>
      {'id1': currentCheckID, 'id2': targetTableID, 'percent': percent};
}
