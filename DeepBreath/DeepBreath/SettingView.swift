//
//  SettingView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/4.
//

import SwiftUI

struct SettingView: View {
    @State var money = "0"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Make Payment")
            .font(Font.system(size: 24)).bold()
                .foregroundColor(Color.red)
            
            HStack{
                Text("Pay with")
                .font(Font.system(size: 18)).bold()
                .foregroundColor(Color.red)
                
                Image("zelle_icon")
                
                Text("to approve")
                .font(Font.system(size: 18)).bold()
                .foregroundColor(Color.red)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Text("Email or mobile")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                    
                    Spacer()
                }
                
                Text("9258907778")
                .font(Font.system(size: 18)).bold()
                .foregroundColor(Color.red)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            }
            .frame(width: 300-60)
            .background(Color.red)
            .cornerRadius(4)
            
            
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Text("Recipient’s name (Fisrt name)")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                    Spacer()
                }
                
                Text("EANOVATION INC")
                    .font(Font.system(size: 18)).bold()
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            }
            .frame(width: 300-60)
            .background(Color.red)
            .cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Text("Send to EANOVATION INC")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                    Spacer()
                }
                
                Text("$" + self.money)
                    .font(Font.system(size: 18)).bold()
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            }
            .frame(width: 300-60)
            .background(Color.red)
            .cornerRadius(4)
            
            Text("Send check to approve")
            .font(Font.system(size: 18)).bold()
            .foregroundColor(Color.red)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Pay to the order of")
                    .font(Font.system(size: 18)).bold()
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
                HStack{
                    Text("Eanovation.Inc")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                    
                    Spacer()
                    
                    Text("$" + self.money)
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                HStack{
                    Text("Two eighty")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                    
                    Spacer()
                    
                    Text("Dollars")
                        .font(Font.system(size: 18)).bold()
                        .foregroundColor(Color.red)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
               
                Text("400 Concar Dr,\nSan Mateo, CA, 94402")
                .font(Font.system(size: 18)).bold()
                .foregroundColor(Color.red)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
             
            }.background(Color.red)
            .cornerRadius(4)
            
            
            Button(action: {
                self.paymentConfirm()
            }) {
                Text("Check is sent")
                    .font(Font.system(size: 14)).bold()
                    .foregroundColor(Color.white)
                    .frame( height: 40)
                    .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                    .background(Rectangle()
                        .fill(Color.red))
                    .cornerRadius(4)
            }.buttonStyle(PlainButtonStyle())
            
            
            Text("By clicking at this button, you agree to our Terms of use, and have paid the amount requested.")
            .font(Font.system(size: 12))
            .foregroundColor(Color.red)
            
        }
        .frame(height:UIScreen.main.bounds.height)//let SCREEN_HEIGHT = UIScreen.main.bounds.height
        .background(RoundedRectangle(cornerRadius: 27).fill(Color.white.opacity(1)))
        .edgesIgnoringSafeArea(.all)
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .onTapGesture {
            
        }
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.55, execute:{
            self.showBisCuitView()
        })
    }
    
    func showBisCuitView(){
        let label = ToppingLabel(text: "$" + self.money + "💰")
        let biscuit = BiscuitViewController(title: "Paid", toppings: [label], timeout: 1.5)
//        currentViewController()?.present(biscuit, animated: true, completion: nil)
    }
    
    func paymentConfirm() {
//        let url = "project/progress/payment_confirm/"
//        print(url)
//        let param = ["labor_id": self.LaborDict["id"].intValue , "category":self.dict["category_id"].stringValue] as [String : Any]
//        print(param)
//        NetworkTool.makePostRequest(baseUrl: url, parameters: param, successHandler: { (_ dict) in
//            print(dict)
//               self.dismiss()
//        }, errorMsgHandler: { (_ errorMsg) in
//            print(errorMsg)
//            HUDShowText(errorMsg)
//        }) { (error) in
//            print(error)
//        }
        
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
