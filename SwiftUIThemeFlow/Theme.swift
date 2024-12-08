//
//  Theme.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public protocol Theme {
    func apply<V: View>(to view: V, colorScheme: ColorScheme, palette: Palette) -> AnyView
}
