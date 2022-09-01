import SwiftUI

struct StringCaptureView: View {

    @State private var firstName = ""

    let textPlaceholder: String
    let buttonTitle: String

    @StateObject var viewModel: StringCaptureViewModel

    var body: some View {
        VStack {
            TextField(textPlaceholder, text: $firstName)

            Button(buttonTitle) {
                viewModel.send(.save(firstName))
            }

            Spacer()
        }
        .padding()
    }
}

struct StringCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        StringCaptureView(
            textPlaceholder: "Foo",
            buttonTitle: "Bar",
            viewModel: .init(responder: .noop)
        )
    }
}
