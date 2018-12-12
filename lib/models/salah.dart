class Salah {
  String name, athan, iqama;

  Salah transform({String name, Map map}) {
    Salah s = new Salah();

    s.name = name;
    s.athan = map['athan'];
    s.iqama = map['iqama'];

    return s;
  }
}