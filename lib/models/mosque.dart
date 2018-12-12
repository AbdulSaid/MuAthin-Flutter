import 'package:muathin/models/address.dart';
import 'package:muathin/models/prayer_times.dart';
import 'package:muathin/models/user.dart';

class Mosque {
  String mosqueID, name, number, url, bio;
  Address address;
  User admin;
  PrayerTimes prayerTimes;

  Mosque transform({String key, Map map}) {
    Mosque m = new Mosque();

    m.mosqueID = key;
    m.name = map['name'];

    return m;
  }
}