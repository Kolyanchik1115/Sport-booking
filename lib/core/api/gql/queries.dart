const String getProfileQuery = r'''
  query GetProfile {
    getProfile {
      id
      fullname
      email
      dateOfBirth
      avatar
      isActivated
    }
  }
''';
