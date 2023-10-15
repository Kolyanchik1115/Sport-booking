const String loginMutation = r'''
  mutation login($loginInput: LoginDto!) {
  login(loginInput: $loginInput) {
    user {
      id
      email
    }
  }
}
''';
