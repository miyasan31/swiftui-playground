/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

// Viewクラスを使って画面を構築する
struct ContentView: View {
    // Viewクラスはbodyを定義する
    var body: some View {
        /*
         ①1画面だけ表示する場合
         */
        // HomeView()
        
        /*
         ②BottomTabの画面を表示する場合
         */
        // BottomTabを定義できる
        TabView {
            // タブに設定するViewクラスを定義する
            HomeView()
            // タブのラベルを定義する
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
