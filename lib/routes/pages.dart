import 'package:airbnb_app/pages/auth/login.dart';
import 'package:airbnb_app/pages/auth/register.dart';
import 'package:airbnb_app/pages/auth/verification.dart';
import 'package:airbnb_app/pages/auth/welcome.dart';
import 'package:airbnb_app/pages/more/login_security/forgot_password.dart';
import 'package:airbnb_app/pages/more/login_security/login_security.dart';
import 'package:airbnb_app/pages/more/login_security/update_password.dart';
import 'package:airbnb_app/pages/more/Payments%20and%20Payout/payment_methods.dart';
import 'package:airbnb_app/pages/more/Payments%20and%20Payout/payment_payout.dart';
import 'package:airbnb_app/pages/more/personal_info/emergency%20contact.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/add_discounts.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/basics_about_your_place.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/choose_photos.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/create_discription.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/decide_confirm_reservation.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/describe_house.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/easy_to_get_started.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/guest_place_offer.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/house_info.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/take_photo.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/last_step.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/set_price.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/who_first_reservation.dart';
import 'package:airbnb_app/pages/create_new_password_screen.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/best_describe.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/get_started.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/listing.dart';
import 'package:airbnb_app/pages/more/your_place/learn_more/learn_more.dart';
import 'package:airbnb_app/pages/more/your_place/match_superhost/match_suparhost.dart';
import 'package:airbnb_app/pages/more/your_place/match_superhost/meet_host.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/editprofile_address_bottomsheet.dart';
import 'package:airbnb_app/pages/home_navigator.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/guest_place_type.dart';
import 'package:airbnb_app/pages/more/profile/driving_licence.dart';
import 'package:airbnb_app/pages/more/profile/identity_verification.dart';
import 'package:airbnb_app/pages/more/profile/get_verified_selected.dart';
import 'package:airbnb_app/pages/more/profile/profile.dart';
import 'package:airbnb_app/pages/more/profile/select_location.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/tell_us_your_place.dart';
import 'package:airbnb_app/pages/more/your_place/your_place.dart';
import 'package:get/get.dart';

import '../pages/more/your_place/airbnb_setup/add_house_photo.dart';
import '../pages/more/your_place/match_superhost/lasts_fond_superhost_bottomsheet.dart';
import '../pages/splash/page.dart';
import './routes.dart';

class AppPages {
  static var list = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.welcome, page: () => const WelcomeView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(name: AppRoutes.verification, page: () => const VerificationView()),
    GetPage(
        name: AppRoutes.homeNavigator, page: () => const HomeNavigatorView()),

    //More screens
    GetPage(
        name: AppRoutes.createNewPass,
        page: () => const CreateNewPasswordView()),
    //Profile screens
    GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
    GetPage(name: AppRoutes.getVerified, page: () => const GetVerifiedView()),
    GetPage(name: AppRoutes.getStarted, page: () => const GetStartedScreen()),
    GetPage(name: AppRoutes.drivingLicence, page: () => const DrivingLicence()),

    // Your place screens
    GetPage(name: AppRoutes.yourPlace, page: () => AirbnbYourPlaceView()),
    GetPage(name: AppRoutes.learnMore, page: () => LearnMoreView()),
    GetPage(name: AppRoutes.matchSuperHost, page: () => MatchSuperHostView()),
    GetPage(name: AppRoutes.meethost, page: () => MeetHost()),
    GetPage(name: AppRoutes.addHousePhoto, page: () => AddHousePhoto()),
    GetPage(name: AppRoutes.createDiscription, page: () => CreateDiscription()),
    GetPage(name: AppRoutes.choosePhotos, page: () => ChoosePhotos()),
    GetPage(name: AppRoutes.takePhoto, page: () => TakePhoto()),
    GetPage(name: AppRoutes.houseInfo, page: () => HouseInfo()),
    GetPage(
        name: AppRoutes.decideConfirmReservation,
        page: () => DecideConfirmReservation()),
    GetPage(
        name: AppRoutes.whoFirstReservation, page: () => WhoFirstReservation()),
    GetPage(name: AppRoutes.describeHouse, page: () => DescribeHouse()),

    GetPage(
        name: AppRoutes.lastsFondSuperhost,
        page: () => LastsFondSuperhostBottomsheet()),

    GetPage(
        name: AppRoutes.getVerifiedSelected,
        page: () => const GetVerifiedSelectedView()),

    //Airbnb setup screens
    GetPage(name: AppRoutes.guestPlaceType, page: () => const GuestPlaceType()),
    GetPage(
        name: AppRoutes.guestPlaceOffer, page: () => const GuestPlaceOffer()),

    GetPage(
        name: AppRoutes.editProfileAdress,
        page: () => const EditProfileAddressBottomSheet()),

    GetPage(name: AppRoutes.reviewListing, page: () => ReviewListingScreen()),
    GetPage(
        name: AppRoutes.tellUsYourPlace, page: () => TellUsYourPlaceScreen()),
    GetPage(name: AppRoutes.bestPlace, page: () => BestDescribeView()),
    GetPage(name: AppRoutes.selectLocation, page: () => SelectLocationView()),
    GetPage(
        name: AppRoutes.basicsAboutYourPlace,
        page: () => BasicsAboutYourPlaceView()),
    GetPage(name: AppRoutes.setPrice, page: () => SetPriceView()),
    GetPage(
        name: AppRoutes.easyToGetStarted, page: () => EasyToGetStartedView()),
    GetPage(name: AppRoutes.addDiscounts, page: () => AddDiscountsView()),
    GetPage(name: AppRoutes.lastStep, page: () => LastStepView()),
    GetPage(name: AppRoutes.loginSecurity, page: () => LoginSecurityView()),

    //Personal Info
    GetPage(name: AppRoutes.personalInfo, page: () => PersonalInfoView()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordView()),
    GetPage(name: AppRoutes.updatePassword, page: () => UpdatePasswordView()),
    GetPage(name: AppRoutes.paymentPayout, page: () => PaymentPayoutView()),
    GetPage(name: AppRoutes.paymentMethod, page: () => PaymentMethodsView()),
    GetPage(name: AppRoutes.emergencyContact, page: () => EmergencyContact()),
  ];
}
