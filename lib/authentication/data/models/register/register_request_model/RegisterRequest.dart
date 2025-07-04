class RegisterRequest {
  RegisterRequest({
      this.name, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.phone, 
      this.avaterId,});

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phone = json['phone'];
    avaterId = json['avaterId'];
  }
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  num? avaterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    return map;
  }

}