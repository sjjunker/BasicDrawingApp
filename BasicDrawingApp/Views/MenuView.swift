import SwiftUI

struct MenuView: View {
    @EnvironmentObject var model: DrawingModel
    
    //Menu
    var body: some View {
        HStack {
            //Brush Color
            ColorPicker("Brush Color", selection: $model.currentColor)
                .labelsHidden()
            
            //Brush Width
            Picker("Line Thickness", selection: $model.currentLineWidth) {
                Text("Thin").tag(CGFloat(1))
                Text("Regular").tag(CGFloat(3))
                Text("Bold").tag(CGFloat(5))
            }
            //Brush Style
            Picker ("Brush Style", selection: $model.brushStyle) {
                Image(systemName: "scribble").tag("line")
                Image(systemName: "square").tag("square")
                Image(systemName: "circle").tag("circle")
            }
            
            
            //TODO: Save Button
            
            //Undo and Redo Buttons
            Button {
                if model.lines.count > 0 {
                    model.redoLines.append(model.lines.popLast()!)
                }
            } label: {
                Image(systemName: "arrow.uturn.backward.circle")
            }
            
            Button {
                if model.redoLines.count > 0 {
                    model.lines.append(model.redoLines.popLast()!)
                }
            } label: {
                Image(systemName: "arrow.uturn.forward.circle")
            }
            
            //Clear Canvas
            Spacer()
            Button {
                model.lines = []
                model.redoLines = []
            } label: {
                Image(systemName: "trash.circle.fill")
                    .imageScale(.large)
            }
        }
        .padding([.leading, .trailing])
    }
}
