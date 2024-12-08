//
//  ThemeViewModel.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

@MainActor public class ThemeViewModel: ObservableObject {
    @Published public var currentColorScheme: ColorScheme = .light
    
    var themes: [any Theme] = []
    
    public init(themes: [any Theme]) {
        self.themes = themes
    }
    
    public func register(theme: any Theme) {
        themes.append(theme)
    }
    
   public func updateTheme(for colorScheme: ColorScheme) {
        self.currentColorScheme = colorScheme
        // Update the theme based on the color scheme if needed
        // Here, you could switch themes based on the colorScheme if needed
    }
}

protocol Themeable {}

public protocol Theme {
    func apply<V: View>(to view: V, colorScheme: ColorScheme) -> AnyView
}

//public struct ThemeModifier: ViewModifier {
//    @EnvironmentObject var viewModel: ThemeViewModel
//    var theme: Theme
//    
//    public func body(content: Content) -> some View {
//        theme.apply(to: content)
//    }
//}

public struct ThemeModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme // Access the color scheme directly
    var theme: any Theme

    @ViewBuilder
    public func body(content: Content) -> some View {
        theme.apply(to: content, colorScheme: colorScheme)
    }
}

public extension View {
    func themeable(_ theme: any Theme) -> some View {
        self.modifier(ThemeModifier(theme: theme))
    }
}

public struct Tint {
    public let light: Color
    public let dark: Color
    
    public init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }
    
    public init(color: Color) {
        self.light = color
        self.dark = color
    }
}




//Text("asd")
//    .themeable(.primaryTitle)
