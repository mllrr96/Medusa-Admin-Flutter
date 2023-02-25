class UserCollectionUpdateProductsReq {
  /// The ID of the Collection.
  final String collectionId;

  /// An array of Product IDs to add to the Product Collection.
  final List<String> productsIds;

  UserCollectionUpdateProductsReq({required this.collectionId, required this.productsIds});
}
