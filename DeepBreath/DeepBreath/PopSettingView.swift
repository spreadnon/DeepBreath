//
//  PopSettingView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/11.
//

import SwiftUI
import Foundation
import MessageUI

struct PopSettingView: View {
    @Binding var showSetting : Bool
    @State var openSound = true
    @State var number = 8
    @State var isShowingMailView = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            VStack(spacing: 20){
                HStack{
                    Text("音乐设置")
                        .font(Font.custom("Avenir-Book", size: 20))
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .shadow(radius: 0.2)

                    Spacer()
                }.padding(.top,65)
                
                
                HStack{
                    
                    Button(action:{
                        self.openSound.toggle()
                    })
                    {

                        Text("打开音乐")
                            .font(Font.custom("Avenir-Black", size: 22))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .shadow(radius: 0.2)
                            .offset(y: 1)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 18, height: 18)
                        //.foregroundColor(openSound ? Color(UIColor.hex("474747")) : .gray)
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .onTapGesture {
                            openSound.toggle()
                        }
                        .padding(.trailing,30)
                        
                }
                
                HStack{
                    Button(action:{
                        if MFMailComposeViewController.canSendMail() {
                            self.isShowingMailView.toggle()
                        }
                    })
                    {
                        
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
                    
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        //.foregroundColor(openSound ? Color(UIColor.hex("474747")) : .gray)
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .onTapGesture {
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView.toggle()
                            }
                        }
                        .padding(.trailing,30)
                    
                    /*
                    if result != nil {
                        //邮件发送后的反馈
                        Text("已发送")
                            .font(Font.custom("Avenir-Book", size: 14))
                            .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                            .padding(.trailing,20)
                    }
                     */
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
            }//.padding(.bottom,60)
            
            
            Spacer()
            HStack{
                
                Button(action:{
                    self.showSetting.toggle()
                })
                {
                    Image(systemName: "multiply")
                        .resizable()
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 16, height: 16)
                    
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                
            }.padding([.leading,.bottom],45)
            
        }
        .background(Color(UIColor.hex("E6E6E6")))
        .clipShape(CustomShape(leftCorner: .topRight, rightCorner: .bottomLeft, radii: 8))
        .padding(.top , 0)
        .padding(.bottom , 160)
        .padding(.leading , 100)
        .padding(.trailing , 0)
        .shadow(color: Color(UIColor.hex("BC7E07")).opacity(1), radius: 16, x: -10, y: 10)
        .onTapGesture {
           self.showSetting = true
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
                    //.font(Font.custom("Avenir-Black", size: 22))
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                    .shadow(radius: 0.1)
                    
                
                HStack{
                    Image(systemName: "stopwatch")
                        .foregroundColor(Color(UIColor.hex("474747")).opacity(1))
                        .frame(width: 10, height: 10)
                    
                    Text("\(number)'")
                        //.font(Font.custom("Avenir-Book", size: 16))
                        .font(.system(size: 16, weight: .light, design: .rounded))
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



//struct PopSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopSettingView()
//    }
//}
