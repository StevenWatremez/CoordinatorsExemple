// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit
import CoordinatorsExemple

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum AuthenticationViewController: String, StoryboardSceneType {
    static let storyboardName = "AuthenticationViewController"

    static func initialViewController() -> CoordinatorsExemple.AuthenticationViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.AuthenticationViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case authenticationViewControllerScene = "AuthenticationViewController"
    static func instantiateAuthenticationViewController() -> CoordinatorsExemple.AuthenticationViewController {
      guard let vc = StoryboardScene.AuthenticationViewController.authenticationViewControllerScene.viewController() as? CoordinatorsExemple.AuthenticationViewController
      else {
        fatalError("ViewController 'AuthenticationViewController' is not of the expected class CoordinatorsExemple.AuthenticationViewController.")
      }
      return vc
    }
  }
  enum FirstDetailViewController: String, StoryboardSceneType {
    static let storyboardName = "FirstDetailViewController"

    static func initialViewController() -> CoordinatorsExemple.FirstDetailViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.FirstDetailViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case firstDetailViewControllerScene = "FirstDetailViewController"
    static func instantiateFirstDetailViewController() -> CoordinatorsExemple.FirstDetailViewController {
      guard let vc = StoryboardScene.FirstDetailViewController.firstDetailViewControllerScene.viewController() as? CoordinatorsExemple.FirstDetailViewController
      else {
        fatalError("ViewController 'FirstDetailViewController' is not of the expected class CoordinatorsExemple.FirstDetailViewController.")
      }
      return vc
    }
  }
  enum FirstTabViewController: String, StoryboardSceneType {
    static let storyboardName = "FirstTabViewController"

    static func initialViewController() -> CoordinatorsExemple.FirstTabViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.FirstTabViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case firstTabViewControllerScene = "FirstTabViewController"
    static func instantiateFirstTabViewController() -> CoordinatorsExemple.FirstTabViewController {
      guard let vc = StoryboardScene.FirstTabViewController.firstTabViewControllerScene.viewController() as? CoordinatorsExemple.FirstTabViewController
      else {
        fatalError("ViewController 'FirstTabViewController' is not of the expected class CoordinatorsExemple.FirstTabViewController.")
      }
      return vc
    }
  }
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum SecondDetailViewController: String, StoryboardSceneType {
    static let storyboardName = "SecondDetailViewController"

    static func initialViewController() -> CoordinatorsExemple.SecondDetailViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.SecondDetailViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case secondDetailViewControllerScene = "SecondDetailViewController"
    static func instantiateSecondDetailViewController() -> CoordinatorsExemple.SecondDetailViewController {
      guard let vc = StoryboardScene.SecondDetailViewController.secondDetailViewControllerScene.viewController() as? CoordinatorsExemple.SecondDetailViewController
      else {
        fatalError("ViewController 'SecondDetailViewController' is not of the expected class CoordinatorsExemple.SecondDetailViewController.")
      }
      return vc
    }
  }
  enum SecondTabViewController: String, StoryboardSceneType {
    static let storyboardName = "SecondTabViewController"

    static func initialViewController() -> CoordinatorsExemple.SecondTabViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.SecondTabViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case secondTabViewControllerScene = "SecondTabViewController"
    static func instantiateSecondTabViewController() -> CoordinatorsExemple.SecondTabViewController {
      guard let vc = StoryboardScene.SecondTabViewController.secondTabViewControllerScene.viewController() as? CoordinatorsExemple.SecondTabViewController
      else {
        fatalError("ViewController 'SecondTabViewController' is not of the expected class CoordinatorsExemple.SecondTabViewController.")
      }
      return vc
    }
  }
  enum SplashViewController: String, StoryboardSceneType {
    static let storyboardName = "SplashViewController"

    static func initialViewController() -> CoordinatorsExemple.SplashViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CoordinatorsExemple.SplashViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case splashViewControllerScene = "SplashViewController"
    static func instantiateSplashViewController() -> CoordinatorsExemple.SplashViewController {
      guard let vc = StoryboardScene.SplashViewController.splashViewControllerScene.viewController() as? CoordinatorsExemple.SplashViewController
      else {
        fatalError("ViewController 'SplashViewController' is not of the expected class CoordinatorsExemple.SplashViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}
