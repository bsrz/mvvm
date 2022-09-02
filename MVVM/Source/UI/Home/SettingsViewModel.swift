import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject, Identifiable {

    // MARK: - Properties

    var id: String { .init(describing: Self.self) }

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
        case logout
    }

    func send(_ action: Action) {
        switch action {
        case .logout:
            responder.send(.logout)
        }
    }
}
