//
//  ContentView.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeViewModel: ThemeViewModel
    var body: some View {
        VStack {
            ForEach(MyCustomTheme.allCases.indices, id: \.self) { index in
                Text(MyCustomTheme.allCases[index].rawValue)
                    .style(MyCustomTheme.allCases[index], palette: themeViewModel.palette)
            }
            
            ForEach(MyCustomTextField.allCases.indices, id: \.self) { index in
                TextField("Placeholder", text: .constant(""))
                    .style(MyCustomTextField.allCases[index], palette: themeViewModel.palette)
            }
            
            ForEach(MyCustomButton.allCases.indices, id: \.self) { index in
                Button("Button", action: {})
                    .style(MyCustomButton.allCases[index], palette: themeViewModel.palette)
            }
        }
    }
}


#Preview {
    ContentView()
}

