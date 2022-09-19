/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************
import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Tajawal-Black.ttf
  String get tajawalBlack => 'assets/fonts/Tajawal-Black.ttf';

  /// File path: assets/fonts/Tajawal-Bold.ttf
  String get tajawalBold => 'assets/fonts/Tajawal-Bold.ttf';

  /// File path: assets/fonts/Tajawal-ExtraBold.ttf
  String get tajawalExtraBold => 'assets/fonts/Tajawal-ExtraBold.ttf';

  /// File path: assets/fonts/Tajawal-ExtraLight.ttf
  String get tajawalExtraLight => 'assets/fonts/Tajawal-ExtraLight.ttf';

  /// File path: assets/fonts/Tajawal-Light.ttf
  String get tajawalLight => 'assets/fonts/Tajawal-Light.ttf';

  /// File path: assets/fonts/Tajawal-Medium.ttf
  String get tajawalMedium => 'assets/fonts/Tajawal-Medium.ttf';

  /// File path: assets/fonts/Tajawal-Regular.ttf
  String get tajawalRegular => 'assets/fonts/Tajawal-Regular.ttf';
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

  String get path => _assetName;

  String get keyName => _assetName;
}
