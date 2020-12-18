//
//  DBreathHoldView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathHoldView: View {
    @Binding var secondCount : Double
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 18
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timer1 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Binding var stepFinish : Int
    @State var flowerViewDegrees = 0.0
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<18) { section in
                HStack(spacing: 15) {
                    ForEach(0..<11) {_ in
                        
                        LoadingFlowersView()
                            .foregroundColor(self.currentRow <= section ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                            .rotationEffect(.degrees(flowerViewDegrees))
                        
                    }
                }
            }
        }
        .onAppear{
            flowerViewDegrees = 45.0
            stepFinish = 1
            secondCount = 0
            self.timer2 = Timer.publish(every: (timerSettings.stepTwo / Double(currentRow)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            
            if self.currentRow < 0{
                self.timer2.upstream.connect().cancel()
                self.timer1.upstream.connect().cancel()
                
                sleep(UInt32(0.25))
                stepFinish = 2
            }
            self.currentRow -= 1
        }
        
        .onReceive(timer1) { currentTime in
            self.secondCount += 1
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
