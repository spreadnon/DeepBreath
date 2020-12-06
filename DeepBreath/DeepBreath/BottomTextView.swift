//
//  BottomTextView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

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

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView()
    }
}
