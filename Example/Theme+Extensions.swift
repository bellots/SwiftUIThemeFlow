//
//  Theme+Extensions.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI
import SwiftUIThemeFlow

public protocol ThemeWrapper: Theme {
    func applyThemeWrapper<V: View>(to view: V, colorScheme: ColorScheme) -> AnyView
}

public struct ThemeWrapperModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme // Access the color scheme directly
    var theme: any ThemeWrapper

    @ViewBuilder
    public func body(content: Content) -> some View {
        theme.applyThemeWrapper(to: content, colorScheme: colorScheme)
    }
}

public extension View {
    func style(_ theme: any ThemeWrapper) -> some View {
        self.modifier(ThemeWrapperModifier(theme: theme))
    }
}

extension Theme where Self: ThemeWrapper {
    func applyThemeWrapper<V: View>(to view: V, colorScheme: ColorScheme) -> AnyView {
        apply(to: view, colorScheme: colorScheme)
    }
}
