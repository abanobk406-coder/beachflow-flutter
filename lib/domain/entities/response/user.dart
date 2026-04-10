
class User {
  
  final int? id;
  
  final String? name;
 
  final String? email;

  final String? password;
 
  final String? role;
  
  final dynamic? otp;
  
  final String? profilePic;

  final bool? isVerified;
 
  final String? createdAt;

  final String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.otp,
    this.profilePic,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

}