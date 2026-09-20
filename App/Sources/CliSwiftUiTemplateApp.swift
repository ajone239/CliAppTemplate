import SwiftUI
import TemplateCore

@main
struct CliSwiftUiTemplateApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @State private var summary = "Loading…"

    var body: some View {
        VStack {
            TestView()
            Text(TemplateLibFunc())
            Text(summary)
                .task {
                    summary = "Loaded B)"
                }
        }
    }
}
