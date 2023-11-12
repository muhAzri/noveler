import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UnityAdsUtils {
  static initialize() {
    final String gameID = Platform.isAndroid
        ? const String.fromEnvironment("ANDROID_GAME_ID")
        : const String.fromEnvironment("IOS_GAME_ID");

    UnityAds.init(
      gameId: gameID,
      onComplete: () {
        debugPrint("Completed");
      },
      testMode: kDebugMode,
      onFailed: (error, message) {
        debugPrint('Initialization Failed: $error $message');
      },
    );
  }

  static loadAds(VoidCallback onComplete) {
    final String placementID = Platform.isAndroid
        ? const String.fromEnvironment("REWARDED_ADS_PLACEMENT_ANDROID")
        : const String.fromEnvironment("REWARDED_ADS_PLACEMENT_IOS");

    UnityAds.load(
      placementId: placementID,
      onComplete: (placementId) {
        debugPrint('Load Ads');
        onComplete();
      },
      onFailed: (placementId, error, message) {
        debugPrint(message);
        onComplete();
      },
    );
  }

  static showAds(
    VoidCallback onComplete,
  ) {
    final String placementID = Platform.isAndroid
        ? const String.fromEnvironment("REWARDED_ADS_PLACEMENT_ANDROID")
        : const String.fromEnvironment("REWARDED_ADS_PLACEMENT_IOS");

    UnityAds.showVideoAd(
      placementId: placementID,
      onComplete: (placementId) {
        onComplete();
      },
      onFailed: (placementId, error, message) {
        debugPrint(message);
        onComplete();
      },
    );
  }

  static Widget bannerAds() {
    final String placementID = Platform.isAndroid
        ? const String.fromEnvironment("BANNER_ADS_PLACEMENT_ANDROID")
        : const String.fromEnvironment("BANNER_ADS_PLACEMENT_IOS");

    return UnityBannerAd(
      placementId: placementID,
    );
  }
}
