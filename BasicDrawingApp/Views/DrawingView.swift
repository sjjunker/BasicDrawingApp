//
//  ContentView.swift
//  BasicDrawingApp
//
//  Created by Sandi Junker on 9/24/24.
//

import SwiftUI

struct DrawingView: View {
    @EnvironmentObject var model: DrawingModel
    
    var body: some View {
        
        VStack {
            //Draw Area
            CanvasView()
            
            //Menu
            MenuView()
        }
    }
}

#Preview {
    DrawingView()
        .environmentObject(DrawingModel())
}
