import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }
                .tag(0)
            
            PatientsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Patients")
                }
                .tag(1)
            
            NearbyView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Nearby")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: "bell.badge.fill")
                    Text("Activity")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.purple)
        .animation(.easeInOut(duration: 0.3), value: selectedTab)
    }
}

#Preview {
    MainTabView()
}

