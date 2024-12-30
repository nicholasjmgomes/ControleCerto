import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin IsLoading {
  final ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);

  final RxBool _isLoading = RxBool(false);

  bool get isLoading => _isLoading.value;
  bool get isNotLoading => !(_isLoading.value);

  set isLoading(bool value) => _isLoading.value = value;

  final ValueNotifier<bool> _isOpaqueLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isOpaqueLoading => _isOpaqueLoading;
  void setIsOpaqueLoading(bool value) => _isOpaqueLoading.value = value;

  void clearIsLoading() => _isLoading.value = false;

  final RxBool _isLoadingImage = RxBool(false);

  bool get isLoadingImage => _isLoadingImage.value;
  bool get isNotLoadingImage => !(_isLoadingImage.value);

  set isLoadingImage(bool value) => _isLoadingImage.value = value;

  void clearIsLoadingImage() => _isLoadingImage.value = false;
}
//isloadingPage
//isLoadingData