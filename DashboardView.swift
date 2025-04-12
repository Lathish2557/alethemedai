import SwiftUI

struct DashboardView: View {
    var completedTasks = 12
    var ongoingTasks = 3
    var currentPatients = 5
    var nextVisitTime = "3:30 PM"
    var nextPatientName = "Emma Watson"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {

                    Text("Welcome back 👋")
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    // Summary Cards
                    HStack(spacing: 20) {
                        DashboardCard(title: "Completed", value: "\(completedTasks)", icon: "checkmark.circle.fill", color: .green)
                        DashboardCard(title: "Ongoing", value: "\(ongoingTasks)", icon: "clock.fill", color: .orange)
                    }
                    .padding(.horizontal)

                    // Current Patients
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Current Patients")
                            .font(.headline)

                        HStack {
                            Image(systemName: "person.3.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("You are attending to \(currentPatients) patients today.")
                        }

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .shadow(radius: 4)

                    // Next Visit
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Next Scheduled Visit")
                            .font(.headline)

                        HStack {
                            Image(systemName: "calendar.circle.fill")
                                .font(.title2)
                                .foregroundColor(.purple)
                            VStack(alignment: .leading) {
                                Text("Patient: \(nextPatientName)")
                                Text("Time: \(nextVisitTime)")
                            }
                        }

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .shadow(radius: 4)

                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("Dashboard")
            .background(
                LinearGradient(colors: [.white, .purple.opacity(0.05)],
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }
}

struct DashboardCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())

            Text(value)
                .font(.largeTitle)
                .bold()

            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 5)
    }
}
