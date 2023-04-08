/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            // アイコン
            Image(systemName: event.symbol)
                .sfSymbolStyling()
                .foregroundStyle(event.color)
            
            VStack(alignment: .leading, spacing: 5) {
                // イベントタイトル
                Text(event.title)
                    .fontWeight(.bold)
                
                // イベント時間
                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            // タスクが全て完了していたらチェックアイコン表示
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
            
        }
        // リマインドされているタスク数（未完了のタスク）
        .badge(event.remainingTaskCount)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event.example)
    }
}
