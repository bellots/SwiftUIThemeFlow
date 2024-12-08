//
//  Tint.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public struct Tint {
    public let light: Color
    public let dark: Color
    
    public init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }
    
    public init(color: Color) {
        self.light = color
        self.dark = color
    }
}
