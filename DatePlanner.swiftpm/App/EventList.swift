/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct EventList: View {
    // トップレベルのナビゲーションに定義すると、子View全てからアクセスができる
    @EnvironmentObject var eventData: EventData
    // bottom-sheetが開いているかのフラグ
    @State private var isAddingNewEvent = false
    // 新規イベントデータのインスタンス
    @State private var newEvent = Event()
    
    var body: some View {
        
        // リストView
        List {
            ForEach(Period.allCases) {
                period in
                
                if !eventData.sortedEvents(period: period).isEmpty {
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) {
                            $event in
                            
                            // イベント編集Viewに遷移する
                            NavigationLink {
                                EventEditor(event: $event)
                            } label: {
                                EventRow(event: event)
                            }
                            // スワイプアクション追加
                            .swipeActions {
                                // 削除イベントを仕込んだボタンを配置
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    },
                    // セクション名
                    header: {
                        // 期間毎のセクション名が表示される
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
        }
        // ナビゲーションタイトル
        .navigationTitle("Date Planner")
        .toolbar {
            // ナビゲーションタイトル
            ToolbarItem {
                Button {
                    newEvent = Event()
                    isAddingNewEvent = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        /*
         イベント編集Viewに遷移する
         toolbarの+ボタンをクリックすると、isAddingNewEventフラグがtrueになってsheetが表示される。EventEditorのインスタンスを呼び出し。
         sheetを使うとbotton-sheetになって下から出てくる
        */
        .sheet(isPresented: $isAddingNewEvent) {
            NavigationView {
                EventEditor(event: $newEvent, isNew: true) // 新規追加フラグ
            }
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventList().environmentObject(EventData())

        }
    }
}
