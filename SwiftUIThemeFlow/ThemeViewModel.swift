//
//  ThemeViewModel.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

@MainActor public class ThemeViewModel: ObservableObject {
    @Published var currentColorScheme: ColorScheme = .light
}
