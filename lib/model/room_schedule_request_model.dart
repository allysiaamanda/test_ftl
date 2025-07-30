class RoomScheduleReqModel {
  final String divisiId;
  final String roomId;
  final String tanggalMeeting; 
  final String waktuMulai;     
  final String waktuSelesai;   
  final int jumlahPeserta;

  RoomScheduleReqModel({
    required this.divisiId,
    required this.roomId,
    required this.tanggalMeeting,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.jumlahPeserta,
  });

  Map<String, dynamic> toJson() {
    return {
      'divisi_id': divisiId,
      'room_id': roomId,
      'tanggal_meeting': tanggalMeeting,
      'waktu_mulai': waktuMulai,
      'waktu_selesai': waktuSelesai,
      'jumlah_peserta': jumlahPeserta,
    };
  }
}
