const String getProfileQuery = r'''
  query GetProfile {
    getProfile {
      id
      fullname
      email
      dateOfBirth
      isActivated
    }
  }
''';
