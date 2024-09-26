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
}
