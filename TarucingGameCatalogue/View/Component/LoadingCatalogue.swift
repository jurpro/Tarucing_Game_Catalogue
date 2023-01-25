//
//  LoadingGames.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI

struct LoadingCatalogue: View {
    
    let rotationTime: Double = 0.5
    let fullRotation: Angle = .degrees(360)
    let animationTime: Double = 0.8
    
    static let initialDegree: Angle = .degrees(270)
    
    @State var spinnerStart: CGFloat = 0.0
    @State var spinnerEndS1: CGFloat = 0.03
    @State var spinnerEndS2S3: CGFloat = 0.03
    
    @State var rotationDegreeS1 = initialDegree
    @State var rotationDegreeS2 = initialDegree
    @State var rotationDegreeS3 = initialDegree
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    SpinnerLoadingCircle(
                        start: spinnerStart,
                        end: spinnerEndS1,
                        rotation: rotationDegreeS1,
                        color: Color.blueColor
                    )
                    
                    SpinnerLoadingCircle(
                        start: spinnerStart,
                        end: spinnerEndS2S3,
                        rotation: rotationDegreeS2,
                        color: Color.redColor)
                    
                    SpinnerLoadingCircle(
                        start: spinnerStart,
                        end: spinnerEndS2S3,
                        rotation: rotationDegreeS3,
                        color: Color.greenColor)
                }
                .frame(width: 75, height: 75)
                
                .onAppear() {
                    Timer.scheduledTimer(
                        withTimeInterval: animationTime, repeats: true) {
                            (mainTimer) in self.animateSpinner()
                    }
                }
                
                HStack {
                    Label(
                        LabelExtension.loadingText,
                        systemImage: "mic.and.signal.meter.fill")
                        .imageScale(.large)
                        .font(.custom("EncodeSansCondensed-Medium", size: 18))
                        .foregroundColor(.lightDarkColor)
                        .padding(.bottom, 5)
                }
            }
        }
    }
    
    func animateSpinner(
        with timeInterval: Double,
        completion: @escaping (() -> Void)) {
            Timer.scheduledTimer(
                withTimeInterval: timeInterval,
                repeats: false) {_ in
                    withAnimation(Animation.easeInOut(duration: rotationTime)) {
                        completion()
                    }
            }
    }
    
    func animateSpinner() {
        animateSpinner(with: rotationTime) {
            self.spinnerEndS1 = 1.0
        }
        
        animateSpinner(with: (rotationTime * 2) - 0.025) {
            self.rotationDegreeS1 += fullRotation
            self.spinnerEndS2S3 = 0.8
        }
        
        animateSpinner(with: (rotationTime * 2)) {
            self.spinnerEndS1 = 0.03
            self.spinnerEndS2S3 = 0.03
        }
        
        animateSpinner(with: (rotationTime * 2) + 0.0525) {
            self.rotationDegreeS2 += fullRotation
        }
        
        animateSpinner(with: (rotationTime * 2) + 0.225) {
            self.rotationDegreeS3 += fullRotation
        }
        
    }
}

struct SpinnerLoadingCircle: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
            .fill(color)
            .rotationEffect(rotation)
    }
}

struct LoadingGames_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCatalogue()
    }
}
