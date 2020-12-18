//
//  VideoPlayerView.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/15.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    private let player = AVPlayer(url:  Bundle.main.url(forResource: "squarevideo", withExtension: "mp4")!)//AVPlayer(url: URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!)
        
    var body: some View {
        VideoPlayer(player: player){
//        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "squarevideo", withExtension: "mp4")!)){
            VStack {
                Text("Watermark")
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                Spacer()
            }
        }.onAppear() {
            player.play()
            
        }
       
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
