import SwiftUI

struct AuthView: View {

    @State private var username = ""
    @State private var password = ""

    @StateObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "swift")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Auth")
                    .font(.largeTitle)
            }

            List {
                Section {
                    HStack(spacing: 10) {
                        Text("Username:")
                        TextField("Username", text: $username)
                    }
                    HStack(spacing: 10) {
                        Text("Password:")
                        TextField("Password", text: $password)
                    }
                }

                Section {
                    Button("Log In") {
                        viewModel.send(.authenticate(username, password))
                    }
                }

                if let error = viewModel.error {
                    Section("💥 uh oh!") {
                        Text("\(String(describing: error))")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: .init(responder: .noop))
    }
}
