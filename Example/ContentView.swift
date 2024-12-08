//
//  ContentView.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI
import SwiftUIThemeFlow

struct ContentView: View {
    @StateObject var themeViewModel = ThemeViewModel(themes: MyCustomTheme.allCases)
    var body: some View {
        ThemeFlow(viewModel: ThemeViewModel(themes: MyCustomTheme.allCases), content: {
            VStack {                
                ForEach(MyCustomTheme.allCases.indices, id: \.self) { index in
                    Text(MyCustomTheme.allCases[index].rawValue)
                        .themeable(MyCustomTheme.allCases[index])
                }
            }
        })
    }
}


#Preview {
    ContentView()
        .environmentObject(ThemeViewModel(themes: MyCustomTheme.allCases))
}
