//
//  View+Extensions.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public extension View {
    func themeable(_ theme: any Theme, palette: any Palette) -> some View {
        self.modifier(ThemeModifier(theme: theme, palette: palette))
    }
}

