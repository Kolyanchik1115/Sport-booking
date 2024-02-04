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
        district
        coveringType
        facilityType
        description
        minBookingTime
        images {
            image
        } 
      }
  }
}
''';
