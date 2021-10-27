import SwiftUI

/**
 Defines a named font face with a specific weight, allowing it to be converted to a `Font` or an `NSAttributedString`.
 
 An application can define its custom fonts as extensions to this struct, for example:
   ```
   extension FontFace {
     static let MyCustomFont = FontFace(name: "MyCustomFont", weight: .light)
   }
   ```
 */
public struct FontFace : Hashable {
  /**
   The name of the font face.
   */
  public let name: String
  
  /**
   The weight of the font.
   */
  public let weight: Font.Weight
  
  /**
   Initializes a new `FontFace` with a provided font name and optionally specifying the weight.
   */
  public init(name: String, weight: Font.Weight = .regular) {
    self.name = name
    self.weight = weight
  }
  
  /**
   Converts the font to a NSAttributesString.Key map, with a specific size.
   */
  public func toAttributes(size: CGFloat) -> [NSAttributedString.Key : UIFont] {
    [NSAttributedString.Key.font : UIFont(name: name, size: size)!]
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
   Converts to a `Font` with a specific provided size.
   */
  public func toFont(size: CGFloat) -> Font {
    Font.custom(name, size: size)
      .weight(weight)
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
}
