class PromotionsModel {
  List<PromotionModel>? data;

  PromotionsModel({this.data});

  factory PromotionsModel.fromJson(Map<String, dynamic> json) {
    return PromotionsModel(
        data: (json['data'] as List)
            .map((e) => PromotionModel.fromJson(e))
            .toList());
  }
}

class PromotionModel {
  final int id;
  final String? title_tm;
  final String? title_ru;
  final String? background_image;
  final String? image;
  final int? percent;
  final PromotionMarket? market;
  final PromotionBrand? brand;
  final PromotionCategory? category;

  PromotionModel(
      {required this.id,
      this.title_tm,
      this.title_ru,
      this.background_image,
      this.image,
      this.percent,
      this.market,
      this.brand,
      this.category});

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'],
      title_tm: json['title_tm'],
      title_ru: json['title_ru'],
      background_image: json['background_image'],
      image: json['image'],
      percent: json['percent'],
      market: PromotionMarket.fromJson(json['market']),
      brand: PromotionBrand.fromJson(json['brand']),
      category: PromotionCategory.fromJson(json['category']),
    );
  }
}

// http://yes.com.tm

class PromotionMarket {
  final int id;
  final String? title;
  final String? logo;
  final String? address;
  final String? description;
  final String? phone;
  final String? market_owner;
  final DateTime? created_at;
  final DateTime? updated_at;

  PromotionMarket(
      {required this.id,
      this.title,
      this.logo,
      this.address,
      this.description,
      this.phone,
      this.market_owner,
      this.created_at,
      this.updated_at});

  factory PromotionMarket.fromJson(Map<String, dynamic> json) {
    return PromotionMarket(
      id: json['id'],
      title: json['title'],
      logo:  'http://yes.com.tm' + json['logo'],
      address: json['address'],
      description: json['description'],
      phone: json['phone'],
      market_owner: json['market_owner'],
      created_at: DateTime.tryParse(json['created_at']),
      updated_at: DateTime.tryParse(json['updated_at']),
    );
  }


}

class PromotionBrand {
  final int id;
  final String? name;
  final String? logo;
  final String? image;
  final String? background_image;
  final int? vip;
  final DateTime? created_at;
  final DateTime? updated_at;

  PromotionBrand(
      {required this.id,
      this.name,
      this.image,
      this.logo,
      this.background_image,
      this.vip,
      this.created_at,
      this.updated_at});

  factory PromotionBrand.fromJson(Map<String, dynamic> json) {
    return PromotionBrand(
      id: json['id'],
      name: json['name'],
      logo:'http://yes.com.tm'+json['logo'],
      background_image: 'http://yes.com.tm' + json['background_image'],
      image: 'http://yes.com.tm' + json['image'],
      vip: json['vip'],
      created_at: DateTime.tryParse(json['created_at']),
      updated_at: DateTime.tryParse(json['updated_at']),
    );
  }
}

class PromotionCategory {
  final int id;
  final String? title_tm;
  final String? title_ru;
  final String? subtitle_tm;
  final String? subtitle_ru;
  final String? background_image;
  final String? image;
  final int? parent_id;
  final DateTime? created_at;
  final DateTime? updated_at;

  PromotionCategory(
      {required this.id,
      this.title_ru,
      this.title_tm,
      this.subtitle_tm,
      this.subtitle_ru,
      this.background_image,
      this.image,
      this.parent_id,
      this.created_at,
      this.updated_at});

  factory PromotionCategory.fromJson(Map<String, dynamic> json) {
    return PromotionCategory(
      id: json['id'],
      title_tm: json['title_tm'],
      title_ru: json['title_ru'],
      subtitle_tm: json['subtitle_tm'],
      subtitle_ru: json['subtitle_ru'],
      background_image: json['background_image'],
      image: json['image'],
      parent_id: json['parent_id'],
      created_at: DateTime.tryParse(json['created_at']),
      updated_at: DateTime.tryParse(json['updated_at']),
    );
  }
}
