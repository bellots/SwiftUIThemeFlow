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
            Text("Hello, world!")
                .themeable(MyCustomTheme.primitiveBoldTitle)
        })
    }
}

enum MyCustomTheme: Theme {
    case primitiveTitle
    case primitiveBoldTitle
    

    func apply<V: View>(to view: V) -> AnyView {
        switch self {
        case .primitiveTitle:
            return AnyView(view
                .foregroundColor(.red)
                    )
        case .primitiveBoldTitle:
            return AnyView(MyCustomTheme.primitiveTitle.apply(to: view)
                .font(.largeTitle)
                           )
        }
    }
}
