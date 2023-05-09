//
//  ContentView.swift
//  TriangleInCircle
//
//  Created by Max Franz Immelmann on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isStep1Animated = false
    @State private var isStep2Animated = false
    @State private var isStep3Animated = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("How to draw a triangle with equal sides inside a circle:")
                .font(.title)
            
            // Step 1: Draw a circle
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 3)
                    .scaleEffect(isStep1Animated ? 1.0 : 0.0)
                    .opacity(isStep1Animated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 1.0))
                
                Circle()
                    .fill(Color.blue.opacity(0.2))
            }
            .frame(width: 200, height: 200)
            .onAppear {
                self.isStep1Animated = true
            }
            .opacity(isStep1Animated ? 1.0 : 0.0)
            .animation(Animation.easeInOut(duration: 1.0).delay(1.0))
            
            // Step 2: Mark the dots on the circle
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                
                ForEach(0..<3) { index in
                    let angle = Double(index) * 2 * .pi / 3
                    let x = 100 * cos(angle)
                    let y = 100 * sin(angle)
                    
                    Circle()
                        .fill(Color.blue)
                        .scaleEffect(isStep2Animated ? 1.2 : 1.0)
                        .opacity(isStep2Animated ? 1.0 : 0.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(Double(index) * 0.5))
                        .frame(width: 10, height: 10)
                        .position(x: x + 100, y: y + 100)
                }
            }
            .frame(width: 200, height: 200)
            .opacity(isStep2Animated ? 1.0 : 0.0)
            .animation(Animation.easeInOut(duration: 1.0).delay(3.0))
            .onAppear {
                self.isStep2Animated = true
            }
            
            // Step 3: Connect the dots to form a triangle
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                
                Path { path in
                    let angle = 2 * Double.pi / 3
                    let x = 100 * cos(angle)
                    let y = 100 * sin(angle)
                    
                    path.move(to: CGPoint(x: x + 100, y: y + 100))
                    
                    for index in 1...2 {
                        let angle = Double(index) * 2 * .pi / 3
                        let x = 100 * cos(angle)
                        let y = 100 * sin(angle)
                        
                        path.addLine(to: CGPoint(x: x + 100, y: y + 100))
                    }
                    
                    path.closeSubpath()
                }
                .stroke(Color.blue, lineWidth: 3)
                .scaleEffect(isStep3Animated ? 1.0 : 0.0)
                .opacity(isStep3Animated ? 1.0 : 0.0)
                .animation(Animation.easeInOut(duration: 1.0).delay(3.0))
                .onAppear {
                    self.isStep3Animated = true
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

//    .stroke(Color.blue, lineWidth: 3)
//    .scaleEffect(isStep3Animated ? 1.0 : 0.0)
//    .opacity(isStep3Animated ? 1.0 : 0.0)
//    .animation(Animation.easeInOut(duration: 1.0).delay(3.0))
//    .onAppear {
//        self.isStep3Animated = true
//    }
//}
//}
//}
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
