class RoomScheduleModel {
  String? waktuMulai;
  String? waktuSelesai;
  String? namaRuangan;

  RoomScheduleModel({this.waktuMulai, this.waktuSelesai, this.namaRuangan});

  factory RoomScheduleModel.fromJson(Map<String, dynamic> json) {
    return RoomScheduleModel(
      waktuMulai: json['waktu_mulai'] as String?,
      waktuSelesai: json['waktu_selesai'] as String?,
      namaRuangan: json['nama_ruangan'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['waktu_mulai'] = waktuMulai;
    data['waktu_selesai'] = waktuSelesai;
    data['nama_ruangan'] = namaRuangan;
    return data;
  }
}
