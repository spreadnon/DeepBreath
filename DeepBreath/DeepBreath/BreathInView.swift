//
//  BreathInView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/4.
//

import SwiftUI

struct BreathInView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 13
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(0..<13) { number in
                HStack(spacing: 25) {
                    ForEach(0..<10) {_ in
                        
                        flowerView()
                            .foregroundColor(self.currentRow < number ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
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
            self.timer2 = Timer.publish(every: (timerSettings.stepOne / Double(currentRow)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            if self.currentRow == 0{
                self.timer2.upstream.connect().cancel()
                sleep(1)
            }
            self.currentRow -= 1
        }
    }
    
}

struct BreathInView_Previews: PreviewProvider {
    static var previews: some View {
        BreathInView()
    }
}
