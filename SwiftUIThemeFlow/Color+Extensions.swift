//
//  Color+Extensions.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public extension Tint {
    func color(colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light:
            return light
        case .dark:
            return dark
        @unknown default:
            return light
        }
    }
}
