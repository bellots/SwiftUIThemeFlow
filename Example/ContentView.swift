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
                
                ForEach(MyCustomTextField.allCases.indices, id: \.self) { index in
                    TextField("Placeholder", text: .constant(""))
                        .themeable(MyCustomTextField.allCases[index])
                }
                
                ForEach(MyCustomButton.allCases.indices, id: \.self) { index in
                    Button("Button", action: {})
                        .themeable(MyCustomButton.allCases[index])
                }
            }
        })
    }
}


#Preview {
    ContentView()
        .environmentObject(ThemeViewModel(themes: MyCustomTheme.allCases))
}

enum MyCustomTextField: String, Theme, CaseIterable {
    case defaultTextField
    
    func apply<V>(to view: V, colorScheme: ColorScheme) -> AnyView where V : View {
        switch self {
        case .defaultTextField:
            return AnyView(view
                .padding(10)
                .background(Color.gray))
        }
    }
}

enum MyCustomButton: String, Theme, CaseIterable {
    case defaultButton
    case roundedButton
    
    
    private func commonStyle<V: View>(to view: V, colorScheme: ColorScheme) -> any View {
        
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
    
    private func customStyle<V: View>(to view: V, colorScheme: ColorScheme) -> any View {
        return commonStyle(to: view, colorScheme: colorScheme)
            .background(color(for: colorScheme))
            .cornerRadius(isRounded ? 20 : 0)
    }
    
    func apply<V>(to view: V, colorScheme: ColorScheme) -> AnyView where V : View {
        return AnyView(customStyle(to: view, colorScheme: colorScheme))
    }

}
