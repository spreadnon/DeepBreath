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
    
   
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
