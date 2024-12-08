//
//  ThemeFlow.swift
//  SwiftUIThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public struct ThemeFlow<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: ThemeViewModel
    @ViewBuilder let content: () -> Content

    public init(themes: [any Theme], @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.viewModel = ThemeViewModel(themes: themes)
    }

    public var body: some View {
        content()
            .environmentObject(viewModel)
            .onAppear {
                viewModel.currentColorScheme = colorScheme
            }
            .onChange(of: colorScheme) { newColorScheme in
                viewModel.currentColorScheme = newColorScheme
            }
    }
}

