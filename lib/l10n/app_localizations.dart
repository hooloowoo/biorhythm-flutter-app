import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hu'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Biorhythm Calculator'**
  String get appTitle;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @analysisDate.
  ///
  /// In en, this message translates to:
  /// **'Analysis Date'**
  String get analysisDate;

  /// No description provided for @selectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Select Birth Date'**
  String get selectBirthDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @notSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get notSelected;

  /// No description provided for @selectBirthDateHelp.
  ///
  /// In en, this message translates to:
  /// **'Please select your birth date'**
  String get selectBirthDateHelp;

  /// No description provided for @selectAnalysisDateHelp.
  ///
  /// In en, this message translates to:
  /// **'Please select the date to analyze'**
  String get selectAnalysisDateHelp;

  /// No description provided for @biorhythmChart.
  ///
  /// In en, this message translates to:
  /// **'Biorhythm Chart'**
  String get biorhythmChart;

  /// No description provided for @biorhythmAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Biorhythm Analysis'**
  String get biorhythmAnalysis;

  /// No description provided for @pleaseSelectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Please select your birth date to see the biorhythm chart.'**
  String get pleaseSelectBirthDate;

  /// No description provided for @physical.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get physical;

  /// No description provided for @emotional.
  ///
  /// In en, this message translates to:
  /// **'Emotional'**
  String get emotional;

  /// No description provided for @intellectual.
  ///
  /// In en, this message translates to:
  /// **'Intellectual'**
  String get intellectual;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get critical;

  /// No description provided for @analysisDescription.
  ///
  /// In en, this message translates to:
  /// **'Analysis Description'**
  String get analysisDescription;

  /// No description provided for @biorhythmAnalysisFor.
  ///
  /// In en, this message translates to:
  /// **'Biorhythm Analysis for {date}'**
  String biorhythmAnalysisFor(String date);

  /// No description provided for @physicalDescription.
  ///
  /// In en, this message translates to:
  /// **'The physical cycle affects your energy, strength, and overall physical well-being.'**
  String get physicalDescription;

  /// No description provided for @emotionalDescription.
  ///
  /// In en, this message translates to:
  /// **'The emotional cycle influences your mood, creativity, and emotional stability.'**
  String get emotionalDescription;

  /// No description provided for @intellectualDescription.
  ///
  /// In en, this message translates to:
  /// **'The intellectual cycle impacts your analytical thinking, decision-making, and mental clarity.'**
  String get intellectualDescription;

  /// No description provided for @chartDescription.
  ///
  /// In en, this message translates to:
  /// **'The chart shows your biorhythm cycles over time. Touch or tap the lines to see exact values.'**
  String get chartDescription;

  /// No description provided for @birthdate.
  ///
  /// In en, this message translates to:
  /// **'Birthdate'**
  String get birthdate;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @actualDate.
  ///
  /// In en, this message translates to:
  /// **'Actual date'**
  String get actualDate;

  /// No description provided for @profiles.
  ///
  /// In en, this message translates to:
  /// **'Profiles'**
  String get profiles;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'New profile'**
  String get addItem;

  /// No description provided for @mainTitle.
  ///
  /// In en, this message translates to:
  /// **'Biorhythm'**
  String get mainTitle;

  /// No description provided for @descrPhysicalMax.
  ///
  /// In en, this message translates to:
  /// **'During this period, your physical activity level increases. Your body feels energetic and vital, and you can perform physical activities with stamina. Additionally, your sexual activity may increase during this time. It is the best time for physical work, sports, sex, and medical interventions.'**
  String get descrPhysicalMax;

  /// No description provided for @descrPhysicalMid.
  ///
  /// In en, this message translates to:
  /// **'During this period, it is important to prioritize your physical health. Therefore, it is essential to avoid injuries while engaging in physical activities. Take special care while using tools, driving, and operating machinery to prevent accidents. If possible, try to minimize any potential sources of danger. It is also advisable to avoid medical interventions or travel unless necessary.'**
  String get descrPhysicalMid;

  /// No description provided for @descrPhysicalMin.
  ///
  /// In en, this message translates to:
  /// **'During this period, you may experience decreased physical and sexual activity, tiredness, deteriorating coordination, and sickness. It is recommended to reduce physical work and avoid alcohol consumption if possible.'**
  String get descrPhysicalMin;

  /// No description provided for @descrEmotionalMax.
  ///
  /// In en, this message translates to:
  /// **'During this period, you may experience contentment, motivation, enthusiasm, and eagerness to create and love. However, you may also have heightened sensitivity, which can cause you to react quickly to extremes in your relationships. If you experience a lack of peace and coldness in your relationships, it may trigger an adverse reaction.'**
  String get descrEmotionalMax;

  /// No description provided for @descrEmotionalMid.
  ///
  /// In en, this message translates to:
  /// **'During this period, it may be difficult to manage emotions, and occasional outbursts may occur.'**
  String get descrEmotionalMid;

  /// No description provided for @descrEmotionalMin.
  ///
  /// In en, this message translates to:
  /// **'During this period, individuals may experience decreased energy levels, increased irritability, and apathy. Women and creative types may be particularly susceptible. This period may not be optimal for relationships, particularly romantic ones.'**
  String get descrEmotionalMin;

  /// No description provided for @descrIntellectualMax.
  ///
  /// In en, this message translates to:
  /// **'During this period, your creativity and mental activity will increase. You can quickly solve complicated issues, and it is an excellent time to make important decisions, deals, and contracts.'**
  String get descrIntellectualMax;

  /// No description provided for @descrIntellectualMid.
  ///
  /// In en, this message translates to:
  /// **'During this period, you may find yourself unable to concentrate, making impulsive decisions and having unrealistic, useless, unrealistic ideas. Don\'t expect too much from yourself intellectually.'**
  String get descrIntellectualMid;

  /// No description provided for @descrIntellectualMin.
  ///
  /// In en, this message translates to:
  /// **'During this period, you may experience a decrease in your mental capacity, making it difficult to think and remember things. It\'s advisable to avoid making any important decisions, such as signing a contract, making a deal, or starting a new project. Instead, engage in activities that don\'t require too much thinking.'**
  String get descrIntellectualMin;

  /// No description provided for @detailedAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Detailed Analysis'**
  String get detailedAnalysis;

  /// No description provided for @physicalCycle.
  ///
  /// In en, this message translates to:
  /// **'Physical Cycle'**
  String get physicalCycle;

  /// No description provided for @emotionalCycle.
  ///
  /// In en, this message translates to:
  /// **'Emotional Cycle'**
  String get emotionalCycle;

  /// No description provided for @intellectualCycle.
  ///
  /// In en, this message translates to:
  /// **'Intellectual Cycle'**
  String get intellectualCycle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hu':
      return AppLocalizationsHu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
