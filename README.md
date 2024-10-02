# Overview

This is a basic drawing application. I wrote this to gain skills in Swift and SwiftUI working with the artistic side of the language.

The software demonstrates Swift classes through the "Line" model and "DrawingModel" view model. It demonstrates arrays via the "lines" and "redoLines" array. There are several conditionals including multiple if/else statements and one switch statement. Finally, it uses a for/in loop to draw each saved line from the "lines" array to the Canvas view.

The primary SwiftUI view that makes this application work is the Canvas view. Using the DragGesture a user can draw lines onto the Canvas. Through the use of the environment object "DrawingModel" and several different Pickers in the "MenuView" a user can select different colors, brush shapes, and lines thickness. Finally, using a "redoLines" array allows the user to undo/redo and clear the canvas.

[Software Demo Video](https://youtu.be/NaKK2J89sSw)

# Development Environment

The tools used for this project include xCode, Swift, SwiftUI, SF Symbols, and Foundation.

# Useful Websites

- [Swift Resources - Apple Developer](https://developer.apple.com/swift/resources/)
- [SwiftUI | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/)
- [SF Symbols - Apple Developer](https://developer.apple.com/sf-symbols/)

# Future Work

- Save and Load Button: I really wanted to implement this, but given time constraints there was just too much for me to learn. I got as far as saving the Canvas as an image within an instance of the DrawingModel, but I was never able to write it to file using a user chosen file name. I never got around to learning to load the image from file nor how to add it to the current Canvas.
- Method for Drawing Shapes: I had some trouble learning how to implement gestures, thus I was only able to learn the one DragGesture. Also, I had some trouble saving shapes as an instance of Line, so the shapes turned into Paths rather than a single resizable shape. I would like to have the option for the single resizable shape in the future.
- More Brush Strokes: In the interest of time, I settled for three different brush strokes: line, circle, and square. But, again, I would like the shapes to be single resizable shapes, not a Path/brush stroke. Then I would like to experiment with different brush strokes.
