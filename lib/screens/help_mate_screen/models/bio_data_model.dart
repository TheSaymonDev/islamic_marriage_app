class BioDataModel {
  Map<String, Map<String, String>> bioData;
  BioDataModel({required this.bioData});

  static List<BioDataModel> infoList = [
    BioDataModel(bioData: {
      'General Information': {
        'Bio Data Type': 'Male Bio Data',
        'Marital Status': 'Unmarried',
        'Date of Birth': '15-01-2001',
        'Height': "5' 4",
        'Complexion': 'Light Brown',
        'Weight': '52 KG',
        'Blood Group': 'B+',
        'Nationality': 'Bangladeshi',
      }
    }),
    BioDataModel(bioData: {
      'Address': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Educational Qualifications': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Family Information': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Personal Information': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Occupational Information': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Marriage Related Information': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Expected Life Partner': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Pledge': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
    BioDataModel(bioData: {
      'Contact': {
        'Name': 'John Doe',
        'Date of Birth': '1990-01-01',
        'Email': 'johndoe@example.com',
        'Phone Number': '+123 456 7890',
        'Address': '123 Main Street, Anytown, USA',
      }
    }),
  ];
}

class User{
  final int bioDataNo;
  final List<BioDataModel> infoList;
  User({required this.bioDataNo, required this.infoList});

  static List<User> userList = [
    User(bioDataNo: 1111, infoList: BioDataModel.infoList),
    User(bioDataNo: 0002, infoList: BioDataModel.infoList),
    User(bioDataNo: 0003, infoList: BioDataModel.infoList),
    User(bioDataNo: 0004, infoList: BioDataModel.infoList),
    User(bioDataNo: 0005, infoList: BioDataModel.infoList),
  ];
}
