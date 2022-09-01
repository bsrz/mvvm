import Foundation
import SwiftUI

class AppViewModel: ObservableObject {

    // MARK: - Input

    enum Action {
        case onAppear
        case options
        case authenticate
        case onboarding
        case goHome
    }

    func send(_ action: Action) {
        switch action {
        case .onAppear:
            // Normally we'd determine if the user is already authenticated here.
            // For now, we'll just assume they need to authenticate at every launch.
            send(.options)

        case .options:
            set(state: .options(
                AuthOptionsViewModel(
                    responder: .init { action in
                        switch action {
                        case .signIn:
                            self.send(.authenticate)

                        case .signUp:
                            self.send(.onboarding)
                        }
                    }
                )
            ))


        case .authenticate:
            set(state: .auth(
                AuthViewModel(responder: .init { action in
                    switch action {
                    case .back:
                        self.send(.options)

                    case .success:
                        self.send(.goHome)
                    }
                })
            ))

        case .onboarding:
            set(state: .onboarding(
                OnboardingViewModel(
                    responder: .init { action in
                        switch action {
                        case .back:
                            self.send(.options)

                        case .success:
                            self.send(.goHome)
                        }
                    }
                )
            ))

        case .goHome:
            set(state: .home(
                HomeViewModel(responder: .init { action in
                    switch action {
                    case .logout:
                        self.send(.options)
                    }
                })
            ))
        }
    }

    // MARK: - Output

    enum State {
        case idle
        case options(AuthOptionsViewModel)
        case auth(AuthViewModel)
        case home(HomeViewModel)
        case onboarding(OnboardingViewModel)
    }

    @Published private(set) var state: State = .idle

    // MARK: - Private / Support

    private func set(state: State) {
        withAnimation { self.state = state }
    }
}
