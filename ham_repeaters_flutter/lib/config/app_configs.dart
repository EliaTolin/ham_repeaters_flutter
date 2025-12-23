import 'dart:io';

import 'package:flutter/foundation.dart';

class AppConfigs {
  static String getSite() {
    return 'https://quizradiomatori.it/';
  }

  static String getSupabaseKey() {
    if (kDebugMode) {
      return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpqb21yeW92bWVqY2J2aXBqZ3VpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA2NjU1MDYsImV4cCI6MjA3NjI0MTUwNn0.17DlxMoJDv0n6Yg9i7GCUgfBpHMPuVwwz7CZXCI7hmM';
    } else {
      return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpqb21yeW92bWVqY2J2aXBqZ3VpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA2NjU1MDYsImV4cCI6MjA3NjI0MTUwNn0.17DlxMoJDv0n6Yg9i7GCUgfBpHMPuVwwz7CZXCI7hmM';
    }
  }

  static String getSupabaseUrl() {
    if (kDebugMode) {
      return 'https://zjomryovmejcbvipjgui.supabase.co';
    } else {
      return 'https://zjomryovmejcbvipjgui.supabase.co';
    }
  }

  static String bannerAdUnitId() {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }
    return Platform.isAndroid
        ? 'banner_ad_unit_id_android'
        : 'banner_ad_unit_id_ios';
  }

  static String interstitialAdUnitId() {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910';
    }
    return Platform.isAndroid
        ? 'ca-app-pub-7500053685536877/3774719396'
        : 'ca-app-pub-7500053685536877/6707068711';
  }

  static int defaultExpiresInSecondsImage() {
    const day = 15;
    return day * 24 * 60 * 60;
  }

  static String getTelegramLink() {
    return 'https://t.me/ham_repeaters';
  }

  static String getAppStoreId() {
    return '6754508610';
  }
}
