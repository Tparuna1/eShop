// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizedStrings {
  internal enum LogIn {
    internal enum Button {
      /// Sign In
      internal static let signIn = LocalizedStrings.tr("localizable", "log_In.button.sign_in", fallback: "Sign In")
      /// Sign Up
      internal static let signUp = LocalizedStrings.tr("localizable", "log_In.button.sign_up", fallback: "Sign Up")
    }
    internal enum Text {
      /// Email adress
      internal static let emaisAddress = LocalizedStrings.tr("localizable", "log_In.text.emais_address", fallback: "Email adress")
      /// Password
      internal static let password = LocalizedStrings.tr("localizable", "log_In.text.password", fallback: "Password")
      /// name@example.com
      internal static let sampleEmaisAddress = LocalizedStrings.tr("localizable", "log_In.text.sample_emais_address", fallback: "name@example.com")
      /// Enter password
      internal static let samplePassword = LocalizedStrings.tr("localizable", "log_In.text.sample_password", fallback: "Enter password")
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
