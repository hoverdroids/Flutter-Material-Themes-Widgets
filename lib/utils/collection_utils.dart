extension ListStringUtils on List<String> {
  List<String> toTrimmedUniqueList() => (this as Iterable<String>).toTrimmedUniqueList() as List<String>;

  List<String> trimAll() => (this as Iterable<String>).trimAll() as List<String>;

  List<String> toUniqueList({bool growable = true}) => (this as Iterable<String>).toUniqueList(growable: growable) as List<String>;

  List<String> sortList([int Function(String a, String b)? compare]) {
    sort(compare);
    return this;
  }
}

extension IterableStringUtils on Iterable<String> {

  Iterable<String> toTrimmedUniqueList() => trimAll().toUniqueList();

  Iterable<String> trimAll() => map((string) => string.replaceAllMapped(RegExp(r'^\s+|\s+$'), (match) => ""));

  Iterable<String> toUniqueList({bool growable = true}) => toSet().toList(growable:growable);
}