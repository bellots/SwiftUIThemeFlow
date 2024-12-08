//
//  ContentView.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI
import SwiftUIThemeFlow

struct ContentView: View {
    var body: some View {
        ThemeFlow(themes: [MyCustomTheme.primitiveTitle], content: {
            ForEach(MyCustomTheme.allCases.indices, id: \.self) { index in
                Text(MyCustomTheme.allCases[index].rawValue)
                    .themeable(MyCustomTheme.allCases[index])
            }
        })
    }
}

enum MyCustomTheme: String, Theme, CaseIterable {
    case primitiveTitle
    case primitiveBoldTitle
    case primitiveBoldTitleRounded
    
    private func customStyle<V: View>(to view: V) -> any View {
        switch self {
        case .primitiveTitle:
            return view.foregroundColor(.red)
        case .primitiveBoldTitle:
            return MyCustomTheme.primitiveTitle
                .apply(to: view)
                .font(.largeTitle)
                .padding(5)
                .background(Color.green)
        case .primitiveBoldTitleRounded:
            return MyCustomTheme.primitiveBoldTitle
                .apply(to: view)
                .cornerRadius(10)
        }
    }

    func apply<V: View>(to view: V) -> AnyView {
        return AnyView(customStyle(to: view))
    }
}
