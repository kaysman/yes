enum GadgetType {
  // 1. TWO SMALL CARDS LIED HORIZONTALLY. WITHOUT SCROLL, NEED 2 APIS.
  TWO_SMALL_CARDS_HORIZONTAL,

  // 2. OPTION: WITH TITLE OR NOT. ASK FOR N NUMBER OF API LINKS.
  BANNER_SWIPE_WITH_DOTS,

  // 3. 2X2 GRID ITEMS WITH TITLE AS IMAGE. NEED 5 API LINKS. 1 FOR TITLE AND 4 FOR CHILDREN.
  TWO_TO_TWO_WITH_TITLE_AS_IMAGE,

  // 4. BANNER IMAGE. CONSIDER LEFT SIDE AS FOR MEN AND RIGHT FOR WOMEN. NEED 2 APIS.
  BANNER_FOR_MEN_AND_WOMEN,

  // 5. 2X2 GRID WITH TITLE AS TEXT. DECIDE ABOUT COMBINING WITH 3TH.
  TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT,

  // 6. CARDS WITH RATIO 16:9, LINED HORIZONTALLY WITH TITLE AS TEXT. (FYI 16-WIDTH AND 9-HEIGHT)
  CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT,

  // 7. CARDS WITH RATIO 16:9, LINED HORIZONTALLY WITH TITLE AS IMAGE.
  CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE,

  // 8. CARDS WITH RATIO 2:3, LINED HORIZONTALLY WITH TITLE AS IMAGE.
  CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE,

  // 9. 3X3 GRID ITEMS WITH TITLE AS TEXT.
  THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT,

  // 10. A IMAGE.
  ONE_IMAGE_WITH_FULL_WIDTH,

  // 11. CARDS WITH RATIO 2:3, LINED HORIZONTALLY WITH TITLE AS TEXT.
  CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT,

  // 12. POPULAR (MAX 4 BRAND VERTICALLY, N LINK, USE MYNTRA AS REFERENCE FOR MORE INFO)
  POPULAR,

  // 13. PRODUCTS (NOT CARDS) WITH RATIO 2:3, LINED HORIZONTALLY WITH TITLE AS TEXT.
  // (N NUMBER OF PRODUCTS MUST BE SELECTED TO BE DISPLAYED).
  TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT,

  // 14
  CIRCLE_ITEMS,

  //15
  CATEGORY_BANNER
}

enum GadgetStatus { ACTIVE, INACTIVE }

enum GadgetLocation { HOME, CATEGORY }

extension ExtraProperties on GadgetType {
  int get crossAxisCount {
    switch (this) {
      case GadgetType.TWO_SMALL_CARDS_HORIZONTAL:
        return 2;
      case GadgetType.THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT:
        return 3;
      case GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT:
        return 2;
      case GadgetType.TWO_TO_TWO_WITH_TITLE_AS_IMAGE:
        return 2;

      case GadgetType.BANNER_SWIPE_WITH_DOTS:
      case GadgetType.BANNER_FOR_MEN_AND_WOMEN:
      case GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      case GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      case GadgetType.ONE_IMAGE_WITH_FULL_WIDTH:
      case GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.POPULAR:
      case GadgetType.TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.CIRCLE_ITEMS:
      case GadgetType.CATEGORY_BANNER:
      default:
        return 0;
    }
  }

  Map<String, double> get widthWithHeight {
    switch (this) {
      case GadgetType.TWO_SMALL_CARDS_HORIZONTAL:
        return {'w': 100, 'h': 120};
      case GadgetType.THREE_TO_THREE_GRID_WITH_TITLE_AS_TEXT:
        return {'w': 100, 'h': 120};
      case GadgetType.TWO_TO_TWO_GRID_WITH_TITLE_AS_TEXT:
        return {'w': 100, 'h': 120};
      case GadgetType.TWO_TO_TWO_WITH_TITLE_AS_IMAGE:
        return {'w': 100, 'h': 120};

      case GadgetType.BANNER_SWIPE_WITH_DOTS:
      case GadgetType.BANNER_FOR_MEN_AND_WOMEN:
      case GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.CARDS_16_9_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      case GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_IMAGE:
      case GadgetType.ONE_IMAGE_WITH_FULL_WIDTH:
      case GadgetType.CARDS_2_3_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.POPULAR:
      case GadgetType.TWO_TO_THREE_PRODUCTS_IN_HORIZONTAL_WITH_TITLE_AS_TEXT:
      case GadgetType.CIRCLE_ITEMS:
      case GadgetType.CATEGORY_BANNER:
      default:
        return {'w': 100, 'h': 120};
    }
  }
}