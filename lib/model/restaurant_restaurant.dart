import 'r.dart';
import 'location.dart';
import 'enum_values.dart';
import 'user_rating.dart';
import 'all_reviews.dart';
import 'photo_element.dart';
import 'foodie_level.dart';

enum Apikey { THE_327_E75_C31_CA03_DBB55_CBABE4257_ACFA9 }

final apikeyValues = EnumValues({
  "327e75c31ca03dbb55cbabe4257acfa9": Apikey.THE_327_E75_C31_CA03_DBB55_CBABE4257_ACFA9
});

enum Currency { EMPTY, CURRENCY }

final currencyValues = EnumValues({
  "£": Currency.CURRENCY,
  "\u0024": Currency.EMPTY
});

enum MezzoProvider { OTHER }

final mezzoProviderValues = EnumValues({
  "OTHER": MezzoProvider.OTHER
});








class RestaurantRestaurant {
  R r;
  Apikey apikey;
  String id;
  String name;
  String url;
  Location location;
  int switchToOrderMenu;
  String cuisines;
  String timings;
  int averageCostForTwo;
  int priceRange;
  Currency currency;
  List<String> highlights;
  List<dynamic> offers;
  int opentableSupport;
  int isZomatoBookRes;
  MezzoProvider mezzoProvider;
  int isBookFormWebView;
  String bookFormWebViewUrl;
  String bookAgainUrl;
  String thumb;
  UserRating userRating;
  int allReviewsCount;
  String photosUrl;
  int photoCount;
  String menuUrl;
  String featuredImage;
  int hasOnlineDelivery;
  int isDeliveringNow;
  bool includeBogoOffers;
  String deeplink;
  int isTableReservationSupported;
  int hasTableBooking;
  String eventsUrl;
  String phoneNumbers;
  AllReviews allReviews;
  List<String> establishment;
  List<dynamic> establishmentTypes;
  List<PhotoElement> photos;

  RestaurantRestaurant({
    this.r,
    this.apikey,
    this.id,
    this.name,
    this.url,
    this.location,
    this.switchToOrderMenu,
    this.cuisines,
    this.timings,
    this.averageCostForTwo,
    this.priceRange,
    this.currency,
    this.highlights,
    this.offers,
    this.opentableSupport,
    this.isZomatoBookRes,
    this.mezzoProvider,
    this.isBookFormWebView,
    this.bookFormWebViewUrl,
    this.bookAgainUrl,
    this.thumb,
    this.userRating,
    this.allReviewsCount,
    this.photosUrl,
    this.photoCount,
    this.menuUrl,
    this.featuredImage,
    this.hasOnlineDelivery,
    this.isDeliveringNow,
    this.includeBogoOffers,
    this.deeplink,
    this.isTableReservationSupported,
    this.hasTableBooking,
    this.eventsUrl,
    this.phoneNumbers,
    this.allReviews,
    this.establishment,
    this.establishmentTypes,
    this.photos,
  });

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) => RestaurantRestaurant(
    r: R.fromJson(json["R"]),
    apikey: apikeyValues.map[json["apikey"]],
    id: json["id"],
    name: json["name"],
    url: json["url"],
    location: Location.fromJson(json["location"]),
    switchToOrderMenu: json["switch_to_order_menu"],
    cuisines: json["cuisines"],
    timings: json["timings"],
    averageCostForTwo: json["average_cost_for_two"],
    priceRange: json["price_range"],
    currency: currencyValues.map[json["currency"]],
    highlights: List<String>.from(json["highlights"].map((x) => x)),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    opentableSupport: json["opentable_support"],
    isZomatoBookRes: json["is_zomato_book_res"],
    mezzoProvider: mezzoProviderValues.map[json["mezzo_provider"]],
    isBookFormWebView: json["is_book_form_web_view"],
    bookFormWebViewUrl: json["book_form_web_view_url"],
    bookAgainUrl: json["book_again_url"],
    thumb: json["thumb"],
    userRating: UserRating.fromJson(json["user_rating"]),
    allReviewsCount: json["all_reviews_count"],
    photosUrl: json["photos_url"],
    photoCount: json["photo_count"],
    menuUrl: json["menu_url"],
    featuredImage: json["featured_image"],
    hasOnlineDelivery: json["has_online_delivery"],
    isDeliveringNow: json["is_delivering_now"],
    includeBogoOffers: json["include_bogo_offers"],
    deeplink: json["deeplink"],
    isTableReservationSupported: json["is_table_reservation_supported"],
    hasTableBooking: json["has_table_booking"],
    eventsUrl: json["events_url"],
    phoneNumbers: json["phone_numbers"],
    allReviews: AllReviews.fromJson(json["all_reviews"]),
    establishment: List<String>.from(json["establishment"].map((x) => x)),
    establishmentTypes: List<dynamic>.from(json["establishment_types"].map((x) => x)),
    photos: json["photos"] == null ? null : List<PhotoElement>.from(json["photos"].map((x) => PhotoElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "R": r.toJson(),
    "apikey": apikeyValues.reverse[apikey],
    "id": id,
    "name": name,
    "url": url,
    "location": location.toJson(),
    "switch_to_order_menu": switchToOrderMenu,
    "cuisines": cuisines,
    "timings": timings,
    "average_cost_for_two": averageCostForTwo,
    "price_range": priceRange,
    "currency": currencyValues.reverse[currency],
    "highlights": List<dynamic>.from(highlights.map((x) => x)),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "opentable_support": opentableSupport,
    "is_zomato_book_res": isZomatoBookRes,
    "mezzo_provider": mezzoProviderValues.reverse[mezzoProvider],
    "is_book_form_web_view": isBookFormWebView,
    "book_form_web_view_url": bookFormWebViewUrl,
    "book_again_url": bookAgainUrl,
    "thumb": thumb,
    "user_rating": userRating.toJson(),
    "all_reviews_count": allReviewsCount,
    "photos_url": photosUrl,
    "photo_count": photoCount,
    "menu_url": menuUrl,
    "featured_image": featuredImage,
    "has_online_delivery": hasOnlineDelivery,
    "is_delivering_now": isDeliveringNow,
    "include_bogo_offers": includeBogoOffers,
    "deeplink": deeplink,
    "is_table_reservation_supported": isTableReservationSupported,
    "has_table_booking": hasTableBooking,
    "events_url": eventsUrl,
    "phone_numbers": phoneNumbers,
    "all_reviews": allReviews.toJson(),
    "establishment": List<dynamic>.from(establishment.map((x) => x)),
    "establishment_types": List<dynamic>.from(establishmentTypes.map((x) => x)),
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}
