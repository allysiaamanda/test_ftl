class RoomModel {
  String? id;
  String? roomName;

  RoomModel({this.id, this.roomName});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roomName'] = roomName;
    return data;
  }
}
