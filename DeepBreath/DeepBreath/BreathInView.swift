//
//  BreathInView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/4.
//

import SwiftUI

struct BreathInView: View {
    @EnvironmentObject var timerSettings: TimerSettings
    
    @State var seconds = 0.0
    @State var timer: Timer? = nil
    @State var timerRuning = false
    @State var currentRow = 15
    @State var timeInterval = 0.17
    
    var body: some View {
        ForEach(0..<15) { number in
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
        }.onAppear{
            startTimer()
        }
    }
    
    func startTimer(){
        timerRuning = true
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true){ tempTimer in
            
            seconds += 0.17
            
            if seconds >= 4{//timerSettings.stepOne{
                
                stopTimer()
                sleep(1)
            }
            
            print("当前seconds是 \(self.seconds)")
            self.currentRow -= 1
            
        }
    }
    
    func stopTimer(){
        timerRuning = false
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer(){
        seconds = 0
    }
}

struct BreathInView_Previews: PreviewProvider {
    static var previews: some View {
        BreathInView()
    }
}
