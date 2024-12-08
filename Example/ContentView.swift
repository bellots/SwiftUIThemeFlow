//
//  ContentView.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI
import SwiftUIThemeFlow

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var themeViewModel = ThemeViewModel(themes: MyCustomTheme.allCases)
    var body: some View {
        ThemeFlow(viewModel: ThemeViewModel(themes: MyCustomTheme.allCases), content: {
            VStack {
                Text(themeViewModel.currentColorScheme == .light ? "Light" : "Dark")
                
                ForEach(MyCustomTheme.allCases.indices, id: \.self) { index in
                    Text(MyCustomTheme.allCases[index].rawValue)
                        .themeable(MyCustomTheme.allCases[index])
                }
            }
            .onChange(of: colorScheme) { newColorScheme in
                themeViewModel.updateTheme(for: newColorScheme)
            }
        })
    }
}

enum MyCustomTheme: String, Theme, CaseIterable {
    case primitiveTitle
    case primitiveBoldTitle
    case primitiveBoldTitleRounded
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme) -> any View {
        switch self {
        case .primitiveTitle:
            return view.foregroundColor(colorScheme == .light ? .black : .white)
        case .primitiveBoldTitle:
            return MyCustomTheme.primitiveTitle
                .apply(to: view, colorScheme: colorScheme)
                .font(.largeTitle)
                .padding(5)
                .background(colorScheme == .light ? Color.green : Color.blue)
        case .primitiveBoldTitleRounded:
            return MyCustomTheme.primitiveBoldTitle
                .apply(to: view, colorScheme: colorScheme)
                .cornerRadius(10)
        }
    }

    func apply<V: View>(to view: V, colorScheme: ColorScheme) -> AnyView {
        return AnyView(customStyle(to: view, colorScheme: colorScheme))
    }
}


#Preview {
    ContentView()
        .environmentObject(ThemeViewModel(themes: MyCustomTheme.allCases))
}
