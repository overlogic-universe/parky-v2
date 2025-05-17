// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginGreetingTitle => 'Welcome Back!';

  @override
  String get loginGreetingDesc => 'Login in to your existant account';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterYourEmail => 'Enter Your email';

  @override
  String get enterYourPassword => 'Enter Your password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotYourPassword => 'Forgot your password?';

  @override
  String get loginWithStudentEmail => 'Login with student email';

  @override
  String homeGreeting(Object time) {
    return 'Good $time,';
  }

  @override
  String get parkedDate => 'Parked Date';

  @override
  String get exitDate => 'Exit Date';

  @override
  String get parkedTime => 'Parked Time';

  @override
  String get exitTime => 'Exit Time';

  @override
  String get nim => 'NIM';

  @override
  String get parkingLot => 'Parking Lot';

  @override
  String get status => 'Status';

  @override
  String get plate => 'Plate';

  @override
  String get scanHere => 'SCAN HERE';

  @override
  String get parked => 'Parked';

  @override
  String get exited => 'Exited';

  @override
  String get parkingInfo => 'Parking Info';

  @override
  String get setting => 'Setting';

  @override
  String get settingDesc => 'Customize your experience with ease! Choose your preferred language and set the theme to your liking';

  @override
  String get account => 'Account';

  @override
  String get updatePassword => 'Update your password';

  @override
  String get personalized => 'Personalized';

  @override
  String get authentication => 'Authentication';

  @override
  String get chooseTheme => 'Choose theme';

  @override
  String get chooseThemeDesc => 'Customize the app\'s look with your favorite theme!';

  @override
  String get chooseLanguage => 'Choose language';

  @override
  String get chooseLanguageDesc => 'Select the language you\'re most comfortable with for the best experience';

  @override
  String get successChangeTheme => 'Successfully change theme';

  @override
  String get successChangeLanguage => 'Successfully change language';

  @override
  String get mainTheme => 'Main Theme';

  @override
  String get orbTheme => 'Orb Theme';

  @override
  String get indonesia => 'Bahasa Indonesia';

  @override
  String get english => 'English';

  @override
  String get noData => 'No data';

  @override
  String get login => 'Login';

  @override
  String get orLoginAs => 'Or login as';

  @override
  String get out => 'Exit';

  @override
  String get logout => 'Logout';

  @override
  String get logoutModalDesc => 'Are you sure you want to log out?';

  @override
  String get loginSuccess => 'Login successful';

  @override
  String get logoutSuccess => 'Logout successful';

  @override
  String mustNotBeEmpty(Object field) {
    return '$field must not be empty!';
  }

  @override
  String get mustUseStudentEmail => 'Please use a student email!';

  @override
  String atLeastLengthCharacters(Object field, Object length) {
    return '$field must be at least $length characters!';
  }

  @override
  String invalidFormat(Object field) {
    return 'The $field you entered is invalid!';
  }

  @override
  String get serverError => 'Server error';

  @override
  String get networkError => 'Unstable network';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get studentNotFound => 'Student not found';

  @override
  String get passwordIsNull => 'Password is null';

  @override
  String get emailAlreadyRegistered => 'Email already registered';

  @override
  String get loginWithGoogleAbortedByStudent => 'Google sign-in aborted';

  @override
  String get loginWithGoogleFailed => 'Google sign-in failed';

  @override
  String get invalidCredentials => 'Email or password is incorrect';

  @override
  String get emailAlreadyExists => 'This email is already in use';

  @override
  String get signOutFailed => 'Sign out failed';

  @override
  String get loginFailed => 'Login failed, Please try again!';

  @override
  String get getParkFailed => 'Failed to retrieve parking data';

  @override
  String get getVehicleFailed => 'Failed to retrieve vehicle data';

  @override
  String get getParkingLotFailed => 'Failed to retrieve parking lot data';

  @override
  String get loading => 'Loading';

  @override
  String get and => 'and';

  @override
  String get or => 'or';

  @override
  String get confirm => 'Confirm';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get back => 'Back';

  @override
  String get start => 'Start';

  @override
  String get search => 'Search';

  @override
  String get end => 'End';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get evening => 'Evening';

  @override
  String get night => 'Night';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';
}
