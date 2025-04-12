import SwiftUI

struct PatientDetailView: View {
    let patient: Patient
    @State private var isRecording = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.indigo.opacity(0.2), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text(patient.name)
                        .font(.largeTitle)
                        .bold()

                    HStack {
                        Image(systemName: "person.fill")
                        Text("Age: \(patient.age)")
                    }
                    .font(.title3)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text(patient.address)
                    }
                    .font(.title3)
                }
                .foregroundColor(.primary)

                Spacer()

                Button(action: {
                    isRecording.toggle()
                    // Hook up speech-to-text here
                }) {
                    HStack {
                        Image(systemName: isRecording ? "mic.circle.fill" : "mic.fill")
                        Text(isRecording ? "Recording..." : "Start Visit (Speak Now)")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isRecording ? Color.red : Color.blue)
                    .cornerRadius(15)
                    .shadow(radius: 4)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Visit Details")
    }
}
