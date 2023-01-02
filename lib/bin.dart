void main(List<String> args) {
  DateTime time = DateTime.now();

  String d = time.toString();
  print(d);
  print(d.runtimeType);

  DateTime e = DateTime.parse(d);
  print(e);
  print(e.runtimeType);
}
