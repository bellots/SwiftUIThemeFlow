//
//  MyCustomTheme.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//
import SwiftUI

enum MyCustomTheme: String, Theme, ThemeWrapper, CaseIterable {
    case primitiveTitle
    case primitiveBoldTitle
    case primitiveBoldTitleRounded
    case primitiveItalicTitleStroke
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> any View {
        switch self {
        case .primitiveTitle:
            return view.foregroundColor(palette.primary.color(colorScheme: colorScheme))
        case .primitiveBoldTitle:
            return MyCustomTheme.primitiveTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .font(.largeTitle)
                .padding(5)
                .background(colorScheme == .light ? Color.green : Color.blue)
                .bold()
        case .primitiveBoldTitleRounded:
            return MyCustomTheme.primitiveBoldTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .cornerRadius(10)
        case .primitiveItalicTitleStroke:
            return MyCustomTheme.primitiveTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .padding(5)
                .background(Rectangle().stroke(Color.red))
        }
    }

    func apply<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView {
        return AnyView(customStyle(to: view, colorScheme: colorScheme, palette: palette))
    }
}
