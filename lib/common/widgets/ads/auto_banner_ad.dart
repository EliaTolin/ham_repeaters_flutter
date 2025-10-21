import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_radioamatori/common/widgets/ads/controller/auto_banner_controller.dart';

class AutoBannerAd extends HookConsumerWidget {
  const AutoBannerAd({required this.adSize, super.key});

  final AdSize adSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uniqueKey = useMemoized(UniqueKey.new);
    return SafeArea(
      child: ref
          .watch(autoBannerControllerProvider(adSize, uniqueKey))
          .when(
            loading: () => const SizedBox.shrink(),
            error: (error, _) => const SizedBox.shrink(),
            data: (banner) {
              if (banner != null) {
                return SizedBox(
                  width: banner.size.width.toDouble(),
                  height: banner.size.height.toDouble(),
                  child: AdWidget(ad: banner),
                );
              }
              return const SizedBox.shrink();
            },
          ),
    );
  }
}
