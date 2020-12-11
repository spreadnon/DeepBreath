//
//  ContentView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/2.
//

import SwiftUI

class TimerSettings: ObservableObject {
    @Published var stepOne = 4.0
    @Published var stepTwo = 7.0
    @Published var stepThree = 8.0
}

struct ContentView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    @State var stepFinish = 0
    
    var body: some View {
        VStack(spacing: 25) {
            
//            if stepFinish == 0{
//                DBreathInhaleView(stepFinish:$stepFinish).environmentObject(TimerSettings())
//                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
//                   
//            }
//            
//            if stepFinish == 1{
//                DBreathHoldView(stepFinish:$stepFinish).environmentObject(TimerSettings())
//                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
//                    
//            }
//            
//            if stepFinish == 2{
//                DBreathExhaleView(stepFinish:$stepFinish).environmentObject(TimerSettings())
//                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
//                    
//            }
//            
//            if stepFinish == 3{
//                ButtonActionView(stepFinish:$stepFinish)
//                   
//            }
//              
//            Spacer()

            BottomTextView()
            
            
            Spacer()
            
        }.onAppear{

        }
    }

    
    
    private func endEditing(_ force: Bool) {
        UIApplication.shared.endEditing()
    }
    
}

struct ButtonActionView: View {
    @State var isShow = false
    @State var animOffset: Double = 0
    @Binding var stepFinish : Int
    var body: some View {
        
        HStack{
            Button(action:{
                isShow = true
                stepFinish = 0
            })
            {
                Text("Again")
                    .font(Font.custom("PingFangSC-Thin", size: 22))
                    .foregroundColor(Color(UIColor.hex("5A5E61")))
                    .shadow(radius: 0.2)
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $isShow, onDismiss: {
                    
                }) {
                SettingView()
            }
            Spacer()
        }.padding(EdgeInsets(top: 80, leading: 30, bottom: 0, trailing: 30))
        
        
    }
}

struct ButtonEffect: GeometryEffect {
    
    var offset: Double // 0...1
    
    var animatableData: Double {
        get { offset }
        set { offset = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        let effectValue = abs(sin(offset*Double.pi))
        let scaleFactor = 1+0.2*effectValue
        
        let affineTransform = CGAffineTransform(rotationAngle: CGFloat(effectValue)).translatedBy(x: -size.width/2, y: -size.height/2).scaledBy(x: CGFloat(scaleFactor), y: CGFloat(scaleFactor))
        
        return ProjectionTransform(affineTransform)
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
}

struct flowerView: View {
    
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .frame(width: 3, height: 8)
                    .cornerRadius(1.5)
                
                Rectangle()
                    .frame(width: 3, height: 8)
                    .cornerRadius(1.5)
                
            }
            
            HStack{
                Rectangle()
                    .frame(width: 8, height: 3)
                    .cornerRadius(4)
                
                Rectangle()
                    .frame(width: 8, height: 3)
                    .cornerRadius(4)
                
            }
        }
    }
}

struct flowerViewOut: View {
    var body: some View {
        Rectangle()
            .frame(width: 18, height: 3)
            .cornerRadius(1.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

/**
 单精度的随机数
 */
public extension Float {
    static func randomFloatNumber(lower: Float = 0,upper: Float = 1) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition{
        AnyTransition.move(edge: .trailing)
    }
}
