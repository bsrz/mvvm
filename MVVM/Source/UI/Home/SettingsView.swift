import SwiftUI

struct SettingsView: View {

    @StateObject var viewModel: SettingsViewModel

    var body: some View {
        VStack {
            Text("Settings")
            Button("Log out") {
                viewModel.send(.logout)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init(responder: .noop))
    }
}
