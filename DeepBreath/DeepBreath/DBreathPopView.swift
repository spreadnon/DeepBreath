//
//  DBreathPopView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/9.
//

import SwiftUI
import Foundation
import MessageUI
struct DBreathPopView: View {
    @State var stepFinish = 0
    @State var showSetting = false
    
    @State private var showDetails = false
    var body: some View {
        ZStack{
            Color(UIColor.hex("FFC14A"))
                .edgesIgnoringSafeArea(.all)
            
            PopTitleView(stepFinish: $stepFinish, showSetting: $showSetting)
           
            PopBreathView(showSetting: $showSetting).environmentObject(TimerSettings())
                .offset(x: showSetting ? -UIScreen.main.bounds.width+80 : -5)
                .animation(.spring())
            
            PopSettingView(showSetting: $showSetting)
                .offset(x: showSetting ? 0 : UIScreen.main.bounds.width)
                .animation(.spring())
            
            PopBottomTitleView(showSetting: $showSetting)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PopTitleView: View {
    @Binding var stepFinish : Int
    @Binding var showSetting : Bool
    var body: some View {
        VStack() {
            Text("吸气   憋气   吐气")
                .font(Font.custom("Avenir-Black", size: 38))
                .foregroundColor(Color(UIColor.hex("333333")))
                .opacity(showSetting ? 0 : 1)
                .shadow(radius: 0.1)
                .padding(.top , 40)
                .animation(
                    Animation.easeInOut(duration: 0.725)
                        .delay(0)
                )
            
            Spacer()
        }.padding(.top , 40)
    }
}

struct PopBottomTitleView: View {
    @Binding var showSetting : Bool
    var body: some View {
        VStack() {
            Spacer()
            Text("设置")
                .font(Font.custom("Avenir-Black", size: 38))
                .foregroundColor(Color(UIColor.hex("333333")))
                .opacity(showSetting ? 1 : 0)
                .shadow(radius: 0.1)
                .padding(.top , 40)
                .animation(
                    Animation.easeInOut(duration: 0.725)
                        .delay(0)
                )
        }.padding(.bottom , 40)
    }
}

struct PopBreathView: View {
    @State var breathType = 0
    @Binding var showSetting : Bool
    @State var stepFinish = 0
    @State var secondCount = 0.0
    var body: some View {
        VStack(spacing: 0) {
            
            if stepFinish == 0{
                DBreathInhaleView(secondCount: $secondCount, stepFinish:$stepFinish).environmentObject(TimerSettings())
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            }
            
            if stepFinish == 1{
                DBreathHoldView(secondCount: $secondCount, stepFinish:$stepFinish).environmentObject(TimerSettings())
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            }
            
            if stepFinish == 2{
                DBreathExhaleView(secondCount: $secondCount, stepFinish:$stepFinish).environmentObject(TimerSettings())
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            }
            
            if stepFinish == 3{
                Text("美国医学博士安德鲁·威尔提出了4-7-8呼吸法：用鼻子缓缓吸气4秒，然后憋气7秒，最后用8秒的时间呼出。")
                    .font(Font.custom("Avenir-Book", size: 22))
                    .foregroundColor(Color.white.opacity(1))
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
            }
           
            Spacer()
            
            ComeBackButtonView(stepFinish: $stepFinish, showSetting: $showSetting, secondCount: $secondCount)
                .padding([.top,.bottom],40)
            
        }
        .background(Color(UIColor.hex("333333")))
        .clipShape(CustomShape(leftCorner: .topRight, rightCorner: .bottomLeft, radii: 8))
        .padding(.top , 160)
        .padding(.bottom , 0)
        .padding(.leading , 0)
        .padding(.trailing , 50)
        .shadow(color: Color(UIColor.hex("BC7E07")).opacity(1), radius: 16, x: 10, y: 10)
    }
    
}

struct ComeBackButtonView: View {
    @Binding var stepFinish :Int
    @Binding var showSetting : Bool
    @Binding var secondCount :Double
    var body: some View {
        HStack {
            Button(action:{
                if self.stepFinish == 3{
                    self.stepFinish = 0
                }
            })
            {
                Image(systemName: "goforward")
                    .resizable()
                    .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(width: 16, height: 16)
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Image(systemName: "stopwatch")
                .resizable()
                .frame(width: 35, height: 40)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
            
            Text("\(secondCount)'")
                .font(.system(size: 55, weight: .bold, design: .rounded))
                .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
//                .frame(width: 80, height: 40)
            
            Spacer()
            
            Button(action:{
                self.showSetting.toggle()
            })
            {
                Image(systemName: "gear")
                    .resizable()
                    .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(width: 18, height: 18)
                
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding([.leading,.trailing,.bottom] , 45)
    }
}

struct CustomShape: Shape {
    var leftCorner: UIRectCorner
    var rightCorner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [leftCorner, rightCorner], cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct DBreathPopView_Previews: PreviewProvider {
    static var previews: some View {
        DBreathPopView()
    }
}

extension AnyTransition{
    static var scaleDownAndUp:AnyTransition{
        AnyTransition.offset(y: 600)
            .combined(with: .scale(scale: 0, anchor: .bottom))
            .combined(with: .opacity)
    }
}
