//
//  TabScreen.swift
//  Choose Your Own Story
//
//  Created by 宮原将太 on 2023/04/08.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView {
            StoryView()
                .tabItem {
                   Label("My Story 1", systemImage: "person")
                }
            
            StoryView()
                .tabItem {
                   Label("My Story 2", systemImage: "person")
                }
        }
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}
