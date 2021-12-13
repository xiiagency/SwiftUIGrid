import SwiftUI

/**
 Defines an optionally named font face with a specific weight, allowing it to be converted to a `Font` or an `NSAttributedString`.
 
 An application can define its custom fonts as extensions to this struct, for example:
   ```
   extension FontFace {
     static let MyCustomFont = FontFace(name: "MyCustomFont", weight: .light)
     static let MySystemFont = FontFace(weight: .light)
   }
   ```
 */
public struct FontFace : Hashable {
  /**
   The optional name of the font face. System fonts will be used if no name provided.
   */
  public let name: String?
  
  /**
   The weight of the font.
   */
  public let weight: Font.Weight
  
  /**
   The design of the font.
   */
  public let design: Font.Design
  
  /**
   Initializes a new `FontFace` with optional font name and weight.
   */
  public init(
    name: String? = nil,
    weight: Font.Weight = .regular,
    design: Font.Design = .default
  ) {
    self.name = name
    self.weight = weight
    self.design = design
  }
  
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
  
  /**
   Converts to a system or custom `Font` with a specific provided size.
   */
  public func toFont(size: CGFloat) -> Font {
    if let name = name {
      return Font.custom(name, size: size).weight(weight)
    } else {
      return Font.system(size: size, weight: weight, design: design)
    }
  }
  
  /**
   Converts to a `Font` with a specific provided size, taken from a raw value of an enum.
   */
  public func toFont<Size : RawRepresentable>(size: Size) -> Font where Size.RawValue == CGFloat {
    toFont(size: size.rawValue)
  }
}

extension View {
  /**
   Applies the given font face/size styling to the View.
   */
  public func withFont(face: FontFace, size: CGFloat) -> some View {
    font(face.toFont(size: size))
  }
  
  /**
   Applies the given font face/size styling to the View.
   */
  public func withFont<Size : RawRepresentable>(
    face: FontFace,
    size: Size
  ) -> some View where Size.RawValue == CGFloat {
    withFont(face: face, size: size.rawValue)
  }

  /**
   Applies the given font face/size styling to the View as smallCaps.
   */
  public func smallCaps(face: FontFace, size: CGFloat) -> some View {
    font(face.toFont(size: size).smallCaps())
  }

  /**
   Applies the given font face/size styling to the View as smallCaps.
   */
  public func smallCaps<Size : RawRepresentable>(
    face: FontFace,
    size: Size
  ) -> some View where Size.RawValue == CGFloat {
    font(face.toFont(size: size.rawValue).smallCaps())
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
