//
//  AddNoteView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/18.
//

import SwiftUI

struct AddNoteView: View {
    @State var username = ""
    @State var nickname = ""
    var body: some View {
        VStack{
            HStack{
                Text("Add note")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                Spacer()
                
                Button(action:{
                    UIApplication.shared.endEditing()
                })
                {
                    Image(systemName: "checkmark.circle.fill" )
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(UIColor.hex("FF4D6A")))
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 24, height: 24)
            }
            .padding(EdgeInsets(top: 40, leading: 16, bottom: 17, trailing: 16))
            
            
            TextField("User Name", text: $username, onEditingChanged: { (value) in
                print("onEditingChanged:\(self.username)")
            }) {
                print("onCommit:\(self.username)")
            }
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .padding()
            //.textFieldStyle(RoundedBorderTextFieldStyle())
//            .textFieldStyle(SuperCustomTextFieldStyle())
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(height: 54)
                )
            .frame(height: 64)
            .padding()
               
            
            Spacer()
        }
    }
}

struct SuperCustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .border(Color.accentColor)
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
