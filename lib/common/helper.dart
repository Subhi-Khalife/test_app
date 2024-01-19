class DesignHelper {
  static const int maxPaginationNumber = 30;

  static int calcPaginationOffset({required List<dynamic> itemsCount}) {
    return itemsCount.length;
  }
}
