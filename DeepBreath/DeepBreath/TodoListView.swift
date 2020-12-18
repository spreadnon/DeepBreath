//
//  TodoListView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/18.
//

import SwiftUI

struct TodoListView: View {
    @State var isShowingMailView = false
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original The Real Joe's Original The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let restaurants = [first, second, third]

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
                        RestaurantRow(restaurant: restaurant)
                        
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
                        .foregroundColor(Color(UIColor.hex("FF4D6A")))
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 40, height: 40)
                .padding([.trailing], 24)
                .sheet(isPresented: $isShowingMailView) {
                    AddNoteView()
                }
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
                    Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
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
//
//                Button(action:{
//                    showDetail.toggle()
//                })
//                {
//                    Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                        .foregroundColor(openSound ? Color(UIColor.hex("FF4D6A")) : .gray)
//                        .font(.system(size: 20, weight: .bold, design: .default))
//                        .onTapGesture {
//                            showDetail.toggle()
//                        }
//
//
//                }
//                .buttonStyle(PlainButtonStyle())
//                .frame(width: 24, height: 24)
                
                moreView()
                    .frame( height: 60)
                    .onTapGesture {
                        showDetail.toggle()
                    }
                 
            }
            
            if showDetail{
                RestaurantDetailRow(restaurant:restaurant)
                    
            }
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
                Image(systemName: openSound ? "checkmark.circle.fill" : "circle")
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

struct moreView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(Color(UIColor.hex("FF4D6A")))
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(Color(UIColor.hex("FF4D6A")))
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(Color(UIColor.hex("FF4D6A")))
        }
    }
}

struct Restaurant: Identifiable,Hashable {
    var id = UUID()
    var name: String
}
