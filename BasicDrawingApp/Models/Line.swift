//
//  Line.swift
//  BasicDrawingApp
//
//  Created by Sandi Junker on 9/26/24.
//
import Foundation
import SwiftUI

struct Line: Identifiable {
    var path: Path
    var lineWidth: CGFloat
    var color: Color
    let id = UUID()
    
    init(path: Path, lineWidth: CGFloat, color: Color) {
        self.path = path
        self.lineWidth = lineWidth
        self.color = color
    }
}
