//
//  DeepBreathApp.swift
//  DeepBreath
//
//  Created by iOS123 on 2020/12/2.
//

import SwiftUI

@main
struct DeepBreathApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView().environmentObject(TimerSettings())
//            PathsView()
//            DBreathHomeView()
//            DBreathPopView()
//            VideoPlayerView()
//            DBreathViewControllerView()
            TodoListView()
//            TodoListView(router: ListRouter(usingStackNav: true))
                .statusBar(hidden: true)
                .preferredColorScheme(.dark)
//            rrrtView()
        }
    }
}

struct rrrtView: View {
    var body: some View {
        Text("Hello, world!")
            .background(Color.yellow)
            .font(.title)
            .dump()
    }
}

extension View {
    func dump() -> Self {
        print(Mirror(reflecting: self))
        return self
    }
}
