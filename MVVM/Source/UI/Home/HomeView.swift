import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    @State private var isPresentingSettings: SettingsViewModel?

    var body: some View {
        VStack {
            Text("Home")
            Button("Settings") {
                viewModel.send(.settings)
            }
        }
        .sheet(item: $isPresentingSettings) {
            SettingsView(viewModel: $0)
        }
        .onReceive(viewModel.$state) { state in
            switch state {
            case .idle:
                break

            case .settings(let viewModel):
                self.isPresentingSettings = viewModel
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(responder: .noop))
    }
}
