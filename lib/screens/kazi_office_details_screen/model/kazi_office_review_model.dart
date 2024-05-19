import 'package:islamic_marriage/utils/app_urls.dart';

class KaziOfficeReviewModel {
  String profileImage, name, message;
  double rating;
  bool isLiked;
  List<String>  productImage;
  KaziOfficeReviewModel(
      {required this.profileImage,
        required this.name,
        required this.message,
        required this.productImage,
        required this.rating,
        required this.isLiked});

  void toggleHelpful(){
    isLiked =! isLiked;
  }

  static List<KaziOfficeReviewModel> reviewList = [
    KaziOfficeReviewModel(
        profileImage: AppUrls.photoPng,
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: [AppUrls.demoPng, AppUrls.demoPng, AppUrls.demoPng],
        rating: 3.5,
        isLiked: false),
    KaziOfficeReviewModel(
        profileImage: AppUrls.photoPng,
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: [AppUrls.demoPng, AppUrls.demoPng, AppUrls.demoPng],
        rating: 3.5,
        isLiked: false),
    KaziOfficeReviewModel(
        profileImage: AppUrls.photoPng,
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: [AppUrls.demoPng, AppUrls.demoPng, AppUrls.demoPng],
        rating: 3.5,
        isLiked: false),
    KaziOfficeReviewModel(
        profileImage: AppUrls.photoPng,
        name: 'Rony',
        message: 'Wonderful jean, perfect gift for my girl for our anniversary!',
        productImage: [AppUrls.demoPng, AppUrls.demoPng, AppUrls.demoPng],
        rating: 3.5,
        isLiked: false),
  ];
}
