//
//  DBreathHomeView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/7.
//

import SwiftUI

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds
fileprivate let ScreenW = UIScreen.main.bounds.width

struct DBreathHomeView: View {
    @State var start = false
    var body: some View {
        
        ZStack{
            VStack(spacing: 0) {
                
                HeaderTitleView(start: $start)
                    .frame(width: UIScreen.main.bounds.width,height: self.start ? 680 :260)
                    //.background(Color.white)
                
                InhaleView()
                    .offset(x: 0, y: -35)
                    .animation(.spring())
                
                HoldView()
                    .offset(x: 0, y: -50)
                    .animation(.spring())
                
                ExhaleView()
                    .offset(x: 0, y: -70)
                    .animation(.spring())
                
                Spacer()
                    
            }
            .frame(minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .topLeading
                    )//.background(Color(UIColor.hex("003CBF")))
            .background(Color(UIColor.hex("E4EBF5")))
            
            
            StartBottonView(start: $start)
        }
        .onAppear{

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CircleButton: View {

   var icon = "list.dash"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(Color.black.opacity(0.8))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}

struct HeaderTitleView: View {
    @Binding var start : Bool
    @State var stepFinish = 0
    @State private var rotateIn3D = false
    @State var show = false
    @State var showProfile = false
    let weatherBg = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack { // Weather
//            DBreathInhaleView(stepFinish:$stepFinish).environmentObject(TimerSettings())
//                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .rotation3DEffect(.degrees(rotateIn3D ? 12 : -12), axis: (x: rotateIn3D ? 90 : -45, y: rotateIn3D ? -45 : -90, z: 0))
//                .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true))
//                .onAppear() {
//                    rotateIn3D.toggle()
//                }
//
////            VStack(alignment: .leading) {
//           HStack {
//                Text("Healthy \nbreathing")
//                    .font(.system(size: 44))
//                    .fontWeight(.heavy)
//                    .foregroundColor(Color(UIColor.hex("003CBF")))
//                    //.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: 0)
//                    .shadow(radius: 0.3)
//                    .shadow(color: Color(UIColor.hex("0237B5")), radius: 10, x: 0, y: 0)
//                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))
//
//                Spacer()
//
//            }
//            .padding()
//            //.background(weatherBg)
//            .cornerRadius(22)
//            .foregroundColor(.white)
      
            
//            CircleButton()
            HeaderCardView(start: $start)
            
        }//.frame( height: 170, alignment: .leading)//width: 170,
        .background(Color(UIColor.hex("E4EBF5")))
//        .rotation3DEffect(.degrees(rotateIn3D ? 12 : -12), axis: (x: rotateIn3D ? 90 : -45, y: rotateIn3D ? -45 : -90, z: 0))
//        .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true))
//        .onAppear() {
//            rotateIn3D.toggle()
//        }

    }
}

struct headerView: View {
    
    var body: some View {
        ZStack{
            Image("VirtualStores")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .top)
            
            WeatherView()
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

struct InhaleView: View {
  
    @State var number = 4
    
    var body: some View {
        ZStack{
            Heart111()
                .frame(width: UIScreen.main.bounds.width,height: 150)
                .foregroundColor(Color(UIColor.hex("13CBF7")))
                //.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: 0)
            
            HStack{
                flowerView()
                    .foregroundColor(Color.white)
                    .frame(width: 8, height: 8)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading){
                    Text("Inhale")
                        .font(Font.custom("Avenir-Black", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.1)
                        
                    
                    HStack{
                        Image(systemName: "stopwatch")
                            .foregroundColor(Color.white)
                            .frame(width: 10, height: 10)
                        
                        Text("\(number)'")
                            .font(Font.custom("Avenir-Book", size: 16))
                            .foregroundColor(Color.white)
                            .shadow(radius: 0.2)
                            .offset(y: 1)
               
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                   
                }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
                Spacer()

                NumberCountView(number: $number)
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
            
        }
    }
}

struct HoldView: View {
    @State var number = 7
    
    var body: some View {
        ZStack{
            Heart111()
                .frame(width: UIScreen.main.bounds.width,height: 150)
                .foregroundColor(Color(UIColor.hex("125CFA")))
                
            HStack{
                flowerView()
                    .foregroundColor(Color.white)
                    .frame(width: 8, height: 8)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .rotationEffect(.degrees(45))
                
                VStack(alignment: .leading){
                    Text("Hold")
                        .font(Font.custom("Avenir-Black", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        
                    
                    HStack{
                        Image(systemName: "stopwatch")
                            .foregroundColor(Color.white)
                            .frame(width: 10, height: 10)
                        
                        Text("\(number)'")
                            .font(Font.custom("Avenir-Book", size: 16))
                            .foregroundColor(Color.white)
                            .shadow(radius: 0.2)
                            .offset(y: 1)
               
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
                Spacer()

                NumberCountView(number: $number)
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        }
    }
}

struct ExhaleView: View {
    @State var number = 8
    var body: some View {
        ZStack{
            Heart111()
                .frame(width: UIScreen.main.bounds.width,height: 150)
                .foregroundColor(Color(UIColor.hex("003CBF")))
            
            HStack{
                flowerViewOut()
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .offset(x: -5, y: 0)
                    .rotationEffect(.degrees(45))
                
                VStack(alignment: .leading){
                    Text("Exhale")
                        .font(Font.custom("Avenir-Black", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                    
                    HStack{
                        Image(systemName: "stopwatch")
                            .foregroundColor(Color.white)
                            .frame(width: 10, height: 10)
                        
                        Text("\(number)'")
                            .font(Font.custom("Avenir-Book", size: 16))
                            .foregroundColor(Color.white)
                            .shadow(radius: 0.2)
                            .offset(y: 1)
               
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    

                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                
                Spacer()

                NumberCountView(number: $number)
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
           
        }
    }
}
//struct Arc: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
//
//        return path
//    }
//}

//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}

//struct ArcTriangle: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
//
//        return path
//    }
//}

/// 三角形を描画するカスタムShape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

struct NumberCountView: View {
    @Binding var number : Int
    
    var body: some View {
        
        HStack{
            Button(action:{
                if number > 4{
                    number -= 1
                }
            })
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color.white.opacity(0.2))//(UIColor.hex("7B7EFE"))
                        .frame(width: 24,height: 24)
//                    Triangle()
                    Image(systemName: "play.fill")
                        .foregroundColor(number > 4 ? Color.white : Color.white.opacity(0.5))//(UIColor.hex("7B7EFE"))
//                        .fill(Color(UIColor.hex("7B7EFE")))
                        .frame(width: 6, height: 6)
                        .rotationEffect(.degrees(90))
                }
            }
            .buttonStyle(PlainButtonStyle())
            
//            Text("\(number)")
//                .frame(width: 32,height: 32)
//                .font(Font.custom("PingFangSC-Thin", size: 22))
//                .foregroundColor(Color.white)
                
            Button(action:{
                if number < 12{
                    number += 1
                }
            })
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color.white.opacity(0.2))//(UIColor.hex("A7F2B5"))
                        .frame(width: 24,height: 24)
//                    Triangle()
//                        .fill(Color(UIColor.hex("A7F2B5")))
//                        .frame(width: 12, height: 10)
                    Image(systemName: "play.fill")
                        .foregroundColor( number < 12 ? Color.white : Color.white.opacity(0.5))//(UIColor.hex("A7F2B5"))
//                        .fill(Color(UIColor.hex("7B7EFE")))
                        .frame(width: 8, height: 8)
                        .rotationEffect(.degrees(-90))
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        
        
    }
}


struct StartBottonView: View {
    @Binding var start : Bool
    var body: some View {
        VStack{
            Spacer()
            
            Button(action:{
                self.start.toggle()
            })
            {
                    Text("Start")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Avenir-Black", size: 26))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(UIColor.hex("105BF8")))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.clear, lineWidth: 2)
                        )
                
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: UIScreen.main.bounds.width-90,height: 50)
            .cornerRadius(25)
            .padding(.bottom, 40)
            .shadow(color: Color.white.opacity(0.45), radius: 10, x: 0, y: 0)//(UIColor.hex("0237B5"))
        }
        
        
    }
}


struct DBreathHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DBreathHomeView()
    }
}
