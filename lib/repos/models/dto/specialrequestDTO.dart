class SpecialRequestDTO {
  SpecialRequestDTO({required this.specialrequestid});

  final int specialrequestid;

  Map<String, dynamic> toJson() => {'specialrequestid': specialrequestid};
}
