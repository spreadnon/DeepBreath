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
   
    @State var showSetting = false
    
    var body: some View {
        ZStack{
            Color(UIColor.hex("FFC14A"))
                .edgesIgnoringSafeArea(.all)
            
            PopTitleView(showSetting: $showSetting)
           
            PopBreathView(showSetting: $showSetting)
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


struct PopSettingView: View {
    @Binding var showSetting : Bool
    @State var openSound = true
    @State var number = 8
    @State var isShowingMailView = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    var body: some View {
        VStack(spacing: 25) {
            
            HStack{
                Spacer()
                Button(action:{
                    self.showSetting.toggle()
                })
                {
                    Image(systemName: "multiply")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    
                }
                .buttonStyle(PlainButtonStyle())
                
            }.padding(.top,80)
            .padding(.trailing,20)
            
            Spacer()
            
            VStack(spacing: 20){
                HStack{
                    Text("音乐设置")
                        .font(Font.custom("Avenir-Book", size: 20))
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .shadow(radius: 0.2)
                    
                    Spacer()
                }
                
                HStack{
                    
                    Button(action:{
                        self.openSound.toggle()
                    })
                    {
                        Image(systemName: openSound ?  "checkmark.shield.fill" : "xmark.shield.fill")
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        
                        Text("打开音乐")
                            .font(Font.custom("Avenir-Black", size: 22))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .shadow(radius: 0.2)
                            .offset(y: 1)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    if self.openSound == true {
                        Text("开")
                            .font(Font.custom("Avenir-Book", size: 14))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .padding(.trailing,20)
                    }
                }
                
                HStack{
                    
                    Button(action:{
                        if MFMailComposeViewController.canSendMail() {
                            self.isShowingMailView.toggle()
                        }
                    })
                    {
                        Image(systemName: "text.bubble.fill")
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        
                        Text("意见反馈")
                            .font(Font.custom("Avenir-Black", size: 22))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .shadow(radius: 0.2)
                            .offset(y: 1)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowingMailView) {
                                MailView(isShowing: self.$isShowingMailView, result: self.$result)
                            }

                    
                    Spacer()
                    
                    if result != nil {
                        //邮件发送后的反馈
                        Text("已发送")
                            .font(Font.custom("Avenir-Book", size: 14))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .padding(.trailing,20)
                    }
                }
            }.padding(.leading,45)
            
            Spacer()
            
            VStack(spacing: 15){
                HStack{
                    Text("时间设置")
                        .font(Font.custom("Avenir-Book", size: 20))
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .shadow(radius: 0.2)
                    Spacer()
                }.padding(.leading,45)
                
                PopSecondView(type: 0)
                    
                PopSecondView(type: 1)
                    
                PopSecondView(type: 2)
            }.padding(.bottom,60)
            
        }
        .background(Color(UIColor.hex("E6E6E6")))
        .clipShape(CustomShape(leftCorner: .topRight, rightCorner: .bottomLeft, radii: 8))
        .padding(.top , 0)
        .padding(.bottom , 160)
        .padding(.leading , 100)
        .padding(.trailing , 0)
        .shadow(color: Color(UIColor.hex("BC7E07")).opacity(1), radius: 16, x: -10, y: 10)
        .onTapGesture {
           self.showSetting = false//.toggle()
        }
        
    }
    
}

struct PopSecondView: View {
    var type : Int
    @State var number = 4
    @State var name = "吸气"
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(name)
                    .font(Font.custom("Avenir-Black", size: 22))
                    .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    .shadow(radius: 0.1)
                    
                
                HStack{
                    Image(systemName: "stopwatch")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 10, height: 10)
                    
                    Text("\(number)'")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .shadow(radius: 0.2)
                        .offset(y: 1)
           
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
               
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
            
            Spacer()

            PopNumberCountView(number: $number)
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .onAppear{
            switch type{
            case 0:
                number = 4
                name = "吸气"
            case 1:
                number = 7
                name = "憋气"
            case 2:
                number = 8
                name = "吐气"
            default:
                number = 4
                name = "吸气"
            }
        }
    }
}

struct PopNumberCountView: View {
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
                        .opacity(0.3)
                        .frame(width: 24,height: 24)
                    Image(systemName: "play.fill")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 6, height: 6)
                        .rotationEffect(.degrees(90))
                }
            }
            .buttonStyle(PlainButtonStyle())
       
            Button(action:{
                if number < 12{
                    number += 1
                }
            })
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .opacity(0.3)
                        .frame(width: 24,height: 24)
                    Image(systemName: "play.fill")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 8, height: 8)
                        .rotationEffect(.degrees(-90))
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        
        
    }
}


struct PopBreathView: View {
    @State var breathType = 2
    @State var timeCount = 4
    @State var breathName = "深吸气"
    @Binding var showSetting : Bool
    
    var body: some View {
        HStack {
            VStack(spacing: 25) {
                Spacer()
                
                
                HStack{
                    Spacer()
                    
                    Image(systemName: "stopwatch")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 10, height: 10)
                    
                    Text("\(timeCount)'")
                        .font(Font.custom("Avenir-Book", size: 20))
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .shadow(radius: 0.2)
                        .offset(y: 1)
           
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    ForEach(0..<7) { section in
                        HStack(spacing: 10) {
                            
                            ForEach(0..<getNumber(scetion: section)) { row in
                                
                                Circle()
                                    .frame(width: 35, height: 35)
                                
                                
                            }
                        }
                    }
                }.padding()
                
                Text(breathName)
                    .font(Font.custom("Avenir-Book", size: 22))
                    .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    .shadow(radius: 0.1)
                
                Spacer()
                
                HStack {
                    Image(systemName: "goforward")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 35, height: 35)
                    Spacer()
                    
                    
                    
                    Button(action:{
                        self.showSetting.toggle()
                    })
                    {
                        Image(systemName: "gear")
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .frame(width: 35, height: 35)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .padding([.leading,.trailing,.bottom] , 45)
                
                    
            }
            .background(Color(UIColor.hex("333333")))
            .clipShape(CustomShape(leftCorner: .topRight, rightCorner: .bottomLeft, radii: 8))
            .padding(.top , 160)
            .padding(.bottom , 0)
            .padding(.leading , 0)
            .padding(.trailing , 50)
            
            Spacer()
        }.shadow(color: Color(UIColor.hex("BC7E07")).opacity(1), radius: 16, x: 10, y: 10)
        .onTapGesture {
           self.showSetting = false//.toggle()
        }
    }
    
    
    func getNumber(scetion:Int) -> Int {
        if breathType == 0 {
//            timeCount = 4
//            breathName = "深吸气"
            switch scetion {
            case 0:
                return 3
            case 1:
                return 3
            case 2:
                return 7
            case 3:
                return 7
            case 4:
                return 7
            case 5:
                return 3
            case 6:
                return 3
            default:
                return 0
            }
        }
        
        else if breathType == 1 {
//            timeCount = 7
//            breathName = "憋气"
            switch scetion {
            case 0:
                return 3
            case 1:
                return 5
            case 2:
                return 7
            case 3:
                return 7
            case 4:
                return 7
            case 5:
                return 5
            case 6:
                return 3
            default:
                return 0
            }
        }
        
        else if breathType == 2 {
//            timeCount = 8
//            breathName = "呼气"
            switch scetion {
            case 0:
                return 1
            case 1:
                return 3
            case 2:
                return 5
            case 3:
                return 7
            case 4:
                return 5
            case 5:
                return 3
            case 6:
                return 1
            default:
                return 0
            }
        }
        else{
//            timeCount = 4
//            breathName = "深吸气"
            return 0
        }
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
