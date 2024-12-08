//
//  Theme+Extensions.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public protocol ThemeWrapper: Theme {
    func applyThemeWrapper<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView
}

public struct ThemeWrapperModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    // Access the color scheme directly
    var theme: any ThemeWrapper
    var palette: any Palette
    @ViewBuilder
    public func body(content: Content) -> some View {
        theme.applyThemeWrapper(to: content, colorScheme: colorScheme, palette: palette)
    }
}

public extension View {
    func style(_ theme: any ThemeWrapper, palette: Palette) -> some View {
        self.modifier(ThemeWrapperModifier(theme: theme, palette: palette))
    }
}

extension Theme where Self: ThemeWrapper {
    func applyThemeWrapper<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView {
        apply(to: view, colorScheme: colorScheme, palette: palette)
    }
}
