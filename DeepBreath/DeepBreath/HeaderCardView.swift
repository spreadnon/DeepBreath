//
//  HeaderCardView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/8.
//

import SwiftUI

struct HeaderCardView: View {
    @Binding var start : Bool
    var courses = coursesData
    @State var showContent = false

    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10.0) {
                    ForEach(courses) { item in
                        Button(action: { self.showContent.toggle() }) {
                            GeometryReader { geometry in
                                CourseView(title: item.title,
                                           image: item.image,
                                           color: item.color,
                                           shadowColor: item.shadowColor)
                                    .frame(width: geo.size.width * 0.8)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 10) / -30), axis: (x: 0, y: 10.0, z: 0))
                                    .sheet(isPresented: self.$showContent) { ContentView() }
                                    .shadow(color: item.color.opacity(0.25), radius: 20, x: 0, y: 30)
                            }
                            .frame(width: geo.size.width * 0.8)
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 50)
                .padding(.bottom, start ? 50 : 200)
                
                Spacer()
            }
            .animation(.ripple())
        }
        
    }
}

extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.825)
            .speed(1.205)
            .delay(0.005)
    }
}

struct CourseView: View {
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
//    @State private var rotateIn3D = false
    var body: some View {
        
        VStack{
            HStack{
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(30)
                    .lineLimit(4)
                
                Spacer()
                
                flowerView()
                    .foregroundColor(Color.white.opacity(0.45))
                    .padding(.trailing, 20)
//                    .rotation3DEffect(.degrees(rotateIn3D ? 12 : -12), axis: (x: rotateIn3D ? 90 : -45, y: rotateIn3D ? -45 : -90, z: 0))
//                    .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true))
//                    .onAppear() {
//                        rotateIn3D.toggle()
//                    }
                
            }.frame(height: 120)
            
            Spacer()
            
        }
        .background(color)
        .cornerRadius(25)
        
    }
}

struct Course: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let coursesData = [
   Course(title: "深呼吸",
          image: "Illustration1",
          color: Color(UIColor.hex("13CBF7")),//Color("background3"),
          shadowColor: Color("backgroundShadow3")),
   Course(title: "憋气",
          image: "Illustration2",
          color: Color(UIColor.hex("8A64EF")),//Color("background4"),
          shadowColor: Color("backgroundShadow4")),
   Course(title: "吐气",
          image: "Illustration3",
          color: Color(UIColor.hex("4924C4")),//Color("background7"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
//   Course(title: "Framer Playground",
//          image: "Illustration4",
//          color: Color("background8"),
//          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
//   Course(title: "Flutter for Designers",
//          image: "Illustration5",
//          color: Color("background9"),
//          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
