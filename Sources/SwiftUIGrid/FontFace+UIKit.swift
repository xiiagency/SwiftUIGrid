#if !os(macOS)

import SwiftUI
import UIKit


extension FontFace {
  /**
   Converts the font to a NSAttributesString.Key map, with a specific size.
   */
  public func toAttributes(size: CGFloat) -> [NSAttributedString.Key : UIFont] {
    if let name = name {
      return [NSAttributedString.Key.font : UIFont(name: name, size: size)!]
    } else {
      return [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: size, weight: weight.uiFontWeight)
      ]
    }
  }
  
  /**
   Converts the font to a NSAttributesString.Key map, with a specific size taken from a raw value of an enum.
   */
  public func toAttributes<Size : RawRepresentable>(
    size: Size
  ) -> [NSAttributedString.Key : UIFont] where Size.RawValue == CGFloat {
    toAttributes(size: size.rawValue)
  }
}

private extension Font.Weight {
  /**
   Convert `Font.Weight` to `UIFont.Weight`
   */
  var uiFontWeight: UIFont.Weight {
    switch self {
    case .ultraLight:
      return .ultraLight
    case .thin:
      return .thin
    case .light:
      return .light
    case .regular:
      return .regular
    case .medium:
      return .medium
    case .semibold:
      return .semibold
    case .bold:
      return .bold
    case .heavy:
      return .heavy
    case .black:
      return .black
    default:
      return .regular
    }
  }
}
#endif
