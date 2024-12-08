//
//  ExampleApp.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI
@_exported import SwiftUIThemeFlow

@main
struct ExampleApp: App {
    
    @StateObject var themeViewModel = ThemeViewModel(palette: PaletteExample())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeViewModel)
        }
    }
}

struct PaletteExample: Palette {
    var primary: Tint {
        return TintExample(light: .black, dark: .white)
    }
    var secondary: Tint {
        return TintExample(light: .red, dark: .blue)
    }
    var accent: Tint {
        return TintExample(light: .red, dark: .blue)
    }
}
