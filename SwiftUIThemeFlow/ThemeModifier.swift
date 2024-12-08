//
//  ThemeModifier.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public struct ThemeModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme // Access the color scheme directly
    var theme: any Theme
    var palette: any Palette
    
    @ViewBuilder
    public func body(content: Content) -> some View {
        theme.apply(to: content, colorScheme: colorScheme, palette: palette)
    }
}

