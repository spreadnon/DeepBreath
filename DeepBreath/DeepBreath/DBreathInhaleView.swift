//
//  DBreathInhaleView.swift
//  DeepBreath
//
//  Created by jeremy on 2020/12/6.
//

import SwiftUI

struct DBreathInhaleView: View {
    @Binding var secondCount : Double
    @Binding var stepFinish : Int
    
    @EnvironmentObject var timerSettings: TimerSettings
    @State var currentRow = 18
    @State var timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timer1 = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<18) { section in
                HStack(spacing: 15) {
                    ForEach(0..<11) {_ in
                        LoadingFlowersView()
                            .foregroundColor(self.currentRow <= section ? Color(UIColor.hex("D8D8D7")) : Color(UIColor.hex("5A5E61")))
                    }
                }
            }
            
            Text(String.timestamp())
        }
        .onAppear{
            stepFinish = 0
            secondCount = 0
            self.timer2 = Timer.publish(every: (timerSettings.stepOne / Double(currentRow)), on: .main, in: .common).autoconnect()
        }
        .onReceive(timer2) { currentTime in
            print(currentTime)
            
            if self.currentRow < 0{
                self.timer2.upstream.connect().cancel()
                self.timer1.upstream.connect().cancel()
                sleep(UInt32(0.25))
                stepFinish = 1
            }
            self.currentRow -= 1
            
            self.secondCount += Double((timerSettings.stepOne / Double(currentRow)))
        }
        .onReceive(timer1) { currentTime in
            print(currentTime)

//            self.secondCount += 1
        }
    }
    
    
}

extension String {
    static func timestamp() -> String {
        let dateFMT = DateFormatter()
        dateFMT.locale = Locale(identifier: "en_US_POSIX")
        dateFMT.dateFormat = "s"
        let now = Date()

        return String(format: "%@", dateFMT.string(from: now))
    }

    func tad2Date() -> Date? {
        let dateFMT = DateFormatter()
        dateFMT.locale = Locale(identifier: "en_US_POSIX")
        dateFMT.dateFormat = "yyyyMMdd'T'HHmmss.SSSS"

        return dateFMT.date(from: self)
    }
}

struct LoadingFlowersView: View {
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 4){
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 2, height: 6)
                
                RoundedRectangle(cornerRadius: 2)
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


struct InhaleFlowerView: View {
    
    var body: some View {
        //        ZStack{
        VStack{
            Rectangle()
                .frame(width: 2.5)//, height: 8
                .cornerRadius(1.25)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Rectangle()
                .frame(width: 1, height: 1)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Rectangle()
                .frame(width: 2.5)//, height: 8
                .cornerRadius(1.25)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
        }
        .frame(width: 12, height: 12)
        //            .background(Color.pink)
        
        //            HStack{
        //                Rectangle()
        //                    .frame(width: 6, height: 3)
        //                    .cornerRadius(4)
        //
        //                Rectangle()
        //                    .frame(width: 6, height: 3)
        //                    .cornerRadius(4)
        //
        //            }
        //        }
    }
}

//struct DBreathInhaleView_Previews: PreviewProvider {
//    static var previews: some View {
//        DBreathInhaleView(stepFinish: 1).environmentObject(TimerSettings())
//    }
//}
