/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct TaskRow: View {
    // 双方向バインディング的な？入力とステートが紐づく
    @Binding var task: EventTask
    
    // 親から渡ってくる
    var isEditing: Bool
    
    //
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            // チェックボタン
            Button {
                // チェックボタンのイベント
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)

            // 新規フラグ&編集フラグがある場合は、入力フォームに変更する
            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    // フォーカスされている時にイベントを流す
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }

            } else {
                Text(task.text)
            }

            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            // 新規だったらフォーカスする
            if task.isNew {
                isFocused = true
            }
        }
    }
        
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: .constant(EventTask(text: "Do something!")), isEditing: false)
    }
}
