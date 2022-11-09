class OpenTableDTO {
  OpenTableDTO(
      {required this.checkid, required this.tableid, required this.locationid});

  final int checkid;
  final int tableid;
  final int locationid;

  factory OpenTableDTO.fromJson(Map<String, dynamic> json) => OpenTableDTO(
      checkid: json['checkid'],
      tableid: json['tableid'],
      locationid: json['locationid']);

  Map<String, dynamic> toJson() =>
      {'checkid': checkid, 'tableid': tableid, 'locationid': locationid};
}
