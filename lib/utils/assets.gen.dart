/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/crypto
  $AssetsImagesCryptoGen get crypto => const $AssetsImagesCryptoGen();
}

class $AssetsImagesCryptoGen {
  const $AssetsImagesCryptoGen();

  /// File path: assets/images/crypto/bitcoin.png
  AssetGenImage get bitcoin =>
      const AssetGenImage('assets/images/crypto/bitcoin.png');

  /// File path: assets/images/crypto/chainlink.png
  AssetGenImage get chainlink =>
      const AssetGenImage('assets/images/crypto/chainlink.png');

  /// File path: assets/images/crypto/ethereum.png
  AssetGenImage get ethereum =>
      const AssetGenImage('assets/images/crypto/ethereum.png');

  /// File path: assets/images/crypto/tether.png
  AssetGenImage get tether =>
      const AssetGenImage('assets/images/crypto/tether.png');

  /// File path: assets/images/crypto/usd_coin.png
  AssetGenImage get usdCoin =>
      const AssetGenImage('assets/images/crypto/usd_coin.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bitcoin, chainlink, ethereum, tether, usdCoin];
}

class MonnAssets {
  MonnAssets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
