// ignore_for_file: file_names

class TransferTableDTO {
  TransferTableDTO({required this.currentCheckID, required this.targetCheckID});

  final int currentCheckID;
  final int targetCheckID;

  Map<String, dynamic> toJson() =>
      {'id1': currentCheckID, 'id2': targetCheckID};
}
