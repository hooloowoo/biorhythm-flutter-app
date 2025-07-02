// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Biorhythm Calculator';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get analysisDate => 'Analysis Date';

  @override
  String get selectBirthDate => 'Select Birth Date';

  @override
  String get selectDate => 'Select Date';

  @override
  String get notSelected => 'Not selected';

  @override
  String get selectBirthDateHelp => 'Please select your birth date';

  @override
  String get selectAnalysisDateHelp => 'Please select the date to analyze';

  @override
  String get biorhythmChart => 'Biorhythm Chart';

  @override
  String get biorhythmAnalysis => 'Biorhythm Analysis';

  @override
  String get pleaseSelectBirthDate =>
      'Please select your birth date to see the biorhythm chart.';

  @override
  String get physical => 'Physical';

  @override
  String get emotional => 'Emotional';

  @override
  String get intellectual => 'Intellectual';

  @override
  String get high => 'High';

  @override
  String get medium => 'Medium';

  @override
  String get low => 'Low';

  @override
  String get critical => 'Critical';

  @override
  String get analysisDescription => 'Analysis Description';

  @override
  String biorhythmAnalysisFor(String date) {
    return 'Biorhythm Analysis for $date';
  }

  @override
  String get physicalDescription =>
      'The physical cycle affects your energy, strength, and overall physical well-being.';

  @override
  String get emotionalDescription =>
      'The emotional cycle influences your mood, creativity, and emotional stability.';

  @override
  String get intellectualDescription =>
      'The intellectual cycle impacts your analytical thinking, decision-making, and mental clarity.';

  @override
  String get chartDescription =>
      'The chart shows your biorhythm cycles over time. Touch or tap the lines to see exact values.';

  @override
  String get birthdate => 'Birthdate';

  @override
  String get name => 'Name';

  @override
  String get settings => 'Settings';

  @override
  String get actualDate => 'Actual date';

  @override
  String get profiles => 'Profiles';

  @override
  String get addItem => 'New profile';

  @override
  String get mainTitle => 'Biorhythm';

  @override
  String get descrPhysicalMax =>
      'During this period, your physical activity level increases. Your body feels energetic and vital, and you can perform physical activities with stamina. Additionally, your sexual activity may increase during this time. It is the best time for physical work, sports, sex, and medical interventions.';

  @override
  String get descrPhysicalMid =>
      'During this period, it is important to prioritize your physical health. Therefore, it is essential to avoid injuries while engaging in physical activities. Take special care while using tools, driving, and operating machinery to prevent accidents. If possible, try to minimize any potential sources of danger. It is also advisable to avoid medical interventions or travel unless necessary.';

  @override
  String get descrPhysicalMin =>
      'During this period, you may experience decreased physical and sexual activity, tiredness, deteriorating coordination, and sickness. It is recommended to reduce physical work and avoid alcohol consumption if possible.';

  @override
  String get descrEmotionalMax =>
      'During this period, you may experience contentment, motivation, enthusiasm, and eagerness to create and love. However, you may also have heightened sensitivity, which can cause you to react quickly to extremes in your relationships. If you experience a lack of peace and coldness in your relationships, it may trigger an adverse reaction.';

  @override
  String get descrEmotionalMid =>
      'During this period, it may be difficult to manage emotions, and occasional outbursts may occur.';

  @override
  String get descrEmotionalMin =>
      'During this period, individuals may experience decreased energy levels, increased irritability, and apathy. Women and creative types may be particularly susceptible. This period may not be optimal for relationships, particularly romantic ones.';

  @override
  String get descrIntellectualMax =>
      'During this period, your creativity and mental activity will increase. You can quickly solve complicated issues, and it is an excellent time to make important decisions, deals, and contracts.';

  @override
  String get descrIntellectualMid =>
      'During this period, you may find yourself unable to concentrate, making impulsive decisions and having unrealistic, useless, unrealistic ideas. Don\'t expect too much from yourself intellectually.';

  @override
  String get descrIntellectualMin =>
      'During this period, you may experience a decrease in your mental capacity, making it difficult to think and remember things. It\'s advisable to avoid making any important decisions, such as signing a contract, making a deal, or starting a new project. Instead, engage in activities that don\'t require too much thinking.';

  @override
  String get detailedAnalysis => 'Detailed Analysis';

  @override
  String get physicalCycle => 'Physical Cycle';

  @override
  String get emotionalCycle => 'Emotional Cycle';

  @override
  String get intellectualCycle => 'Intellectual Cycle';
}
