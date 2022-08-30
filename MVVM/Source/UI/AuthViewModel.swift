import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {

    // MARK: - Input

    enum Action {
        case authenticate(String, String)
    }

    func send(_ action: Action) {
        set(error: nil)

        switch action {
        case .authenticate(let username, let password):
            guard username.isEmpty == false else {
                return set(error: "Username cannot be empty")
            }

            guard password.isEmpty == false else {
                return set(error: "Password cannot be empty")
            }

            // 1. make network call
            // 2. handle errors
            // 3. tell parent
        }
    }

    // MARK: - Output

    @Published private(set) var error: Error?

    // MARK: - Private / Support

    private func set(error: Error?) {
        withAnimation { self.error = error }
    }

}
