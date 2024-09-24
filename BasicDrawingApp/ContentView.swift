//
//  ContentView.swift
//  BasicDrawingApp
//
//  Created by Sandi Junker on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var paths: [Path] = []
    @State private var currentPath = Path()
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for path in paths {
                    context.stroke(path, with: .color(.black), lineWidth: 2)
                }
                context.stroke(currentPath, with: .color(.black), lineWidth: 2)
            }
            .frame(width: 300, height: 300)
            .border(Color.blue)
            .gesture(DragGesture()
                .onChanged{value in currentPath.addLine(to: value.location)
                }
                .onEnded{value in paths.append(currentPath)
                    currentPath = Path()
                }
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
