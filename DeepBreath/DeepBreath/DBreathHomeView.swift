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
            
            headerView()
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
    
    var body: some View {
        ZStack{
            Heart111()
                .frame(width: UIScreen.main.bounds.width,height: 150)
                .foregroundColor(Color(UIColor.hex("13CBF7")))
            
            
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
                    
                    Text("time: 4s")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                }
                
                Spacer()
                
                
            }
//            .offset(x: 0, y: -20)
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
            
        }.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: 0)
    }
}

struct HoldView: View {
    
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
                
                VStack(alignment: .leading){
                    Text("Hold")
                        .font(Font.custom("Avenir-Black", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    Text("time: 7s")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                }
                
                Spacer()
            }
//            .offset(x: 0, y: -20)
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                
        }.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: 0)
    }
}

struct ExhaleView: View {
    
    var body: some View {
        ZStack{
            Heart111()
                .frame(width: UIScreen.main.bounds.width,height: 150)
                .foregroundColor(Color(UIColor.hex("003CBF")))
            
            HStack{
                flowerView()
                    .foregroundColor(Color.white)
                    .frame(width: 8, height: 8)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                VStack(alignment: .leading){
                    Text("Exhale")
                        .font(Font.custom("Avenir-Black", size: 22))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    Text("time: 8s")
                        .font(Font.custom("Avenir-Book", size: 16))
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.2)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                
                Spacer()
            }
//            .offset(x: 0, y: -20)
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                
        }.shadow(color: Color(UIColor.hex("0237B5")), radius: 5, x: 0, y: -2)
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
