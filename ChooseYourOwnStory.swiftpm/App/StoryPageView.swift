/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct StoryPageView: View {

    let story: Story
    
    let pageIndex: Int

    var body: some View {
        VStack {
            ScrollView {
                Text(story[pageIndex].text)
            }
            
            // idは一意に識別するたのkey（ReactのKey、AngularのtrackByFn()と同じ感じ）
            ForEach(story[pageIndex].choices, id: \Choice.text) {
                // ForEach(XXX)のXXXを参照できるもの
                choice in
                
                // Viewのインスタンスを呼び出す感じかな？
                NavigationLink(
                    destination: StoryPageView(story: story, pageIndex: choice.destination)
                ) {
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(Color.pink.opacity(0.6))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        // ページのタイトルをヘッダーに固定
         .navigationBarTitleDisplayMode(.inline)
        // ページのタイトルをスクリーン内に入れるか
        // .navigationBarTitleDisplayMode(.large)
        // ページのタイトルをスクリーン内に入れるか
        // .navigationBarTitleDisplayMode(.automatic)
    }
}

struct NonlinearStory_Previews: PreviewProvider {
    static var previews: some View {
        // ここでページ番号を初期化している
        StoryPageView(story: story, pageIndex: 0)
    }
}
