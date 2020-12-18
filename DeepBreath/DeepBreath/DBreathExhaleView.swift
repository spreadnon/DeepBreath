//
//  DBreathExhaleView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathExhaleView: View {
    @Binding var secondCount : Double
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 0
    @State var timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var stepFinish : Int
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<18) { section in
                HStack(spacing: 15) {
                    ForEach(0..<11) {_ in
                        
                        FlowersExhaleView()
                            .foregroundColor(self.currentRow <= section ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                        
                    }
                }
            }
        }
        
        .onAppear{
            stepFinish = 2
            secondCount = 0
            self.timer2 = Timer.publish(every: (timerSettings.stepThree / Double(18)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            if self.currentRow > 18{
                self.timer2.upstream.connect().cancel()
                sleep(UInt32(0.5))
                stepFinish = 3
            }
            self.currentRow += 1
        }
        .onReceive(timer1) { currentTime in
            print(currentTime)
            self.secondCount += 1
        }
    }
}

struct FlowersExhaleView: View {

    var body: some View {
        ZStack {

            VStack(spacing: 4){
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.clear, lineWidth: 0)
                    .frame(width: 2, height: 6)

                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.clear, lineWidth: 0)
                    .frame(width: 2, height: 6)
            }
            HStack(spacing: 4){
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 6, height: 2)
                
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 6, height: 2)
            }
          
        }
      
    }
}

//struct DBreathExhaleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DBreathExhaleView()
//    }
//}
