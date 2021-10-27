import SwiftUI

extension View {
  /**
   Sets the padding in each directions to the provided values.
   If a specific direction value is not provided, it is assumed to be `0.0`.
   */
  public func padding(
    top: CGFloat = 0.0,
    trailing: CGFloat = 0.0,
    bottom: CGFloat = 0.0,
    leading: CGFloat = 0.0
  ) -> some View{
    padding(
      EdgeInsets(
        top: top,
        leading: leading,
        bottom: bottom,
        trailing: trailing
      )
    )
  }
  
  /**
   A variant of padding(top:trailing:bottom:leading) that sets vertical/horizontal padding.
   */
  public func padding(vertical: CGFloat = 0.0, horizontal: CGFloat = 0.0) -> some View {
    padding(
      top: vertical,
      trailing: horizontal,
      bottom: vertical,
      leading: horizontal
    )
  }

  /**
   Resets a View's padding to the system calculated default values.
   */
  public func systemPadding() -> some View {
    padding(.all, nil)
  }
}
