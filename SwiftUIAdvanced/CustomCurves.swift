//
//  CustomCurves.swift
//  SwiftUIAdvanced
//
//  Created by Vladyslav Torhovenkov on 05.01.2024.
//

import SwiftUI

struct CustomCurves: View {
    var body: some View {
        ArcSample()
            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCurves()
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 100),
                clockwise: false)
        }
    }
}
