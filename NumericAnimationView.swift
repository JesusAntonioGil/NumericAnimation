//
//  NumericAnimationView.swift
//  NumericAnimation
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import SwiftUI


struct NumericAnimationView: View {
    @State private var progress: Double = 0
    
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                CircularProgressView(progress: $progress)
                    .frame(width: 250, height: 250)
                
                Text(String(format: "%.0f", progress * 100))
                    .font(.system(size: 70).bold())
                    .contentTransition(.numericText())
                    .animation(.default, value: progress)
            }
            
            Slider(value: $progress)
        }
        .padding(.horizontal, 20)
    }
}


struct CircularProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.teal.opacity(0.3), lineWidth: 30)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.teal, style: .init(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}


#Preview {
    NumericAnimationView()
}
