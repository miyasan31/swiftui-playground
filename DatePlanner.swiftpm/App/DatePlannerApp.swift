/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

@main
struct DatePlannerApp: App {
    @StateObject private var eventData = EventData()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                // iPadなどの画面幅が大きい時に表示される
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)

        }
    }
}
