//
//  CustomAnimatableData.swift
//  SwiftUIAdvanced
//
//  Created by Vladyslav Torhovenkov on 05.01.2024.
//

import SwiftUI

struct CustomAnimatableData: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Pacman(offsetAmount: isAnimating ? 20 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            withAnimation(.easeOut.repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    CustomAnimatableData()
}

struct RectangleSingleCornerRaidus: Shape {
    var cornerRadius: CGFloat = 60
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    var offsetAmount: Double
    
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false
            )
        }
    }
}
