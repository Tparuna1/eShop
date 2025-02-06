// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizedStrings {
  internal enum LsignIn {
    internal enum Button {
      /// Already have an account? Sign In
      internal static let alreadyHaveAnAccountSignIn = LocalizedStrings.tr("localizable", "lsign_in.button.already_have_an_account_sign_in", fallback: "Already have an account? Sign In")
    }
  }
  internal enum Onboarding {
    internal enum Button {
      /// Get Started
      internal static let getStarted = LocalizedStrings.tr("localizable", "onboarding.button.get_started", fallback: "Get Started")
      /// Next
      internal static let next = LocalizedStrings.tr("localizable", "onboarding.button.next", fallback: "Next")
      /// Skip
      internal static let skip = LocalizedStrings.tr("localizable", "onboarding.button.skip", fallback: "Skip")
    }
    internal enum Text {
      /// Create account
      internal static let createAcount = LocalizedStrings.tr("localizable", "onboarding.text.create_acount", fallback: "Create account")
      /// Enjoy a smooth and secure shopping experience
      internal static let enjoyWithShopping = LocalizedStrings.tr("localizable", "onboarding.text.enjoy_with_shopping", fallback: "Enjoy a smooth and secure shopping experience")
      /// Fast & Secure
      internal static let fastSecure = LocalizedStrings.tr("localizable", "onboarding.text.fast_secure", fallback: "Fast & Secure")
      /// Find your favourite clothes with us
      internal static let findYourFavClothes = LocalizedStrings.tr("localizable", "onboarding.text.find_your_fav_clothes", fallback: "Find your favourite clothes with us")
      /// Localizable.strings
      ///   eShop
      /// 
      ///   Created by tornike <parunashvili on 30.01.25.
      internal static let welcomeMessage = LocalizedStrings.tr("localizable", "onboarding.text.welcome_message", fallback: "Welcome to eShop")
    }
  }
  internal enum SignIn {
    internal enum Button {
      /// Do not have an acount? Sign Up
      internal static let doNotHaveAnAccountSignUp = LocalizedStrings.tr("localizable", "sign_in.button.do_not_have_an_account_sign_up", fallback: "Do not have an acount? Sign Up")
      /// Sign In
      internal static let signIn = LocalizedStrings.tr("localizable", "sign_in.button.sign_in", fallback: "Sign In")
      /// Sign Up
      internal static let signUp = LocalizedStrings.tr("localizable", "sign_in.button.sign_up", fallback: "Sign Up")
    }
    internal enum Text {
      /// Confirm Password
      internal static let confirmPassword = LocalizedStrings.tr("localizable", "sign_in.text.confirm_password", fallback: "Confirm Password")
      /// Email adress
      internal static let emailAddress = LocalizedStrings.tr("localizable", "sign_in.text.email_address", fallback: "Email adress")
      /// Full Name
      internal static let fullName = LocalizedStrings.tr("localizable", "sign_in.text.full_name", fallback: "Full Name")
      /// Password
      internal static let password = LocalizedStrings.tr("localizable", "sign_in.text.password", fallback: "Password")
      /// Re-enter your password
      internal static let sampleConfirmPassword = LocalizedStrings.tr("localizable", "sign_in.text.sample_confirm_password", fallback: "Re-enter your password")
      /// name@example.com
      internal static let sampleEmailAddress = LocalizedStrings.tr("localizable", "sign_in.text.sample_email_address", fallback: "name@example.com")
      /// John Doe
      internal static let sampleFullName = LocalizedStrings.tr("localizable", "sign_in.text.sample_full_name", fallback: "John Doe")
      /// Enter password
      internal static let samplePassword = LocalizedStrings.tr("localizable", "sign_in.text.sample_password", fallback: "Enter password")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension LocalizedStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
