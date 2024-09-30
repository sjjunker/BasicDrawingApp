
import Foundation
import SwiftUI

class DrawingModel: ObservableObject {
    @Published var lines: [Line] = []
    @Published var currentPath = Path()
    @Published var currentColor = Color.black
    @Published var currentLineWidth: CGFloat = 3
    @Published var redoLines: [Line] = []
    @Published var brushStyle: String = "line"
}
