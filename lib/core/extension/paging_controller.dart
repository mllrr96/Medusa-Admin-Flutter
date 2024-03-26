import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

extension PagingControllerExtension<T> on PagingController<int, T> {
  void addItem(T item) {
    value = PagingState(
      itemList: itemList?..add(item),
      nextPageKey: nextPageKey,
      error: null,
    );
  }

  void removeItem(T item) {
    value = PagingState(
      itemList: itemList?..remove(item),
      nextPageKey: nextPageKey,
      error: null,
    );
  }
  void removeAt(int index) {
    value = PagingState(
      itemList: itemList?..removeAt(index),
      nextPageKey: nextPageKey,
      error: null,
    );
  }

  void updateItem(T item, int index) {
    if (index != -1) {
      itemList?[index] = item;
      value = PagingState(
        itemList: itemList,
        nextPageKey: nextPageKey,
        error: null,
      );
    }
  }
}
