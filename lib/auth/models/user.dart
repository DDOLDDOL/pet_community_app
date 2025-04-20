class User {
  const User(this.id, this.email, this.oauthProvider, this.name);

  final int id;
  final String email;
  final String? oauthProvider;
  final String name;

  // todo
  // final String phone;
}