import 'package:flutter/material.dart';

import 'ColorCodes.dart';

class Shap {
  BoxDecoration baseBackgroundDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.inputCornerColor,
      ),
      color: AppColors.inputColor,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    );
  }

  BoxDecoration roundBackgroundDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.grayColor99,
      ),
      color: AppColors.whiteColor,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(7.0)),
    );
  }
  BoxDecoration roundLiteBackgroundDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.grayColor99.withOpacity(0.2),
      ),
      color: AppColors.whiteColor,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(7.0)),
    );
  }
  BoxDecoration roundWhiteBackground() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.whiteColor,
      ),
      color: AppColors.whiteColor,
      shape: BoxShape.circle,

    );
  }
}
