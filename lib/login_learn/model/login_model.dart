class LoginModel {
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
