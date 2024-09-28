//
//  ContentView.swift
//  BasicDrawingApp
//
//  Created by Sandi Junker on 9/24/24.
//

import SwiftUI

struct DrawingView: View {
    @State private var lines: [Line] = []
    @State private var currentPath = Path()
    @State private var currentColor = Color.black
    @State private var currentLineWidth: CGFloat = 3
    @State private var redoLines: [Line] = []
    @State private var brushStyle: String = "line"
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                
                //Draw Area
                Canvas { context, size in
                    for line in lines {
                        context.stroke(line.path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                    context.stroke(currentPath, with: .color(currentColor),
                        lineWidth: currentLineWidth)
                }
                .frame(width: geo.size.width, height: geo.size.height - 20)
                .border(Color.blue)
                .gesture(DragGesture()
                    .onChanged{value in
                        switch brushStyle {
                        case "line":
                            currentPath.addLine(to: value.location)
                        case "square":
                            currentPath.addRect(CGRect(x: value.location.x, y: value.location.y, width: 25, height: 25))
                        case "circle":
                            currentPath.addEllipse(in: CGRect(x: value.location.x, y: value.location.y, width: 25, height: 25))
                        default:
                            currentPath.addLine(to: value.location)
                        }
                        
                        
                        redoLines = []
                    }
                    .onEnded{value in
                        let newLine = Line(path: currentPath, lineWidth: currentLineWidth, color: currentColor)
                        lines.append(newLine)
                        currentPath = Path()
                    }
                )
                
                //Menu
                HStack {
                    //Brush Color
                    ColorPicker("Brush Color", selection: $currentColor)
                        .labelsHidden()
                    
                    //Brush Width
                    Picker("Line Thickness", selection: $currentLineWidth) {
                        Text("Thin").tag(CGFloat(1))
                        Text("Regular").tag(CGFloat(3))
                        Text("Bold").tag(CGFloat(5))
                    }
                    //Brush Style
                    Picker ("Brush Style", selection: $brushStyle) {
                        Image(systemName: "scribble").tag("line")
                        Image(systemName: "square").tag("square")
                        Image(systemName: "circle").tag("circle")
                    }
                    
                    
                    //TODO: Save Button
                    
                    //Undo and Redo Buttons
                    Button {
                        if lines.count > 0 {
                            redoLines.append(lines.popLast()!)
                        }
                    } label: {
                        Image(systemName: "arrow.uturn.backward.circle")
                    }
                    
                    Button {
                        if redoLines.count > 0 {
                            lines.append(redoLines.popLast()!)
                        }
                    } label: {
                        Image(systemName: "arrow.uturn.forward.circle")
                    }
                    
                    //Clear Canvas
                    Spacer()
                    Button {
                        lines = []
                    } label: {
                        Image(systemName: "trash.circle.fill")
                            .imageScale(.large)
                    }
                }
                .padding([.leading, .trailing])
            }
        }
    }
}

#Preview {
    DrawingView()
}
