class VoidReasonDTO {
  VoidReasonDTO({required this.voidid});

  final int voidid;

  Map<String, dynamic> toJson() => {'voidid': voidid};
}
