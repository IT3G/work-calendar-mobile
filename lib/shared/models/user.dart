class User {
  final String birthday;
  final String email;
  final String position;
  final String mattermost;
  final String location;
  final String username;
  final String id;
  final String mailNickname;
  final String subdivision;
  final String skype;
  final String telegram;

  User(
      {required this.id,
      required this.username,
      required this.birthday,
      required this.email,
      required this.location,
      required this.mattermost,
      required this.position,
      required this.mailNickname,
      required this.subdivision,
      this.skype = '',
      this.telegram = ''});
}
