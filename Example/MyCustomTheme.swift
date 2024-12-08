//
//  MyCustomTheme.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//
import SwiftUI
import SwiftUIThemeFlow

enum MyCustomTheme: String, Theme, ThemeWrapper, CaseIterable {
    case primitiveTitle
    case primitiveBoldTitle
    case primitiveBoldTitleRounded
    case primitiveItalicTitleStroke
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme) -> any View {
        switch self {
        case .primitiveTitle:
            return view.foregroundColor(colorScheme == .light ? .black : .red)
        case .primitiveBoldTitle:
            return MyCustomTheme.primitiveTitle
                .apply(to: view, colorScheme: colorScheme)
                .font(.largeTitle)
                .padding(5)
                .background(colorScheme == .light ? Color.green : Color.blue)
                .bold()
        case .primitiveBoldTitleRounded:
            return MyCustomTheme.primitiveBoldTitle
                .apply(to: view, colorScheme: colorScheme)
                .cornerRadius(10)
        case .primitiveItalicTitleStroke:
            return MyCustomTheme.primitiveTitle
                .apply(to: view, colorScheme: colorScheme)
                .padding(5)
                .background(Rectangle().stroke(Color.red))
        }
    }

    func apply<V: View>(to view: V, colorScheme: ColorScheme) -> AnyView {
        return AnyView(customStyle(to: view, colorScheme: colorScheme))
    }
}
