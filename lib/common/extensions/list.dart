import 'package:collection/collection.dart';

extension ListAddSeparator<T> on List<T> {
  List<T> addSeparator(T separator) {
    final separatedList = <T>[];
    final lastItem = lastOrNull;

    for (final block in this) {
      separatedList.add(block);

      if (block == lastItem) continue;

      separatedList.add(separator);
    }

    return separatedList;
  }
}
