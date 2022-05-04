# SwiftUIGrid Library

[![GitHub](https://img.shields.io/github/license/xiiagency/SwiftUIGrid?style=for-the-badge)](./LICENSE)

An open source library that provides extensions to SwiftUI libraries to enable spacing/font grids and other advanced utilities.

Developed as re-usable components for various projects at
[XII's](https://github.com/xiiagency) iOS, macOS, and watchOS applications.

## Installation

### Swift Package Manager

1. In Xcode, select File > Swift Packages > Add Package Dependency.
2. Follow the prompts using the URL for this repository
3. Select the `SwiftUIGrid` library to add to your project

## Dependencies

- [xiiagency/SwiftFoundationExtensions](https://github.com/xiiagency/SwiftFoundationExtensions)

## License

See the [LICENSE](LICENSE) file.

## Padding extensions ([Source](Sources/SwiftUIGrid/Spacing.swift))

```Swift
extension View {
  func padding(
    top: CGFloat = 0.0,
    trailing: CGFloat = 0.0,
    bottom: CGFloat = 0.0,
    leading: CGFloat = 0.0
  ) -> some View
}
```

Sets the padding in each directions to the provided values. If a specific direction value is not provided, it is assumed to be `0.0`.

---

```Swift
extension View {
  func padding(
    vertical: CGFloat = 0.0,
    horizontal: CGFloat = 0.0
  ) -> some View
}
```

A variant of `padding(top:trailing:bottom:leading)` that sets vertical/horizontal padding.

---

```Swift
extension View {
  func systemPadding() -> some View
}
```

Resets a `View`'s padding to the system calculated default values.

## Structure font definitions ([Source](Sources/SwiftUIGrid/FontFace.swift))

```Swift
struct FontFace : Hashable {
  let name: String?
  
  let weight: Font.Weight
  
  let design: Font.Design
  
  init(
    name: String? = nil,
    weight: Font.Weight = .regular,
    design: Font.Design = .default
  )
  
  func toFont(size: CGFloat) -> Font
  
  func toFont<Size : RawRepresentable>(size: Size) -> Font
    where Size.RawValue == CGFloat
}
```

Defines an optionally named font face with a specific weight, allowing it to be converted to a `Font` or an `NSAttributedString`.
 
An application can define its custom fonts as extensions to this struct, for example:

```Swift
extension FontFace {
  static let MyCustomFont = FontFace(name: "MyCustomFont", weight: .light)
  static let MySystemFont = FontFace(weight: .light)
}
```

### `FontFace` attributes support on `iOS`

```Swift
extension FontFace {
  func toAttributes(size: CGFloat) -> [NSAttributedString.Key : UIFont]
  
  func toAttributes<Size : RawRepresentable>(
    size: Size
  ) -> [NSAttributedString.Key : UIFont] where Size.RawValue == CGFloat
}
```

### `FontFace` attributes support on `macOS`

```Swift
extension FontFace {
  func toAttributes(size: CGFloat) -> [NSAttributedString.Key : NSFont]
  
  func toAttributes<Size : RawRepresentable>(
    size: Size
  ) -> [NSAttributedString.Key : NSFont] where Size.RawValue == CGFloat
}
```

## Animating `FontFace` size ([Source](Sources/SwiftUIGrid/AnimatedFontSizeModifier.swift))

```Swift
extension View {
  func withAnimatedFont(
    face: FontFace,
    size: CGFloat
  ) -> some View
}
```

Applies the given font face/size styling to the View but allows for the font size to be animatable.

---

```Swift
extension View {
  func withAnimatedFont<Size : RawRepresentable>(
    face: FontFace,
    size: Size
  ) -> some View where Size.RawValue == CGFloat
}
```

Applies the given font face/size styling to the `View` but allows for the font size (taken from an enum raw value) to be animatable.