//
//  WeatherView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/7.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var rotateIn3D = false
    
    let weatherBg = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack { // Weather
            
            VStack(alignment: .leading) {
                Text("Wednesday")
                
                Text("18°")
                    .font(.system(size: 44))
                    .fontWeight(.thin)
                
                Spacer()
                Image(systemName: "cloud.sun.fill")
                Text("Partly Cloudy")
                    .frame(width: 150, height: 20, alignment: .leading)
                Text("H:21° L:12°")
                
            }
            .padding()
            .background(weatherBg)
            .cornerRadius(22)
            .foregroundColor(.white)
            
        }.frame(width: 170, height: 170, alignment: .leading)
        .rotation3DEffect(.degrees(rotateIn3D ? 12 : -12), axis: (x: rotateIn3D ? 90 : -45, y: rotateIn3D ? -45 : -90, z: 0))
        .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true))
        .onAppear() {
            rotateIn3D.toggle()
        }

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
