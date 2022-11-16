// ignore_for_file: file_names

class TransferTableDTO {
  TransferTableDTO({required this.locationID});

  final int locationID;

  Map<String, dynamic> toJson() => {'locationid': locationID};
}
