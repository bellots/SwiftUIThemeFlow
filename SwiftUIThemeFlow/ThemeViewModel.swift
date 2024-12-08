//
//  ThemeViewModel.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

@MainActor public class ThemeViewModel: ObservableObject {
    
    var themes: [any Theme] = []
    
    public init(themes: [any Theme]) {
        self.themes = themes
    }
    
    public func register(theme: any Theme) {
        themes.append(theme)
    }
}
