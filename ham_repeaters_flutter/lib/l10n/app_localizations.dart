import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_it.dart';

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
  static const List<Locale> supportedLocales = <Locale>[Locale('it')];

  /// No description provided for @error.
  ///
  /// In it, this message translates to:
  /// **'Errore'**
  String get error;

  /// No description provided for @error_message.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante il caricamento'**
  String get error_message;

  /// No description provided for @error_message_retry.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante il caricamento. Riprova più tardi'**
  String get error_message_retry;

  /// No description provided for @retry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In it, this message translates to:
  /// **'Indietro'**
  String get back;

  /// No description provided for @loading.
  ///
  /// In it, this message translates to:
  /// **'Caricamento'**
  String get loading;

  /// No description provided for @details.
  ///
  /// In it, this message translates to:
  /// **'Dettagli'**
  String get details;

  /// No description provided for @pages_number.
  ///
  /// In it, this message translates to:
  /// **'{number} pagine d\'approfondire'**
  String pages_number(Object number);

  /// No description provided for @january.
  ///
  /// In it, this message translates to:
  /// **'Gennaio'**
  String get january;

  /// No description provided for @february.
  ///
  /// In it, this message translates to:
  /// **'Febbraio'**
  String get february;

  /// No description provided for @march.
  ///
  /// In it, this message translates to:
  /// **'Marzo'**
  String get march;

  /// No description provided for @april.
  ///
  /// In it, this message translates to:
  /// **'Aprile'**
  String get april;

  /// No description provided for @may.
  ///
  /// In it, this message translates to:
  /// **'Maggio'**
  String get may;

  /// No description provided for @june.
  ///
  /// In it, this message translates to:
  /// **'Giugno'**
  String get june;

  /// No description provided for @july.
  ///
  /// In it, this message translates to:
  /// **'Luglio'**
  String get july;

  /// No description provided for @august.
  ///
  /// In it, this message translates to:
  /// **'Agosto'**
  String get august;

  /// No description provided for @september.
  ///
  /// In it, this message translates to:
  /// **'Settembre'**
  String get september;

  /// No description provided for @october.
  ///
  /// In it, this message translates to:
  /// **'Ottobre'**
  String get october;

  /// No description provided for @november.
  ///
  /// In it, this message translates to:
  /// **'Novembre'**
  String get november;

  /// No description provided for @december.
  ///
  /// In it, this message translates to:
  /// **'Dicembre'**
  String get december;

  /// No description provided for @logout.
  ///
  /// In it, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In it, this message translates to:
  /// **'Profilo'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In it, this message translates to:
  /// **'Impostazioni'**
  String get settings;

  /// No description provided for @contact_us.
  ///
  /// In it, this message translates to:
  /// **'Contattaci'**
  String get contact_us;

  /// No description provided for @error_opening_email.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante l\'apertura dell\'email'**
  String get error_opening_email;

  /// No description provided for @register_now.
  ///
  /// In it, this message translates to:
  /// **'Registrati ora'**
  String get register_now;

  /// No description provided for @tracking_permission_title.
  ///
  /// In it, this message translates to:
  /// **'Supporta l\'App'**
  String get tracking_permission_title;

  /// No description provided for @tracking_permission_message.
  ///
  /// In it, this message translates to:
  /// **'Per migliorare la tua esperienza e mostrarti contenuti più rilevanti, aiutaci a mantenere gratuita l\'app.\n\nClicca su Allow per supportarci.'**
  String get tracking_permission_message;

  /// No description provided for @tracking_permission_next.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get tracking_permission_next;

  /// No description provided for @skip.
  ///
  /// In it, this message translates to:
  /// **'Salta'**
  String get skip;

  /// No description provided for @done.
  ///
  /// In it, this message translates to:
  /// **'Fatto'**
  String get done;

  /// No description provided for @next.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get next;

  /// No description provided for @joinCommunityTitle.
  ///
  /// In it, this message translates to:
  /// **'Unisciti alla nostra Community!'**
  String get joinCommunityTitle;

  /// No description provided for @joinCommunityDescription.
  ///
  /// In it, this message translates to:
  /// **'Scopri i vantaggi di entrare nella community Telegram:'**
  String get joinCommunityDescription;

  /// No description provided for @benefitSupportMembers.
  ///
  /// In it, this message translates to:
  /// **'Supporto dai membri'**
  String get benefitSupportMembers;

  /// No description provided for @benefitSuggestFeatures.
  ///
  /// In it, this message translates to:
  /// **'Proponi nuove funzionalità'**
  String get benefitSuggestFeatures;

  /// No description provided for @benefitContactDevelopers.
  ///
  /// In it, this message translates to:
  /// **'Contatto con gli sviluppatori'**
  String get benefitContactDevelopers;

  /// No description provided for @benefitActiveCommunity.
  ///
  /// In it, this message translates to:
  /// **'Community attiva'**
  String get benefitActiveCommunity;

  /// No description provided for @joinNowButton.
  ///
  /// In it, this message translates to:
  /// **'Unisciti ora!'**
  String get joinNowButton;

  /// No description provided for @laterButton.
  ///
  /// In it, this message translates to:
  /// **'Più tardi'**
  String get laterButton;

  /// No description provided for @errorOpenTelegram.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'apertura di Telegram'**
  String get errorOpenTelegram;

  /// No description provided for @repeatersMapTitle.
  ///
  /// In it, this message translates to:
  /// **'Mappa ripetitori'**
  String get repeatersMapTitle;

  /// No description provided for @repeatersMapLoading.
  ///
  /// In it, this message translates to:
  /// **'Caricamento mappa dei ripetitori…'**
  String get repeatersMapLoading;

  /// No description provided for @repeatersMapGenericError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile caricare i ripetitori.'**
  String get repeatersMapGenericError;

  /// No description provided for @repeatersMapEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore trovato vicino a te.'**
  String get repeatersMapEmpty;

  /// No description provided for @repeatersMapRetry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get repeatersMapRetry;

  /// No description provided for @repeatersMapOpenSettings.
  ///
  /// In it, this message translates to:
  /// **'Apri impostazioni'**
  String get repeatersMapOpenSettings;

  /// No description provided for @repeatersMapPermissionMessage.
  ///
  /// In it, this message translates to:
  /// **'Consenti l\'accesso alla posizione per mostrare i ripetitori vicino a te.'**
  String get repeatersMapPermissionMessage;

  /// No description provided for @repeatersMapPermissionPermanentlyDenied.
  ///
  /// In it, this message translates to:
  /// **'Permesso posizione negato in modo permanente. Abilitalo dalle impostazioni di sistema.'**
  String get repeatersMapPermissionPermanentlyDenied;

  /// No description provided for @repeatersMapLocationServicesDisabled.
  ///
  /// In it, this message translates to:
  /// **'Attiva i servizi di localizzazione per trovare i ripetitori vicini.'**
  String get repeatersMapLocationServicesDisabled;

  /// No description provided for @repeatersMapFound.
  ///
  /// In it, this message translates to:
  /// **'{count} ripetitori trovati'**
  String repeatersMapFound(int count);
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
      <String>['it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
