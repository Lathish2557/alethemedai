import SwiftUI

struct PatientsView: View {
    let assignedPatients = [
        Patient(name: "Emma Watson", age: 75, condition: "Post Surgery Recovery", address: "12 Maple St, Boston"),
        Patient(name: "Daniel Lee", age: 63, condition: "Diabetes Checkup", address: "89 Oak Ave, Cambridge"),
        Patient(name: "Sofia Gomez", age: 82, condition: "Blood Pressure Monitoring", address: "304 Pine Dr, Quincy")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(assignedPatients) { patient in
                        NavigationLink(destination: PatientDetailView(patient: patient)) {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(patient.name)
                                            .font(.title3).bold()

                                        Text("Age: \(patient.age)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }

                                    Spacer()
                                }

                                Divider()

                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Image(systemName: "stethoscope")
                                        Text("Condition: \(patient.condition)")
                                    }

                                    HStack {
                                        Image(systemName: "mappin.and.ellipse")
                                        Text("Address: \(patient.address)")
                                    }
                                }
                                .font(.subheadline)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(.systemBackground))
                                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                            )
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Assigned Patients")
            .background(
                LinearGradient(colors: [.white, Color.indigo.opacity(0.05)],
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }
}
