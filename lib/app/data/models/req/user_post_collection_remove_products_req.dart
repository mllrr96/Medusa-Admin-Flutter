class UserCollectionRemoveProductsReq {

  /// The ID of the Collection.
  final String collectionId;
  /// An array of Product IDs to remove from the Product Collection.
  final List<String> productsIds;

  UserCollectionRemoveProductsReq({required this.collectionId, required this.productsIds});

}