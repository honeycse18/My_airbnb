// import 'fake_models/bid_category_model.dart';

import 'package:airbnb_app/models/fakeModel/home_content_model.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';

class FakeData {
  // Intro screens
  static List<HomeContent> homeContents = [
    HomeContent(
        localSVGImageLocation: 'assets/images/house.png', content: 'House'),
    HomeContent(
        localSVGImageLocation: 'assets/images/flat.png', content: 'Flat'),
    HomeContent(
        localSVGImageLocation: 'assets/images/guestHouse.png',
        content: 'Guest House'),
    HomeContent(
        localSVGImageLocation: 'assets/images/hotel.png', content: 'Hotel'),
  ];

  static List<HomeContent> bestCity = [
    HomeContent(
        localSVGImageLocation: 'assets/images/Makks.png', content: 'Makka'),
    HomeContent(
        localSVGImageLocation: 'assets/images/Riyadh.png', content: 'Riyadh'),
    HomeContent(
        localSVGImageLocation: 'assets/images/Tubuk.png', content: 'Tubuk'),
  ];

  static List<HomeContent> destination = [
    HomeContent(
        localSVGImageLocation: 'assets/images/world.png',
        content: 'Next destination'),
    HomeContent(
        localSVGImageLocation: 'assets/images/sun.png',
        content: 'Next destination'),
    HomeContent(
        localSVGImageLocation: 'assets/images/plane.png',
        content: 'Next destination'),
  ];

  static var verficationOptionList = <OptionModel>[
    OptionModel(value: 'driving_license', viewAbleName: 'Driving License'),
    OptionModel(value: 'passport', viewAbleName: 'Passport'),
    OptionModel(value: 'id_card', viewAbleName: 'Identity Card'),
  ];

  static var GuestPlaceTypeList = <GuestPlaceOptionModel>[
    GuestPlaceOptionModel(
        localSVGImageLocation: 'assets/icons/line/house.svg',
        value: 'an_entire_place',
        viewAbleName: 'An entire place',
        des: 'Guests have the whole place to themselves.'),
    GuestPlaceOptionModel(
        localSVGImageLocation: 'assets/icons/line/room.svg',
        value: 'a_room',
        viewAbleName: 'A room',
        des:
            'Guests have their own room in a home, plus access to shared spaces.'),
    GuestPlaceOptionModel(
        localSVGImageLocation: 'assets/icons/line/shared_room.svg',
        value: 'a_shared_room',
        viewAbleName: 'A shared room',
        des:
            'Guests sleep in a room or common area that may be shared with you or others.'),
  ];
  static var FirstReservationTypeList = <FirstReservationOptionModel>[
    FirstReservationOptionModel(
        value: 'airbnb_guests',
        viewAbleName: 'Any Airbnb guest',
        des:
            'get reservations faster when you welcome anyone from the airbnb community '),
    FirstReservationOptionModel(
        value: 'experienced_guest',
        viewAbleName: 'An experienced gust',
        des:
            'for your first guest, welcome someone with a good track record on airbnb who can offer tips for how to be a great host,'),
  ];
  static var DecideReservationTypeList = <GuestPlaceOptionModel>[
    GuestPlaceOptionModel(
        value: 'use_instant_book',
        viewAbleName: 'Use instant book',
        localSVGImageLocation: 'assets/icons/line/instant.svg',
        des: 'Guests can book automatically.'),
    GuestPlaceOptionModel(
        value: 'approve_or_decline_requests',
        viewAbleName: 'Approve or decline requests',
        localSVGImageLocation: 'assets/icons/line/msg.svg',
        des: 'Guests must ask if they can book.'),
  ];

  static var BestPlaceTypeList = <BestPlaceOptionModel>[
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/house.svg',
      value: 'house',
      viewAbleName: 'House',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/apartment.svg',
      value: 'apartment',
      viewAbleName: 'Apartment',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/barn.svg',
      value: 'barn',
      viewAbleName: 'Barn',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/bed_breakfast.svg',
      value: 'bed_breakfast',
      viewAbleName: 'Bed & breakfast',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/boat.svg',
      value: 'boat',
      viewAbleName: 'Boat',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/cabin.svg',
      value: 'cabin',
      viewAbleName: 'Cabin',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/camper.svg',
      value: 'camper',
      viewAbleName: 'Camper/RV',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/case.svg',
      value: 'case_particular',
      viewAbleName: 'Case particular',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/castle.svg',
      value: 'castle',
      viewAbleName: 'Castle',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/cave.svg',
      value: 'cave',
      viewAbleName: 'Cave',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/container.svg',
      value: 'container',
      viewAbleName: 'Container',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/cyclic_home.svg',
      value: 'cycladic_home',
      viewAbleName: 'Cycladic Home',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/dammuso.svg',
      value: 'dammuso',
      viewAbleName: 'Dammuso',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/dome.svg',
      value: 'dome',
      viewAbleName: 'Dome',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/earth_home.svg',
      value: 'earth_home',
      viewAbleName: 'Earth home',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/farm.svg',
      value: 'farm',
      viewAbleName: 'Farm',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/guesthouse.svg',
      value: 'guesthouse',
      viewAbleName: 'Guesthouse',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/hotel.svg',
      value: 'hotel',
      viewAbleName: 'Hotel',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/ride.svg',
      value: 'ride',
      viewAbleName: 'Ride',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/ryokan.svg',
      value: 'ryokan',
      viewAbleName: 'Ryokan',
    ),
  ];

  static var GuestPlaceOfferList1 = <BestPlaceOptionModel>[
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/wifi_icon.svg',
      value: 'wifi',
      viewAbleName: 'Wifi',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/tv.svg',
      value: 'tv',
      viewAbleName: 'TV',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/kitchen.svg',
      value: 'kitchen',
      viewAbleName: 'Kitchen',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/washer.svg',
      value: 'washer',
      viewAbleName: 'Washer',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/parking.svg',
      value: 'parking',
      viewAbleName: 'Free Parking',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/paid_parking.svg',
      value: 'paid_parking',
      viewAbleName: 'Paid Parking',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/air_condition.svg',
      value: 'air_conditon',
      viewAbleName: 'Air Conditon',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/case.svg',
      value: 'case_particular',
      viewAbleName: 'Case Particular',
    ),
  ];
  static var GuestPlaceOfferList2 = <BestPlaceOptionModel>[
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/pool.svg',
      value: 'pool',
      viewAbleName: 'Pool',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/hot_tub.svg',
      value: 'hot_tub',
      viewAbleName: 'Hot Tub',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/patio.svg',
      value: 'patio',
      viewAbleName: 'Patio',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/bbq_grill.svg',
      value: 'bbq_grill',
      viewAbleName: 'BBQ Grill',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/fire.svg',
      value: 'fire',
      viewAbleName: 'Fire Pit',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/lake.svg',
      value: 'lake',
      viewAbleName: 'Lake Access',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/beach_access.svg',
      value: 'beach',
      viewAbleName: 'Beach Access',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/skyout.svg',
      value: 'skyout',
      viewAbleName: 'Ski-in/Ski-out',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/outdoor_shower.svg',
      value: 'outdoor_shower',
      viewAbleName: 'Outdoor Shower',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/ryokan.svg',
      value: 'ryokan',
      viewAbleName: 'Ryokan',
    ),
  ];
  static var GuestPlaceOfferList3 = <BestPlaceOptionModel>[
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/smoke_alarm.svg',
      value: 'smoke_alarm',
      viewAbleName: 'Smoke Alarm',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/first_aid.svg',
      value: 'first_aid',
      viewAbleName: 'First aid kit',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/fires.svg',
      value: 'fires',
      viewAbleName: 'Fire extinguisher',
    ),
    BestPlaceOptionModel(
      localSVGImageLocation: 'assets/icons/line/ryokan.svg',
      value: 'ryokan',
      viewAbleName: 'Ryokan',
    ),
  ];
}
