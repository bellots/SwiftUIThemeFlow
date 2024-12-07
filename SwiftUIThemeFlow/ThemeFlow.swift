//
//  ThemeFlow.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public struct ThemeFlow<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = ThemeViewModel()
    @ViewBuilder let content: Content

    init(content: Content) {
        self.content = content
    }
    
    public var body: some View {
        content
            .environmentObject(viewModel)
            .onAppear {
                viewModel.currentColorScheme = colorScheme
            }
            .onChange(of: colorScheme) { newColorScheme in
                viewModel.currentColorScheme = newColorScheme
            }
    }
}

