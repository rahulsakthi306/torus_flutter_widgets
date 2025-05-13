// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdBannerWidget extends StatefulWidget {
//   final String adUnitId;

//   const AdBannerWidget({
//     super.key,
//     this.adUnitId = 'ca-app-pub-3940256099942544/6300978111',
//   });

//   @override
//   State<AdBannerWidget> createState() => _AdBannerWidgetState();
// }

// class _AdBannerWidgetState extends State<AdBannerWidget> {
//   BannerAd? _bannerAd;
//   bool _isAdLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//   }

//   void _loadBannerAd() {
//     final banner = BannerAd(
//       adUnitId: widget.adUnitId,
//       size: AdSize.banner,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           if (mounted) {
//             setState(() {
//               _isAdLoaded = true;
//               _bannerAd = ad as BannerAd;
//             });
//           }
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           debugPrint('Ad load failed (code=${error.code}): ${error.message}');
//           ad.dispose();
//         },
//       ),
//     );

//     banner.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isAdLoaded || _bannerAd == null) {
//       return const SizedBox.shrink(); // Avoid layout jumps
//     }

//     return Container(
//       alignment: Alignment.center,
//       width: _bannerAd!.size.width.toDouble(),
//       height: _bannerAd!.size.height.toDouble(),
//       child: AdWidget(ad: _bannerAd!),
//     );
//   }

//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
// }
