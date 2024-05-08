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
const String getAllBookingQuery = r''' query FindOneFacility($id: Int!) {
facility(id: $id) {
    timeSlots{
        id
        dayOfWeek
        startTime
        endTime
        price
        status
        }
      }
    }
''';

const String getAllFacilityQuery =
    r''' query FindAllFacilities($facilitiesFilterInput: FacilitiesFilterInput, $paginationArgs: PaginationArgs) {
  findAll(facilitiesFilterInput: $facilitiesFilterInput, paginationArgs: $paginationArgs) {
      facilities {
        id
        name
        address
        sportType
        district {
             city {
                 id
                 name
             }
            id
            name
        }
        location
        coveringType
        facilityType
        description
        minBookingTime
        currentUserIsFavorite
        images {
            image
        }
        avgPrice 
      }
  }
}
''';
const getAllUserFavoriteQuery = r'''query GetUserFavorites($paginationArgs: PaginationArgs) {
  getUserFavorites(paginationArgs: $paginationArgs) {
       facilities {
        id
        name
        address
        sportType
        district {
             city {
                 id
                 name
             }
            id
            name
        }
        location
        coveringType
        facilityType
        description
        minBookingTime
        currentUserIsFavorite
        images {
            image
        }
        avgPrice 
      }
  }
}''';
