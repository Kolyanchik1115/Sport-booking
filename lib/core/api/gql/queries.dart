const String getProfileQuery = r'''
  query GetProfile {
    getProfile {
      fullname
      email
      dateOfBirth
      isActivated
    }
  }
''';
