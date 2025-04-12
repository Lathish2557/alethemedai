import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var isDarkMode = false
    @State private var selectedFont = "System"
    @State private var showLogoutAlert = false

    let fonts = ["System", "Rounded", "Monospaced"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Profile Picture
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .shadow(radius: 5)

                        Text("Lathish")
                            .font(.title2).bold()
                        Text("Registered Nurse")
                            .foregroundColor(.gray)
                    }
                    .padding(.top)

                    Toggle(isOn: $isDarkMode) {
                        HStack {
                            Image(systemName: "moon.fill")
                            Text("Dark Mode")
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Preferred Font")
                            .font(.headline)
                            .padding(.horizontal)

                        Picker("Font", selection: $selectedFont) {
                            ForEach(fonts, id: \.self) { font in
                                Text(font)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                    }

                    Button(action: {
                        print("Change password tapped")
                    }) {
                        HStack {
                            Image(systemName: "key.fill")
                            Text("Change Password")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    Button(role: .destructive) {
                        showLogoutAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "arrow.right.square.fill")
                            Text("Logout")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .alert(isPresented: $showLogoutAlert) {
                        Alert(
                            title: Text("Are you sure?"),
                            message: Text("You will be logged out."),
                            primaryButton: .destructive(Text("Logout")) {
                                withAnimation {
                                    appState.isLoggedIn = false
                                }
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Profile")
            .background(
                LinearGradient(colors: [.white, Color.cyan.opacity(0.1)],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
            )
        }
    }
}
