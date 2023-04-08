/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

/* イベントの編集画面 */
struct EventEditor: View {
    @Binding var event: Event
    // 新規追加フラグ
    var isNew = false
    @State private var isDeleted = false
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    // Keep a local copy in case we make edits, so we don't disrupt the list of events.
    // This is important for when the date changes and puts the event in a different section.
    @State private var eventCopy = Event()
    @State private var isEditing = false
    
    private var isEventDeleted: Bool {
        !eventData.exists(event) && !isNew
    }
    
    var body: some View {
        VStack {
            EventDetail(event: $eventCopy, isEditing: isNew ? true : isEditing)
                .toolbar {
                    // tool-barのボタン
                    ToolbarItem(placement: .cancellationAction) {
                        // 新規の場合はbotton-sheetを閉じるボタンを表示する
                        if isNew {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                    
                    // tool-barのボタン
                    ToolbarItem {
                        Button {
                            // 新規の場合はbotton-sheetを閉じるボタンを表示する
                            if isNew {
                                // イベントデータに新規追加する
                                eventData.events.append(eventCopy)
                                dismiss()
                            } else {
                                // 編集の場合は、
                                if isEditing && !isDeleted {
                                    print("Done, saving any changes to \(event.title).")
                                    withAnimation {
                                        event = eventCopy // Put edits (if any) back in the store.
                                    }
                                }
                                isEditing.toggle()
                            }
                        } label: {
                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                        }
                    }
                }
                .onAppear {
                    eventCopy = event // Grab a copy in case we decide to make edits.
                }
                .disabled(isEventDeleted)

            // 編集画面の場合
            if isEditing && !isNew {
                Button(role: .destructive, action: {
                    isDeleted = true
                    dismiss()
                    eventData.delete(event)
                }, label: {
                    Label("Delete Event", systemImage: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }).padding()
            }
        }
        // イベントを削除する
        .overlay(alignment: .center) {
            if isEventDeleted {
                Color(UIColor.systemBackground)
                Text("Event Deleted. Select an Event.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct EventEditor_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(event: .constant(Event()))
    }
}
