
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

enum UserRole {
  admin('admin'),
  member('member'),
  developer('developer');

  final String value;

  const UserRole(this.value);

  factory UserRole.fromString(String value) {
    if (value == 'admin') {
      return UserRole.admin;
    } else if (value == 'developer') {
      return UserRole.developer;
    } else {
      return UserRole.member;
    }
  }
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

  String format() {
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
}

enum TimeFormatOptions {
  amPm,
  twentyFourHours;
  String format(){
    switch(index){
      case 0:
        return 'hh:mm a';
      case 1:
        return 'HH:mm';
      default:
        return 'hh:mm a';
    }
  }
}
