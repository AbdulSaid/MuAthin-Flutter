import 'package:muathin/models/salah.dart';

class PrayerTimes {
  Salah fajr, fitr, adha, thuhr, asr, maghreb, isha, jumuah;

  PrayerTimes transform({Map map}) {
    PrayerTimes pT = new PrayerTimes();

    pT.fajr = Salah().transform(name: 'Fajr', map: map['fajr']);
    pT.fitr = Salah().transform(name: 'Eid Al-Fitr', map: map['fitr']);
    pT.adha = Salah().transform(name: 'Eid Al-Adha', map: map['adha']);
    pT.thuhr = Salah().transform(name: 'Thuhr', map: map['thuhr']);
    pT.asr = Salah().transform(name: 'Asr', map: map['asr']);
    pT.maghreb = Salah().transform(name: 'Magreb', map: map['maghreb']);
    pT.isha = Salah().transform(name: 'Isha', map: map['isha']);
    pT.jumuah = Salah().transform(name: 'Jumuah', map: map['jumuah']);

    return pT;
  }
}