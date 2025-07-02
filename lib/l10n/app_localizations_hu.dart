// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Bioritmikus Kalkulátor';

  @override
  String get birthDate => 'Születési Dátum';

  @override
  String get analysisDate => 'Elemzési Dátum';

  @override
  String get selectBirthDate => 'Születési Dátum Kiválasztása';

  @override
  String get selectDate => 'Dátum Kiválasztása';

  @override
  String get notSelected => 'Nincs kiválasztva';

  @override
  String get selectBirthDateHelp => 'Kérjük, válassza ki a születési dátumát';

  @override
  String get selectAnalysisDateHelp =>
      'Kérjük, válassza ki az elemzendő dátumot';

  @override
  String get biorhythmChart => 'Bioritmikus Grafikon';

  @override
  String get biorhythmAnalysis => 'Bioritmikus Elemzés';

  @override
  String get pleaseSelectBirthDate =>
      'Kérjük, válassza ki a születési dátumát a bioritmikus grafikon megtekintéséhez.';

  @override
  String get physical => 'Fizikai';

  @override
  String get emotional => 'Érzelmi';

  @override
  String get intellectual => 'Szellemi';

  @override
  String get high => 'Magas';

  @override
  String get medium => 'Közepes';

  @override
  String get low => 'Alacsony';

  @override
  String get analysisDescription => 'Elemzés Leírása';

  @override
  String biorhythmAnalysisFor(String date) {
    return 'Bioritmikus Elemzés $date dátumra';
  }

  @override
  String get physicalDescription =>
      'A fizikai ciklus befolyásolja az energiáját, erejét és általános fizikai jóllétét.';

  @override
  String get emotionalDescription =>
      'Az érzelmi ciklus befolyásolja a hangulatát, kreativitását és érzelmi stabilitását.';

  @override
  String get intellectualDescription =>
      'A szellemi ciklus hatással van az analitikus gondolkodására, döntéshozatalára és mentális tisztaságára.';

  @override
  String get chartDescription =>
      'A grafikon az időbeli bioritmikus ciklusokat mutatja. Érintse meg a vonalakat a pontos értékek megtekintéséhez.';

  @override
  String get birthdate => 'Szül. dátum';

  @override
  String get name => 'Név';

  @override
  String get settings => 'Beállítások';

  @override
  String get actualDate => 'Aktuális dátum';

  @override
  String get profiles => 'Profilok';

  @override
  String get addItem => 'Új profil';

  @override
  String get mainTitle => 'Bioritmus';

  @override
  String get descrPhysicalMax =>
      'Ebben az időszakban fokozott a fizikai szintű aktivitásod. A tested energikus, életteli, képes vagy kitartóan végezni fizikai tevékenységeket, fokozódhat a szexuális aktivitásod. A legjobb időszak a fizikai munkához, a sportoláshoz, a szexhez, az orvosi beavatkozásokhoz.';

  @override
  String get descrPhysicalMid =>
      'Ez az időszak kritikus a fizikai, testi épséged szempontjából. Légy óvatos a fizikai tevékenységeid során, hogy meg ne sérülj! Ügyelj az eszközhasználatra, a járművezetésre és gépkezelésre. Ha lehet, minimalizáld a veszélyforrásokat. Az orvosi beavatkozások, utazások kerülendők.';

  @override
  String get descrPhysicalMin =>
      'Ebben az időszakban csökken a fizikai és a szexuális aktivitásod. Fáradtnak érezheted magad, romlik a mozgáskoordinációd, akár meg is betegedhetsz. Ha lehet, csökkentsd a fizikai munkát, és kerüld az alkoholfogyasztást.';

  @override
  String get descrEmotionalMax =>
      'Ebben az időszakban elégedettnek érzed magad, motivált és lelkes lehetsz, alkotni és szeretni vágysz. Ugyanakkor fokozott az érzékenységed. Emiatt a kapcsolataidban könnyen reagálhatsz szélsőségesen, ha békétlenséget és ridegséget tapasztalsz.';

  @override
  String get descrEmotionalMid =>
      'Ezekben a napokban nehezebben kontrollálod az érzelmeidet. Hajlamos lehetsz érzelmi kitörésekre.';

  @override
  String get descrEmotionalMin =>
      'Ebben az időszakban csökken az életkedved, ingerlékenyebb lehetsz, és hajlamosabb az apátiára. A nők és a kreatív emberek erre általában érzékenyebbek. Ez a pár nap az emberi kapcsolatok, különösen a szerelem szempontjából nem túl kedvező.';

  @override
  String get descrIntellectualMax =>
      'Ebben az időszakban fokozódik a kreativitásod és a mentális aktivitásod. Bonyolult ügyeket is könnyedén megoldasz. Most érdemes üzletet, szerződést kötni, és meghozni a fontos döntéseidet.';

  @override
  String get descrIntellectualMid =>
      'Ezekben a napokban szórakozott, dekoncentrált lehetsz, és meggondolatlan döntéseket hozhatsz. Irreális és haszontalan, vagy megvalósíthatatlan ötleteid támadhatnak. Intellektuális téren ne várj magadtól túl sokat.';

  @override
  String get descrIntellectualMin =>
      'Ebben az időszakban csökkenhet a mentális kapacitásod, nehezebben megy a gondolkodás, rosszabb lehet a memóriád. Ha lehet, he most köss üzletet, ne írj alá szerződéseket, és ne most kezdj valami új ötlet megvalósításába. A legjobb, ha gondolkozást nem igénylő dolgokkal foglalkozol.';

  @override
  String get detailedAnalysis => 'Részletes Elemzés';

  @override
  String get physicalCycle => 'Fizikai Ciklus';

  @override
  String get emotionalCycle => 'Érzelmi Ciklus';

  @override
  String get intellectualCycle => 'Szellemi Ciklus';
}
