// ignore_for_file: file_names

class SpecialRequestDTO {
  SpecialRequestDTO({required this.specialrequestid});

  final int specialrequestid;

  Map<String, dynamic> toJson() => {'specialrequestid': specialrequestid};
}
