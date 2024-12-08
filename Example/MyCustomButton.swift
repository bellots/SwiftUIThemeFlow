//
//  MyCustomButton.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

enum MyCustomButton: String, Theme, ThemeWrapper, CaseIterable {
    case defaultButton
    case roundedButton
    
    
    private func commonStyle<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> any View {
        
        return view.padding(10)
            .foregroundColor(.white)
            .font(.headline)
    }
        
    private func color(for colorScheme: ColorScheme) -> Color {
        switch self {
        case .defaultButton:
            return colorScheme == .light ? .blue : .pink
        case .roundedButton:
            return colorScheme == .light ? .red : .green
        }
    }
    
    private var isRounded: Bool {
        switch self {
        case .defaultButton:
            return false
        case .roundedButton:
            return true
        }
    }
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> any View {
        return commonStyle(to: view, colorScheme: colorScheme, palette: palette)
            .background(color(for: colorScheme))
            .cornerRadius(isRounded ? 20 : 0)
    }
    
    func apply<V>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView where V : View {
        return AnyView(customStyle(to: view, colorScheme: colorScheme, palette: palette))
    }

}
