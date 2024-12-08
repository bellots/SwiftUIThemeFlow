//
//  TintExample.swift
//  SwiftUI-ThemeFlow
//
//  Created by Andrea Bellotto on 08/12/24.
//

import SwiftUI

struct TintExample: Tint {
    let light: Color
    let dark: Color
    
    init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }
}
