class Division {
  String name;
  List<District> districts;

  Division({required this.name, required this.districts});
  @override
  String toString() {
    return name;
  }
}

class District {
  String name;
  List<SubDistrict> subDistricts;

  District({required this.name, required this.subDistricts});
  @override
  String toString() {
    return name;
  }
}

class SubDistrict {
  String name;
  SubDistrict({required this.name});
  @override
  String toString() {
    return name;
  }
}

List<Division> get getDivisions {
  return [
    Division(name: 'Dhaka', districts: [
      District(name: 'Dhaka', subDistricts: [
        SubDistrict(name: 'Mohammedpur'),
        SubDistrict(name: 'Savar')
      ]),
      District(name: 'Gopalgonj', subDistricts: [
        SubDistrict(name: 'Tungipara'),
        SubDistrict(name: 'Gopalgonj Sadar')
      ])
    ]),
    Division(name: 'Chittagong', districts: [
      District(name: 'Chittagong', subDistricts: [
        SubDistrict(name: 'Bandar'),
        SubDistrict(name: 'Agrabad')
      ]),
      District(name: 'Cumilla', subDistricts: [
        SubDistrict(name: 'Chandina'),
        SubDistrict(name: 'Devidwar')
      ])
    ]),
  ];
}
