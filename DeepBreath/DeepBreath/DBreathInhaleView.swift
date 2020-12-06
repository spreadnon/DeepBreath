//
//  DBreathInhaleView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathInhaleView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 13
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var stepFinish : Int
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(0..<13) { section in
                HStack(spacing: 25) {
                    ForEach(0..<10) { row in
                        
                        flowerView()
                            .foregroundColor(self.currentRow <= section ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                            .frame(width: 12, height: 12)
                            .animation(
                                Animation.easeInOut(duration: 0.35)
                                    .delay(0.25)
                            )
                        
                    }
                }
            }
        }
        .onAppear{
            stepFinish = 0
            self.timer2 = Timer.publish(every: (timerSettings.stepOne / Double(currentRow)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            
            
            
            if self.currentRow < 0{
                self.timer2.upstream.connect().cancel()
                sleep(1)
                stepFinish = 1
            }
            self.currentRow -= 1
        }
    }
}



//struct DBreathInhaleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DBreathInhaleView(stepFinish: 1).environmentObject(TimerSettings())
//    }
//}
