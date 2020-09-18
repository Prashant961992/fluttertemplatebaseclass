export 'main.dart';
export 'routes.dart';

//packages
export 'package:flutter/material.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:shared_preferences/shared_preferences.dart';

// export 'package:fluttertoast/fluttertoast.dart';
export 'dart:convert';
export 'package:connectivity/connectivity.dart';
export 'package:lottie/lottie.dart';

// base Class
export './baseClass/base_bloc.dart';
export './baseClass/base_view.dart';

// Bloc
export './bloc/login_bloc.dart';
export './bloc/home_bloc.dart';

// localization
export './localization/app_localizations.dart';

// models
export 'models/login/login_request.dart';
export 'models/login/login_response.dart';

// network
export './network/api_provider.dart';

// repository
export './repository/authentication_repository.dart';
export './repository/login_repository.dart';
export './repository/shared_preference_repository.dart';

// utils
export './utils/app_manager.dart';
export './utils/colors.dart';
export './utils/commons.dart';
export './utils/dimensions.dart';
export './utils/styles.dart';
export './utils/images.dart';
export './utils/decorations.dart';
export './utils/gradients.dart';
export './utils/shadows.dart';
export './utils/validator.dart';

//custom widgets
export './widgets/custom_dialog.dart';
export './widgets/cutom_icon_button.dart';
export './widgets/custom_textformfield.dart';
export './widgets/custom_card.dart';
export './widgets/custom_raised_button.dart';
export './widgets/custom_flat_button.dart';
export './widgets/custompassword_textformfield.dart';
export './widgets/empty_widgets.dart';
export './widgets/network_image_widgets.dart';
export './widgets/custom_pull__to_refresh.dart';

//Screens
export './screens/splash_screen.dart';
export './screens/login_screen.dart';
export './screens/home_screen.dart';
export './screens/forgot_password_screen.dart';