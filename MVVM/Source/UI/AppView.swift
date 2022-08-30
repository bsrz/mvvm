import SwiftUI

struct AppView: View {

    @StateObject var viewModel = AppViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Text("Getting Ready")

            case .auth(let viewModel):
                AuthView(viewModel: viewModel)

            case .home(let viewModel):
                HomeView(viewModel: viewModel)
            }
        }
        .onAppear {
            viewModel.send(.onAppear)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
