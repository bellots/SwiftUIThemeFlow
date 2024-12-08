//
//  ThemeViewModel.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

@MainActor public class ThemeViewModel: ObservableObject {
    @Published public var palette: Palette
    
    public init(palette: Palette) {
        self.palette = palette
    }
}
