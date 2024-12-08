//
//  MyCustomTheme.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//
import SwiftUI

enum MyCustomTheme: String, Theme, ThemeWrapper, CaseIterable {
    case accentTitle
    case contrastTitle
    case accentBoldTitle
    case accentBoldTitleRoundedFill
    case accentBoldTitleRoundedStroke
    case accentBoldLargeTitle
    case accentItalicTitleStroke
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> any View {
        switch self {
        case .contrastTitle:
            return view.foregroundColor(palette.contrast.color(colorScheme: colorScheme))
        case .accentTitle:
            return view.foregroundColor(palette.accent.color(colorScheme: colorScheme))
        case .accentBoldTitle:
            return MyCustomTheme.accentTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .padding(5)
                .bold()
        case .accentBoldTitleRoundedFill:
            return MyCustomTheme.contrastTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .foregroundColor(.white)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 10).fill(palette.accent.color(colorScheme: colorScheme)))
                .cornerRadius(10)
        case .accentBoldTitleRoundedStroke:
            return MyCustomTheme.accentBoldTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 10).stroke(palette.accent.color(colorScheme: colorScheme)))
                .cornerRadius(10)
        case .accentBoldLargeTitle:
            return MyCustomTheme.accentBoldTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .font(.largeTitle)
        case .accentItalicTitleStroke:
            return MyCustomTheme.accentTitle
                .apply(to: view, colorScheme: colorScheme, palette: palette)
                .padding(5)
                .background(Rectangle().stroke(palette.accent.color(colorScheme: colorScheme)))
                .italic()
        }
    }

    func apply<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView {
        return AnyView(customStyle(to: view, colorScheme: colorScheme, palette: palette))
    }
}
