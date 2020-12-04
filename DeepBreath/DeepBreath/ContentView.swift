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
    
    @State var seconds = 0.0
    @State var timer: Timer? = nil
    @State var timerRuning = false
    @State var currentRow = 15
    @State var timeInterval = 0.17
    
    @State private var breathType = 0
    @State private var breathSecond = 4.0
    
    
    
    var body: some View {
        VStack(spacing: 25) {
            
//            if timerRuning {
//                ForEach(0..<15) { number in
//                    HStack(spacing: 25) {
//                        ForEach(0..<10) {_ in
//                            if seconds <= timerSettings.stepOne{
//                                flowerView()
//                                    .foregroundColor(self.currentRow < number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
//                                    .frame(width: 12, height: 12)
//                                    .animation(
//                                        Animation.easeInOut(duration: 0.35)
//                                            .delay(0.25)
//                                    )
//                            }
//                            else if seconds <= (timerSettings.stepOne + timerSettings.stepTwo){
//                                flowerView()
//                                    .foregroundColor(self.currentRow < number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
//                                    .frame(width: 12, height: 12)
//                                    .animation(
//                                        Animation.easeInOut(duration: 0.35)
//                                            .delay(0.25)
//                                    )
//                                    .rotationEffect(.degrees(45))
//                            }
//                            else if seconds <= (timerSettings.stepOne + timerSettings.stepTwo + timerSettings.stepThree){
//                                flowerViewOut()
//                                    .foregroundColor(self.currentRow < number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
//                                    .frame(width: 12, height: 12)
//                                    .animation(
//                                        Animation.easeInOut(duration: 0.35)
//                                            .delay(0.25)
//                                    )
//                                    .rotationEffect(.degrees(45))
//                            }
//                        }
//                    }
//                }
//            }
//            else {
//
//            }
            
            BreathInView().environmentObject(TimerSettings())
              
            Spacer()

            BottomTextView()
            ButtonActionView()
            
            Spacer()
            
        }.onAppear{
            startTimer()
        }
    }

    
    
    private func endEditing(_ force: Bool) {
        UIApplication.shared.endEditing()
    }
    
    
    func startTimer(){
        timerRuning = true
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true){ tempTimer in
            
            if seconds < 4{
                self.seconds += 0.17
            }
            if seconds < 11 && seconds > 4{
                self.seconds += 0.47
            }
            if seconds < 19 && seconds > 11{
                self.seconds += 0.53
            }
            
            
            if self.seconds >= breathSecond {
                
                stopTimer()
                
                breathType += 1
                
                if breathType == 1{
                    sleep(1)
                    
                    breathSecond += 7
                    currentRow = 15
                    
                    timeInterval = 0.47
                    startTimer()
                    
                }
                if breathType == 2{
                    sleep(1)
                    
                    breathSecond += 8
                    currentRow = 15
                    
                    timeInterval = 0.47
                    startTimer()
                }
                if breathType == 3{
                    sleep(1)
                }
                
            }
            
            print("当前seconds是 \(self.seconds)")
            self.currentRow -= 1
            
        }
    }
    
    func stopTimer(){
        timerRuning = false
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer(){
        seconds = 0
    }
}

struct ButtonActionView: View {
    @State var isShow = false
    @State var animOffset: Double = 0
    
    var body: some View {
        
        HStack{
            Button(action:{
                isShow = true
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
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        
        
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

//struct BreathInView: View {
//    @State var row: Int
//
//    var body: some View {
//        VStack(spacing: 25) {
//            ForEach(0..<15) { number in
//                
//                HStack(spacing: 25) {
//                    ForEach(0..<10) {_ in
//
//                        flowerView()
//                            .foregroundColor(self.row < number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
//                            .frame(width: 12, height: 12)
//                            .animation(
//                                Animation.easeInOut(duration: 0.35)
//                                    .delay(0.25)
//                            )
//                    }
//                }
//
//            }
//        }
//
//    }
//}

struct BottomTextView: View {
    
    var body: some View {
        
        HStack{
            flowerView()
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .frame(width: 8, height: 8)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Text("inhale 4s")
                .font(Font.custom("PingFangSC-Thin", size: 22))
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .shadow(radius: 0.2)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        
        HStack{
            flowerView()
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .frame(width: 12, height: 12)
                .rotationEffect(.degrees(45))
                .padding(EdgeInsets(top: 0, leading: -3, bottom: 0, trailing: 0))
            
            Text("hold 7s")
                .font(Font.custom("PingFangSC-Thin", size: 22))
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .shadow(radius: 0.2)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        
        HStack{
            
            flowerViewOut()
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .frame(width: 12, height: 12)
                //                .rotationEffect(.degrees(45))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Text("exhale 8s")
                .font(Font.custom("PingFangSC-Thin", size: 22))
                .foregroundColor(Color(UIColor.hex("5A5E61")))
                .shadow(radius: 0.2)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 30, trailing: 30))
        
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
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
                //                    .foregroundColor(Color(UIColor.hex("5A5E61")))
                
                //                Spacer()
                
                Rectangle()
                    .frame(width: 3, height: 8)
                    .cornerRadius(1.5)
                //                    .foregroundColor(Color(UIColor.hex("5A5E61")))
            }
            
            HStack{
                Rectangle()
                    .frame(width: 8, height: 3)
                    .cornerRadius(4)
                //                    .foregroundColor(Color(UIColor.hex("5A5E61")))
                
                //                Spacer()
                
                Rectangle()
                    .frame(width: 8, height: 3)
                    .cornerRadius(4)
                //                    .foregroundColor(Color(UIColor.hex("5A5E61")))
            }
        }
        //        .frame(width: 12, height: 12)
        //        .background(Rectangle()
        //                        .fill(Color.white)
        //                        .cornerRadius(0)
        //                        .shadow(color: Color.gray.opacity(0.12), radius: 0))
    }
}

struct flowerViewOut: View {
    
    var body: some View {
        //        ZStack{
        Rectangle()
            .frame(width: 12, height: 3)
            .cornerRadius(1.5)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        //        }
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
