class PlanModel{
  final String title;
  final String subTitle;
  final String price;
  
  PlanModel({required this.title, required this.subTitle, required this.price});
  
  static List<PlanModel> plans = [
    PlanModel(title: 'Monthly Plan', subTitle: 'Month', price: '5'),
    PlanModel(title: 'Yearly Plan', subTitle: '12 Month', price: '50'),
  ];
}