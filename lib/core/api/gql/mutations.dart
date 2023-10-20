const String loginMutation = r'''
  mutation login($loginInput: LoginDto!) {
  login(loginInput: $loginInput) {
    user {
      id
      email
      fullname
      isActivated
      dateOfBirth
    }
    accessToken
    refreshToken
  }
}
''';

const String refreshTokenMutation = r'''
    mutation RefreshToken($refreshToken: String) {
      accessToken(refresh: $refreshToken)
    }
  ''';

const String updateProfileMutation = r'''
mutation UpdateProfile($profileInput: UpdateUserDto, $avatar: Upload) {
updateProfile(profileInput: $profileInput, avatar: $avatar) {
fullname
dateOfBirth
email
}
}
''';
