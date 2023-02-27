enum SortOptions {
  aZ,
  zA,
  dateRecent,
  dateOld,
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
}
