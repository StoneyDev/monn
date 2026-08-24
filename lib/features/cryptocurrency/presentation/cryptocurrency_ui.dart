import 'package:flutter/material.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/assets.gen.dart';

extension CryptoTypeUI on CryptoType {
  Color get color => switch (this) {
    CryptoType.bitcoin => AppColors.btc,
    CryptoType.ethereum => AppColors.eth,
    CryptoType.chainlink => AppColors.link,
    CryptoType.tether => AppColors.usdt,
    CryptoType.usdCoin => AppColors.usdc,
  };

  ImageProvider<Object> logo() => switch (this) {
    CryptoType.bitcoin => MonnAssets.images.crypto.bitcoin.provider(),
    CryptoType.ethereum => MonnAssets.images.crypto.ethereum.provider(),
    CryptoType.chainlink => MonnAssets.images.crypto.chainlink.provider(),
    CryptoType.tether => MonnAssets.images.crypto.tether.provider(),
    CryptoType.usdCoin => MonnAssets.images.crypto.usdCoin.provider(),
  };
}
