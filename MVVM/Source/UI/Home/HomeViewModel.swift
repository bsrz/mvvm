import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {

    // MARK: - Lifecycle

    init(responder: Responder<ResponderAction>) {
        self.responder = responder
    }

    // MARK: - Responder

    enum ResponderAction {
        case logout
    }

    private let responder: Responder<ResponderAction>

    // MARK: - Input

    enum Action {
        case settings
    }

    func send(_ action: Action) {
        switch action {
        case .settings:
            withAnimation {
                self.state = .settings(
                    SettingsViewModel(
                        responder: .init { action in
                            switch action {
                            case .logout:
                                self.responder.send(.logout)
                            }
                        }
                    )
                )
            }
        }
    }

    // MARK: - Output

    enum State {
        case idle
        case settings(SettingsViewModel)
    }

    @Published private(set) var state: State = .idle
}
