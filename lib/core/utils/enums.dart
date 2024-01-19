enum SortOptions {
  aZ,
  zA,
  dateRecent,
  dateOld;

  String map() {
    switch (this) {
      case SortOptions.aZ:
        return 'title';
      case SortOptions.zA:
        return '-title';
      case SortOptions.dateRecent:
        return 'created_at';
      case SortOptions.dateOld:
        return '-created_at';
    }
  }
}

enum ViewOptions {
  list,
  grid,
}

// enum AppearanceMode {
//   device,
//   light,
//   dark,
// }

enum ProductComponents {
  generalInfo,
  salesChannel,
  addVariant,
  editVariants,
  editOptions,
  editAttributes,
  editThumbnail,
  editMedia,
}

enum DateType { day, month }

enum DateFilterType {
  isInTheLast,
  isOlderThan,
  isAfter,
  isBefore,
  isEqualTo;

  String name() {
    switch (index) {
      case 0:
        return 'Is in the last';
      case 1:
        return 'Is older than';
      case 2:
        return 'Is after';
      case 3:
        return 'Is before';
      case 4:
        return 'Is equal to';
      default:
        return 'Is in the last';
    }
  }
}

enum DateFormatOptions {
  first,
  second,
  third,
  fourth,
  fifth,
  sixth,
  seventh,
  eighth;

  String toPattern() {
    switch (index) {
      case 0:
        return 'EEEE, MMM d, yyyy';
      case 1:
        return 'MM/dd/yyyy';
      case 2:
        return 'MM-dd-yyyy';
      case 3:
        return 'MMM d';
      case 4:
        return 'MMM d, yyyy';
      case 5:
        return 'E, d MMM yyyy';
      case 6:
        return 'yyyy-MM-dd';
      case 7:
        return 'dd.MM.yy';
      default:
        return 'MMM d, yyyy';
    }
  }

  static DateFormatOptions fromInt(int? val) {
    switch (val) {
      case null:
        return DateFormatOptions.fifth;
      case 0:
        return DateFormatOptions.first;
      case 1:
        return DateFormatOptions.second;
      case 2:
        return DateFormatOptions.third;

      case 3:
        return DateFormatOptions.fourth;
      case 4:
        return DateFormatOptions.fifth;
      case 5:
        return DateFormatOptions.sixth;
      case 6:
        return DateFormatOptions.seventh;
      case 7:
        return DateFormatOptions.eighth;
      default:
        return DateFormatOptions.fifth;
    }
  }
}

enum TimeFormatOptions {
  amPm,
  twentyFourHours;

  String format() {
    switch (index) {
      case 0:
        return 'hh:mm a';
      case 1:
        return 'HH:mm';
      default:
        return 'hh:mm a';
    }
  }

  static TimeFormatOptions fromInt(int? val) {
    switch (val) {
      case null:
        return TimeFormatOptions.amPm;
      case 0:
        return TimeFormatOptions.amPm;
      case 1:
        return TimeFormatOptions.twentyFourHours;
      default:
        return TimeFormatOptions.amPm;
    }
  }
}

enum SearchCategory {
  orders,
  draftOrders,
  products,
  collections,
  customers,
  groups,
  giftCards,
  discounts,
  priceLists;

  factory SearchCategory.fromJson(int? val) {
    switch (val) {
      case null:
        return SearchCategory.orders;
      case 0:
        return SearchCategory.orders;
      case 1:
        return SearchCategory.draftOrders;
      case 2:
        return SearchCategory.products;
      case 3:
        return SearchCategory.collections;
      case 4:
        return SearchCategory.customers;
      case 5:
        return SearchCategory.groups;
      case 6:
        return SearchCategory.giftCards;
      case 7:
        return SearchCategory.discounts;
      case 8:
        return SearchCategory.priceLists;

      default:
        return SearchCategory.orders;
    }
  }
}

enum AppBarStyle {
  normal,
  medium,
  large;

  factory AppBarStyle.fromJson(int? val) {
    switch (val) {
      case null:
        return AppBarStyle.normal;
      case 0:
        return AppBarStyle.normal;
      case 1:
        return AppBarStyle.medium;
      case 2:
        return AppBarStyle.large;
      default:
        return AppBarStyle.normal;
    }
  }

  int toInt() {
    switch (this) {
      case AppBarStyle.normal:
        return 0;
      case AppBarStyle.medium:
        return 1;
      case AppBarStyle.large:
        return 2;
    }
  }
}

enum AuthenticationType {
  cookie,
  token,
  jwt;

  @override
  String toString() {
    switch (this) {
      case AuthenticationType.cookie:
        return 'Cookie';
      case AuthenticationType.token:
        return 'Api Token';
      case AuthenticationType.jwt:
        return 'JWT';
    }
  }
}
