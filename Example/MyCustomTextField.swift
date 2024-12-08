//
//  MyCustomTextField.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

enum MyCustomTextField: String, Theme, ThemeWrapper, CaseIterable {
    case defaultTextField
    
    func apply<V>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView where V : View {
        switch self {
        case .defaultTextField:
            return AnyView(view
                .padding(10)
                .background(Color.gray))
        }
    }
}

