//
//  DBreathExhaleView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathExhaleView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 0
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var stepFinish : Int
    var body: some View {
        VStack(spacing: 25) {
            ForEach(0..<16) { number in
                HStack(spacing: 25) {
                    ForEach(0..<10) {_ in
                        
                        flowerViewOut()
                            .foregroundColor(self.currentRow <= number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                            .frame(width: 12, height: 12)
                            .animation(
                                Animation.easeInOut(duration: 0.35)
                                    .delay(0.25)
                            )
                            .rotationEffect(.degrees(45))
                        
                    }
                }
            }
        }
        .onAppear{
            stepFinish = 2
            self.timer2 = Timer.publish(every: (timerSettings.stepThree / Double(13)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            if self.currentRow > 13{
                self.timer2.upstream.connect().cancel()
                sleep(UInt32(0.5))
                stepFinish = 3
            }
            self.currentRow += 1
        }
    }
}

//struct DBreathExhaleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DBreathExhaleView()
//    }
//}
