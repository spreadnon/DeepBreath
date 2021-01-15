//
//  TodoListView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/18.
//

import SwiftUI

struct HealthGroupBoxStyle<V: View>: GroupBoxStyle {
    var color: Color
    var destination: V
    var date: Date?

    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        NavigationLink(destination: destination) {
            GroupBox(label: HStack {
                configuration.label.foregroundColor(color)
                Spacer()
                if date != nil {
                    Text("\(date!)").font(.footnote).foregroundColor(.secondary).padding(.trailing, 4)
                }
                Image(systemName: "chevron.right").foregroundColor(Color(.systemGray4)).imageScale(.small)
            }) {
                configuration.content.padding(.top)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct TodoListView: View {
    @State var showAlert = false
    @State var isShowingMailView = false
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Joe's Original",label: "Songs played", image: "music.quarternote.3", value: "1031", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Songs loved", image: "heart.fill", value: "59", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Plays", image: "play.fill", value: "3619", unit: "Times"),
        Restaurant(name: "Joe's Original",label: "Time played", image: "stopwatch", value: "165:14", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Recently played", image: "timer", value: "134", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Skips", image: "forward.fill", value: "481", unit: ""),
        Restaurant(name: "Joe's Original",label: "Downloads", image: "icloud.and.arrow.down", value: "1031", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Explicit", image: "e.square.fill", value: "293", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Genres", image: "guitars.fill", value: "7", unit: "Genres"),
        Restaurant(name: "Joe's Original",label: "Songs played", image: "music.quarternote.3", value: "1031", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Songs loved", image: "heart.fill", value: "59", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Plays", image: "play.fill", value: "3619", unit: "Times"),
        Restaurant(name: "Joe's Original",label: "Time played", image: "stopwatch", value: "165:14", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Recently played", image: "timer", value: "134", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Skips", image: "forward.fill", value: "481", unit: ""),
        Restaurant(name: "Joe's Original",label: "Downloads", image: "icloud.and.arrow.down", value: "1031", unit: "Songs"),
        Restaurant(name: "Joe's Original",label: "Explicit", image: "e.square.fill", value: "293", unit: "Songs"),
        Restaurant(name: "Joe's Original The Real Joe's Original The Real Joe's Original The Real Joe's Original",label: "Genres", image: "guitars.fill", value: "7", unit: "Genres")
        ]
    
    var body: some View {
        VStack{
            HStack{
                Text("ToDo List")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
            }
            .padding(EdgeInsets(top: 40, leading: 16, bottom: 17, trailing: 16))
            
            Spacer()
            
            ScrollView {
                LazyVStack {
                    ForEach(restaurants, id: \.self) { restaurant in
//                        GroupBox(label: Label("Heart rate", systemImage: "heart.fill")) {
//                            RestaurantRow(restaurant: restaurant)
//                        }.groupBoxStyle(HealthGroupBoxStyle(color: .red, destination: Text("Heart rate")))
                        
//                        GroupBox(label:
//                                    Text("2021.1.12")
//                                    .font(.system(size: 15, weight: .bold, design: .rounded))
//                                    .foregroundColor(Color.gray)
//                        ) {
                            RestaurantRow(restaurant: restaurant)
//                        }
                        
                    }
                }
                .padding([.leading,.trailing], 16)
                .padding([.bottom], 80)
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action:{
                    self.isShowingMailView.toggle()
                })
                {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)//Color(UIColor.hex("FF4D6A"))
                        .font(.system(size: 20, weight: .bold, design: .default))
//                    Image(systemName: "plus.circle.fill")//chevron.right
//                        .resizable()
//                        .renderingMode(.template)
//                        .foregroundColor(.black)
//                        .frame(width: 30, height: 30)
//                        .padding(10)
//                        .background(Color.white)//Color(red:240/255,green:174/255,blue:243/255)
//                        .cornerRadius(10)
                    
                }
//                .buttonStyle(PlainButtonStyle())
//                .frame(width: 40, height: 40)
                .padding([.trailing], 24)
                .sheet(isPresented: $isShowingMailView) {
                    AddNoteView()
                }
                .shadow(color: Color(UIColor.hex("FF4D6A")).opacity(0.4), radius: 10, x: -10, y: -10)//.white
                .shadow(color: Color(red:174/255,green:174/255,blue:192/255).opacity(0.4), radius: 10, x: 10, y: 10)
                
                
            }
            
        }
        
    }

}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}


struct RestaurantRow: View {
    var restaurant: Restaurant
    @State var openSound = false
    @State var showDetail = false
    var body: some View {
        
        VStack {
            HStack{
                
                Button(action:{
                    openSound.toggle()
                })
                {
//                    Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
                    Image(openSound ? "checkbox_h" : "checkbox_n")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(openSound ? Color(UIColor.hex("FF4D6A")) : .gray)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .onTapGesture {
                            openSound.toggle()
                        }
                        
                    
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 24, height: 24)
                
                if openSound{
                    Text("Come and eat at \(restaurant.name)")
                        .foregroundColor(.gray)
                        .strikethrough()
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .padding(EdgeInsets(top: 17, leading: 16, bottom: 17, trailing: 16))
                }
               
                else{
                    Text("Come and eat at \(restaurant.name)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .padding(EdgeInsets(top: 17, leading: 16, bottom: 17, trailing: 16))
                }
                
                Spacer()
                
                Text("•••")
                    .foregroundColor(Color(UIColor.hex("FF4D6A")))
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .onTapGesture {
                        showDetail.toggle()
                    }.sheet(isPresented: $showDetail) {
                        
                    }

                 
            }
            
//            if showDetail{
//                RestaurantDetailRow(restaurant:restaurant)
//            }
        }
        
    }
}

struct RestaurantDetailRow: View {
    var restaurant: Restaurant
    @State var openSound = true
    var body: some View {
        HStack{
            
            Button(action:{
               
            })
            {
                //Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
                Image(openSound ? "checkbox_h_sub" : "checkbox_n_sub")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(openSound ? Color(UIColor.hex("FF4D6A")) : .gray)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .onTapGesture {
                        openSound.toggle()
                    }
                    
                
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 24, height: 24)
            .padding([.leading],48)
            
            Text("Come and eat at \(restaurant.name)")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .padding(EdgeInsets(top: 17, leading: 16, bottom: 17, trailing: 16))
            
            Spacer()
            
        }
        
    }
}

struct Restaurant: Identifiable,Hashable {
    var id = UUID()
    var name: String
    var label: String
    var image: String
    var value: String
    var unit: String
}
