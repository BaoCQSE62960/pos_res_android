// ignore_for_file: file_names

class OpenTableDTO {
  OpenTableDTO({required this.checkid});

  final int checkid;

  factory OpenTableDTO.fromJson(Map<String, dynamic> json) =>
      OpenTableDTO(checkid: json['checkid']);

  Map<String, dynamic> toJson() => {'checkid': checkid};
}
