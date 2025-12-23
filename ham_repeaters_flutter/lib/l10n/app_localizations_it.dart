// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get error => 'Errore';

  @override
  String get error_message =>
      'Si è verificato un errore durante il caricamento';

  @override
  String get error_message_retry =>
      'Si è verificato un errore durante il caricamento. Riprova più tardi';

  @override
  String get retry => 'Riprova';

  @override
  String get back => 'Indietro';

  @override
  String get loading => 'Caricamento';

  @override
  String get details => 'Dettagli';

  @override
  String pages_number(Object number) {
    return '$number pagine d\'approfondire';
  }

  @override
  String get january => 'Gennaio';

  @override
  String get february => 'Febbraio';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Aprile';

  @override
  String get may => 'Maggio';

  @override
  String get june => 'Giugno';

  @override
  String get july => 'Luglio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Settembre';

  @override
  String get october => 'Ottobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Dicembre';

  @override
  String get logout => 'Logout';

  @override
  String get profile => 'Profilo';

  @override
  String get settings => 'Impostazioni';

  @override
  String get contact_us => 'Contattaci';

  @override
  String get error_opening_email =>
      'Si è verificato un errore durante l\'apertura dell\'email';

  @override
  String get register_now => 'Registrati ora';

  @override
  String get tracking_permission_title => 'Supporta l\'App';

  @override
  String get tracking_permission_message =>
      'Per migliorare la tua esperienza e mostrarti contenuti più rilevanti, aiutaci a mantenere gratuita l\'app.\n\nClicca su Allow per supportarci.';

  @override
  String get tracking_permission_next => 'Avanti';

  @override
  String get skip => 'Salta';

  @override
  String get done => 'Fatto';

  @override
  String get next => 'Avanti';

  @override
  String get joinCommunityTitle => 'Unisciti alla nostra Community!';

  @override
  String get joinCommunityDescription =>
      'Scopri i vantaggi di entrare nella community Telegram:';

  @override
  String get benefitSupportMembers => 'Supporto dai membri';

  @override
  String get benefitSuggestFeatures => 'Proponi nuove funzionalità';

  @override
  String get benefitContactDevelopers => 'Contatto con gli sviluppatori';

  @override
  String get benefitActiveCommunity => 'Community attiva';

  @override
  String get joinNowButton => 'Unisciti ora!';

  @override
  String get laterButton => 'Più tardi';

  @override
  String get errorOpenTelegram => 'Errore durante l\'apertura di Telegram';

  @override
  String get repeatersMapTitle => 'Mappa ripetitori';

  @override
  String get repeatersMapLoading => 'Caricamento mappa dei ripetitori…';

  @override
  String get repeatersMapGenericError => 'Impossibile caricare i ripetitori.';

  @override
  String get repeatersMapEmpty => 'Nessun ripetitore trovato vicino a te.';

  @override
  String get repeatersMapRetry => 'Riprova';

  @override
  String get repeatersMapOpenSettings => 'Apri impostazioni';

  @override
  String get repeatersMapPermissionMessage =>
      'Consenti l\'accesso alla posizione per mostrare i ripetitori vicino a te.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permesso posizione negato in modo permanente. Abilitalo dalle impostazioni di sistema.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Attiva i servizi di localizzazione per trovare i ripetitori vicini.';

  @override
  String repeatersMapFound(int count) {
    return '$count ripetitori trovati';
  }
}
