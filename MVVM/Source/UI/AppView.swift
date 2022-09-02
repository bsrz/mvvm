import SwiftUI

struct AppView: View {

    @StateObject var viewModel: AppViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                Text("Getting Ready")

            case .options(let viewModel):
                AuthOptionsView(viewModel: viewModel)

            case .auth(let viewModel):
                AuthView(viewModel: viewModel)

            case .onboarding(let viewModel):
                OnboardingView(viewModel: viewModel)

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
    static let viewModel = AppViewModel()
    static var previews: some View {
        AppView(viewModel: viewModel)
            .onAppear { viewModel.send(.goHome) }
    }
}
