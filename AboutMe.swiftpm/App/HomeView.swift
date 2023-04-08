/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView() {
            Text("Font weight is black")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding()
            
            Text("Font weight is blod")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Font weight is heavy")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            
            Text("Font weight is thin")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding()
            
            Text("Font weight is ultraLight")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .padding()

            // Data.swiftから参照している
            Image(information.image)
                // 設定しないと画面幅いっぱいになる
                .resizable()
                // .aspectRatio(contentMode: .fill) // アスペクト比を設定する）
                 .aspectRatio(contentMode: .fit) // 横幅に合わせる
                .cornerRadius(1000) // borderRadius
                .padding(40)

            Text(information.name)
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
