import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:flutter_banking/widgets/forgot-password-change-password.dart';
import 'package:flutter_banking/widgets/forgot-password-confirmation.dart';
import 'package:flutter_banking/widgets/forgot-password-otp-verification.dart';
import 'package:flutter_banking/widgets/forgot-password.dart';
import 'package:flutter_banking/widgets/forgot-username-confirmation.dart';
import 'package:flutter_banking/widgets/forgot-username.dart';
import 'package:flutter_banking/widgets/login-form.dart';
import 'package:flutter_banking/widgets/sign-in-link.dart';
import 'package:flutter_banking/widgets/sign-up-link.dart';
import 'package:flutter_banking/widgets/user-registration-account.dart';
import 'package:flutter_banking/widgets/user-registration-confirmation.dart';
import 'package:flutter_banking/widgets/user-registration-customer.dart';

class StartupScreenProvider {
  static Widget getBottomLink(StartupScreenMode startupScreenMode) {
    Widget _widget;
    switch (startupScreenMode) {
      case StartupScreenMode.SINGUP1OF3:
        _widget = Column(
          children: <Widget>[SigninLink()],
        );
        break;
      case StartupScreenMode.SINGUP2OF3:
        _widget = Column(
          children: <Widget>[SigninLink()],
        );
        break;
      case StartupScreenMode.LOGIN:
        _widget = Column(
          children: <Widget>[SignupLink()],
        );
        break;

      default:
        _widget = SizedBox(
          height: 10,
        );
    }
    return _widget;
  }

  static Widget get(StartupScreenMode startupScreenMode) {
    Widget _widget;
    switch (startupScreenMode) {
      case StartupScreenMode.SINGUP1OF3:
        _widget = Column(
          children: <Widget>[RegistrationAccountForm()],
        );
        break;
      case StartupScreenMode.SINGUP2OF3:
        _widget = Column(
          children: <Widget>[RegistrationCustomerForm()],
        );
        break;
      case StartupScreenMode.SINGUP3OF3:
        _widget = Column(
          children: <Widget>[RegistrationConfirmationForm()],
        );
        break;
      case StartupScreenMode.FORGOTUSERNAME:
        _widget = Column(
          children: <Widget>[ForgotUserName()],
        );
        break;

      case StartupScreenMode.FORGOTUSERNAMECONFIRMATION:
        _widget = Column(
          children: <Widget>[ForgotUsernameConfirmationForm()],
        );
        break;
      case StartupScreenMode.FORGOTPASSWORD:
        _widget = Column(
          children: <Widget>[ForgotPassword()],
        );
        break;

      case StartupScreenMode.FORGOTPASSWORDPINVERIFICATION:
        _widget = Column(
          children: <Widget>[ForgotPasswordOTPVerification()],
        );
        break;

      case StartupScreenMode.FORGOTPASSWORDCHANGEPASSWORD:
        _widget = Column(
          children: <Widget>[ForgotPasswordChangePassword()],
        );
        break;

      case StartupScreenMode.FORGOTPASSWORDCONFIRMATION:
        _widget = Column(
          children: <Widget>[ForgotPasswordConfirmationForm()],
        );
        break;

      default:
        _widget = Column(
          children: <Widget>[LoginForm()],
        );
    }
    return _widget;
  }
}
