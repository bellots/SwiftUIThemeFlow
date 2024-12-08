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
    
    @StateObject var themeViewModel = ThemeViewModel(palette: GreenPaletteExample())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeViewModel)
        }
    }
}

public enum PaletteEnum: String, CaseIterable {
    case green
    case blue
    case red
    
    var palette: Palette {
        switch self {
        case .green:
            return GreenPaletteExample()
        case .blue:
            return BluePaletteExample()
        case .red:
            return RedPaletteExample()
        }
    }
}

struct GreenPaletteExample: Palette {
    var contrast: Tint {
        return Tint(light: .white, dark: .white)
    }

    var primary: Tint {
        return Tint(light: .black, dark: .white)
    }
    var secondary: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 180 / 255, green: 180 / 255, blue: 180 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 110 / 255, green: 110 / 255, blue: 110 / 255, alpha: 1))
        )
    }
    var accent: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 28 / 255, green: 232 / 255, blue: 3 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 61 / 255, green: 116 / 255, blue: 117 / 255, alpha: 1))
        )
    }
}

struct BluePaletteExample: Palette {
    var contrast: Tint {
        return Tint(light: .white, dark: .white)
    }
    
    var primary: Tint {
        return Tint(light: .black, dark: .white)
    }
    var secondary: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 119 / 255, green: 130 / 255, blue: 176 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 60 / 255, green: 77 / 255, blue: 147 / 255, alpha: 1))
        )
    }
    var accent: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 75 / 255, green: 226 / 255, blue: 255 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 61 / 255, green: 116 / 255, blue: 117 / 255, alpha: 1))
        )
    }
}

struct RedPaletteExample: Palette {
    var contrast: Tint {
        return Tint(light: .white, dark: .white)
    }

    var primary: Tint {
        return Tint(light: .black, dark: .white)
    }
    var secondary: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 180 / 255, green: 180 / 255, blue: 180 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 110 / 255, green: 110 / 255, blue: 110 / 255, alpha: 1))
        )
    }
    var accent: Tint {
        return Tint(
            light: Color(uiColor: UIColor(red: 245 / 255, green: 118 / 255, blue: 73 / 255, alpha: 1)),
            dark: Color(uiColor: UIColor(red: 79 / 255, green: 25 / 255, blue: 25 / 255, alpha: 1))
        )
    }
}
