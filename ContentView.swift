import SwiftUI
import UIKit

class AppState: ObservableObject {
    @Published var isLoggedIn = false
}

struct ContentView: View {
    @StateObject private var appState = AppState()
    @State private var nurseID: String = ""
    @State private var password: String = ""

    var body: some View {
        if appState.isLoggedIn {
            MainTabView()
                .environmentObject(appState)  // Share with all views
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.8)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("UrbanCare AI")
                        .font(.system(size: 38, weight: .heavy))
                        .foregroundColor(.white)
                        .shadow(radius: 10)

                    VStack(spacing: 20) {
                        TextField("Username", text: $nurseID)
                            .padding()
                            .background(BlurView(style: .systemThinMaterial))
                            .cornerRadius(14)
                            .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 3)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(BlurView(style: .systemThinMaterial))
                            .cornerRadius(14)
                            .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 3)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        if nurseID == "Lathish" && password == "password" {
                            withAnimation {
                                appState.isLoggedIn = true
                            }
                        }
                    }) {
                        Text("Login")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(colors: [.green, .mint], startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 8)
                    }
                    .padding(.horizontal, 40)
                }
                .padding()
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    ContentView()
}
