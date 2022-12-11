class LoginModel {
  LoginModel({
    required this.refresh,
    required this.access,
  });
  late final String refresh;
  late final String access;

  LoginModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['refresh'] = refresh;
    _data['access'] = access;
    return _data;
  }
}
