//
//  DBreathHoldView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathHoldView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 13
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timer3 = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    @Binding var stepFinish : Int
    @State var rowNumber = 0
    @State var sectionNumber = 0
    @State var flowerViewDegrees = 0.0
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(0..<16) { section in
                HStack(spacing: 25) {
                    ForEach(0..<8) { row in
                        
                        flowerView()
//                            .foregroundColor(self.currentRow <= section ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                            .foregroundColor((rowNumber == row || sectionNumber == section ) ? Color(UIColor.hex("5A5E61")) : Color(UIColor.hex("D8D8D7")))
                            .frame(width: 12, height: 12)
                            .animation(
                                Animation.easeInOut(duration: 0.35)
                                    .delay(0.25)
                            )
                            .rotationEffect(.degrees(flowerViewDegrees))
                        
                    }
                }
            }
        }
        .onAppear{
            flowerViewDegrees = 45.0
            stepFinish = 1
            self.timer2 = Timer.publish(every: (timerSettings.stepTwo / Double(currentRow)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            
            if self.currentRow < 0{
                self.timer2.upstream.connect().cancel()
                self.timer3.upstream.connect().cancel()
                
                sleep(UInt32(0.25))
                stepFinish = 2
            }
            self.currentRow -= 1
        }
        
        .onReceive(timer3) { currentTime in
            
            
            sectionNumber = getRandom(bigest: 13)
            rowNumber = getRandom(bigest: 10)
        }
    }
}

func getRandom(bigest:Int)->Int{
    //1:下面是使用arc4random函数求一个1~100的随机数（包括1和100）
    let randomNumber:Int = Int(arc4random() % UInt32(bigest))
    print(randomNumber)
    return randomNumber
}

//struct DBreathHoldView_Previews: PreviewProvider {
//    static var previews: some View {
//        DBreathHoldView()
//    }
//}
