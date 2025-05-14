import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  // keep those values final which you do not want to update:
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// constructor for userModel:
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to get the full name
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split full name into first and last name:
  static List<String> namePorts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name :
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model:
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// convert model to JSON structure for storing data in firebase:
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a userModel from firebase document snapshot:
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
