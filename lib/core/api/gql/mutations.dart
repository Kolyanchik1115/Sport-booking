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

const createBookingMutation = r''' 
mutation CreateBooking($createBookingInput: CreateBookingInput!) {
  createBooking(createBookingInput: $createBookingInput) {
    id
    userId
    status
    price
  }
}''';

const addFavoriteMutation = r''' 
mutation AddFavorite($facilityId: Int!) {
  addFavorite(facilityId: $facilityId)
}
''';
const removeFavoriteMutation = r''' 
mutation RemoveFavorite($facilityId: Int!) {
  removeFavorite(facilityId: $facilityId)
}
''';

const googleLoginMutation = r'''
mutation GoogleAuth($token: String!) {
  googleAuth(token: $token) {
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
