//
//  Tint.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

public struct Tint {
    public var light: Color
    public var dark: Color
    
    public init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }
    
    public init(_ color: Color) {
        self.light = color
        self.dark = color
    }
}
