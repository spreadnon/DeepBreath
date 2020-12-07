//
//  DBreathHomeView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/7.
//

import SwiftUI

fileprivate let ScreenW = UIScreen.main.bounds.width

struct DBreathHomeView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
//            headerView()
            HeaderTitleView()
                .frame(width: UIScreen.main.bounds.width,height: 300)
                .background(Color.white)
            
            //            Heart111()
            //                .frame(width: UIScreen.main.bounds.width,height: 150)
            //                .offset(x: 0, y: -35)
            //            	.foregroundColor(Color(UIColor.hex("13CBF7")))
            
            //            Heart111()
            //                .frame(width: UIScreen.main.bounds.width,height: 150)
            //                .offset(x: 0, y: -70)
            //                .foregroundColor(Color(UIColor.hex("125CFA")))
            
            InhaleView()
                .offset(x: 0, y: -35)
            
            HoldView()
                .offset(x: 0, y: -50)
            
            ExhaleView()
                .offset(x: 0, y: -70)
            

            
            Spacer()
            
            StartBottonView()
                
        }
        .frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                ).background(Color(UIColor.hex("003CBF")))
        .onAppear{

        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct HeaderTitleView: View {
    
    @State private var rotateIn3D = false
    
    let weatherBg = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack { // Weather
            
            VStack(alignment: .leading) {
                
                Text("Healthy breathing")
                    .font(.system(size: 30))
                    .fontWeight(.light)
                    .foregroundColor(.black )
                    //.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: 0)
                    .shadow(radius: 0.3)
                Spacer()
                
            }
            .padding()
            //.background(weatherBg)
            .cornerRadius(22)
            .foregroundColor(.white)
            
        }.frame( height: 170, alignment: .leading)//width: 170,
        .rotation3DEffect(.degrees(rotateIn3D ? 12 : -12), axis: (x: rotateIn3D ? 90 : -45, y: rotateIn3D ? -45 : -90, z: 0))
        .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true))
        .onAppear() {
            rotateIn3D.toggle()
        }

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
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    Text("\(number)'")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                   
                }
                
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
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    Text("\(number)'")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                }
                
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
                    
                    Text("\(number)'")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)

                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()

                NumberCountView(number: $number)
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
           
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
                Text("-")
                    .frame(width: 32,height: 32)
                    .font(Font.custom("PingFangSC-Thin", size: 22))
                    .foregroundColor(Color.black)
                    .background(Color.white.opacity(0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 32/2)
                            .stroke(Color.clear, lineWidth: 2)
                    )
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 32,height: 32)
            .cornerRadius(32/2)
            
            Text("\(number)")
                .frame(width: 32,height: 32)
                .font(Font.custom("PingFangSC-Thin", size: 22))
                .foregroundColor(Color.white)
                
            
            
            Button(action:{
                if number < 12{
                    number += 1
                }
            })
            {
                Text("+")
                    .frame(width: 32,height: 32)
                    .font(Font.custom("PingFangSC-Thin", size: 22))
                    .foregroundColor(Color.black)
                    .background(Color.white.opacity(0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 32/2)
                            .stroke(Color.clear, lineWidth: 2)
                    )
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 32,height: 32)
            .cornerRadius(32/2)
        }
        
        
    }
}


struct StartBottonView: View {
    
    var body: some View {
        Button(action:{
           
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
        .shadow(color: Color(UIColor.hex("0237B5")), radius: 10, x: 0, y: 0)
        
    }
}


struct DBreathHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DBreathHomeView()
    }
}
