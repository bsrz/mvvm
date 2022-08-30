import Foundation
import SwiftUI

class AppViewModel: ObservableObject {

    // MARK: - Input

    enum Action {
        case onAppear
        case authenticate
        case goHome
    }

    func send(_ action: Action) {
        switch action {
        case .onAppear:
            // Normally we'd determine if the user is already authenticated here.
            // For now, we'll just assume they need to authenticate at every launch.
            send(.authenticate)

        case .authenticate:
            set(state: .auth(
                AuthViewModel(responder: .init { action in
                    switch action {
                    case .success:
                        self.send(.goHome)
                    }
                })
            ))

        case .goHome:
            set(state: .home(
                HomeViewModel(responder: .init { action in
                    switch action {
                    case .logout:
                        self.send(.authenticate)
                    }
                })
            ))
        }
    }

    // MARK: - Output

    enum State {
        case idle
        case auth(AuthViewModel)
        case home(HomeViewModel)
    }

    @Published private(set) var state: State = .idle

    // MARK: - Private / Support

    private func set(state: State) {
        withAnimation { self.state = state }
    }
}
