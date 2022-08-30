struct Responder<Action> {
    var send: (Action) -> Void
}

extension Responder {
    static var noop: Self { .init { _ in } }
}
