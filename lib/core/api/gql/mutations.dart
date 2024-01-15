const String loginMutation = r'''
  mutation login($loginInput: LoginDto!) {
  login(loginInput: $loginInput) {
    user {
      id
      email
      fullname
      dateOfBirth
      isActivated
      avatar
    }
    accessToken
    refreshToken
  }
}
''';
const String registrationMutation = r'''
mutation register($registerInput: RegisterDto!) {
  register(registerInput: $registerInput) {
    user {
      id
      email
      fullname
      avatar
      dateOfBirth
    }
    accessToken
    refreshToken
  }
}
''';

const String refreshTokenMutation = r'''
mutation RefreshToken($refresh: String) {
  accessToken(refresh: $refresh)
}
''';

const String updateProfileMutation = r'''
mutation UpdateProfile($profileInput: UpdateUserDto, $avatar: Upload) { updateProfile(profileInput: $profileInput, avatar: $avatar)
 { fullname dateOfBirth avatar } }''';


