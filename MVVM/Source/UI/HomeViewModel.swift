import Foundation

class HomeViewModel: ObservableObject {

    // MARK: - Input

    enum Action {
        case logout
    }

    func send(_ action: Action) {
        switch action {
        case .logout:
            // 1. tell parent
            break
        }
    }
}
