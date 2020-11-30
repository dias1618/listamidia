class RepositoryDto {
  String statusMessage;
  Object data;

  RepositoryDto({this.statusMessage, this.data});

  RepositoryDto.fromJson(Map<String, dynamic> json) {
    statusMessage = json['statusMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusMessage'] = this.statusMessage;
    data['data'] = this.data;
    return data;
  }
}