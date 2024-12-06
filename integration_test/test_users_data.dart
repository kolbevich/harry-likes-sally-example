class ProfileCredentials {
  final String email;
  final String password;
  final String uid;

  const ProfileCredentials({
    required this.email,
    required this.password,
    required this.uid,
  });
}

// Useer data got from Firebase Console -> Authentication -> Users
const ProfileCredentials sallyCredentials = ProfileCredentials(
  email: 'sally@test.com',
  password: 'sally_password',
  uid: 'uid1',
);
const ProfileCredentials harryCredentials = ProfileCredentials(
  email: 'harry@test.com',
  password: 'harry_password',
  uid: 'uid2',
);
