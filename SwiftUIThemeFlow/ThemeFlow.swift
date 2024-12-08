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

    public init(viewModel: ThemeViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.viewModel = viewModel
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
            .environmentObject(viewModel)
    }
}

