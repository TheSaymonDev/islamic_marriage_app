class UsersModel {
  final String name;
  final String location;
  final String address;
  final String study;
  final String profession;
  final String status;
  bool isFavourite;

  UsersModel({
    required this.name,
    required this.location,
    required this.address,
    required this.study,
    required this.profession,
    required this.status,
    this.isFavourite=false,
  });
  
  static List<UsersModel> userList=[
    UsersModel(name: 'MD.JAHIDUL ISLAM', location: '25 years 5 months, 5 ft 2 in/160 cm', address: 'Mohakhali, Dhaka', study: 'Diploma in Engineering', profession: 'Engineer', status: 'Active Now'),
    UsersModel(name: 'MD.JAHIDUL ISLAM', location: '25 years 5 months, 5 ft 2 in/160 cm', address: 'Mohakhali, Dhaka', study: 'Diploma in Engineering', profession: 'Engineer', status: 'Active Now'),
    UsersModel(name: 'MD.JAHIDUL ISLAM', location: '25 years 5 months, 5 ft 2 in/160 cm', address: 'Mohakhali, Dhaka', study: 'Diploma in Engineering', profession: 'Engineer', status: 'Active Now'),
    UsersModel(name: 'MD.JAHIDUL ISLAM', location: '25 years 5 months, 5 ft 2 in/160 cm', address: 'Mohakhali, Dhaka', study: 'Diploma in Engineering', profession: 'Engineer', status: 'Active Now'),
    UsersModel(name: 'MD.JAHIDUL ISLAM', location: '25 years 5 months, 5 ft 2 in/160 cm', address: 'Mohakhali, Dhaka', study: 'Diploma in Engineering', profession: 'Engineer', status: 'Active Now'),
  ];

   void toggleFavourite(){
    isFavourite= !isFavourite;
  }

}
