//
//  CanvasView.swift
//  BasicDrawingApp
//
//  Created by Sandi Junker on 10/1/24.
//
import Foundation
import SwiftUI

struct CanvasView: View {
    @EnvironmentObject var model: DrawingModel
    
    var body: some View {
        Canvas { context, size in
            for line in model.lines {
                context.stroke(line.path, with: .color(line.color), lineWidth: line.lineWidth)
            }
            context.stroke(model.currentPath, with: .color(model.currentColor),
                           lineWidth: model.currentLineWidth)
        }
        .gesture(DragGesture()
            .onChanged{value in
                switch model.brushStyle {
                case "line":
                    model.currentPath.addLine(to: value.location)
                case "square":
                    model.currentPath.addRect(CGRect(x: value.location.x, y: value.location.y, width: 25, height: 25))
                case "circle":
                    model.currentPath.addEllipse(in: CGRect(x: value.location.x, y: value.location.y, width: 25, height: 25))
                default:
                    model.currentPath.addLine(to: value.location)
                }
                
                model.redoLines = []
            }
            .onEnded{value in
                let newLine = Line(path: model.currentPath, lineWidth: model.currentLineWidth, color: model.currentColor)
                model.lines.append(newLine)
                model.currentPath = Path()
            }
        )
    }
}
