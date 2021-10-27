import SwiftUI

extension View {
  /**
   Applies the given font face/size styling to the View but allows for the font size to be animatable.
   */
  public func withAnimatedFont(face: FontFace, size: CGFloat) -> some View {
    modifier(AnimatingFontModifier(fontFace: face, fontSize: size))
  }
  
  /**
   Applies the given font face/size styling to the View but allows for the font size (taken from an enum raw value) to be animatable.
   */
  public func withAnimatedFont<Size : RawRepresentable>(
    face: FontFace,
    size: Size
  ) -> some View where Size.RawValue == CGFloat {
    withAnimatedFont(face: face, size: size.rawValue)
  }
}

/**
 Modifies the font size through an AnimatableModifier so that it can be animated.
 */
private struct AnimatingFontModifier: AnimatableModifier {
  /**
   The font to be used.
   */
  let fontFace: FontFace
  
  /**
   The current size of the font.
   */
  private(set) var fontSize: CGFloat
  
  /**
   Provides the ability to get/set the animated font size.
   */
  var animatableData: CGFloat {
    get { fontSize }
    set { fontSize = newValue }
  }
  
  public func body(content: Self.Content) -> some View {
    content
      .animation(.none, value: fontSize) // Stops text from moving around when text changes
      .font(
        .custom(fontFace.name, size: fontSize)
          .weight(fontFace.weight)
      )
  }
}
