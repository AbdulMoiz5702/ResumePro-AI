


class UserModel {
   String fullName;
   String? phoneNumber;
   String? email;
   String? currentPosition;
   String? address;
   String? bio;

  UserModel({
    required this.fullName,
    this.phoneNumber,
    this.email,
    this.currentPosition,
    this.address,
    this.bio,
  });
}
