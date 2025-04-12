import SwiftUI
import Speech

struct AddVisitNotesView: View {
    let patient: Patient
    @StateObject private var recognizer = SpeechRecognizer()
    @State private var isRecording = false
    @State private var isSummaryVisible = false
    @State private var transcript: String = ""
    @State private var summary: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Visit Notes for \(patient.name)")
                    .font(.title2)
                    .bold()
                    .padding(.top)

                if isRecording {
                    Text("Recording… Speak now.")
                        .foregroundColor(.red)
                }

                Button(action: {
                    if isRecording {
                        recognizer.stopRecording()
                        transcript = recognizer.transcript
                    } else {
                        recognizer.startRecording()
                        transcript = ""
                    }
                    isRecording.toggle()
                }) {
                    HStack {
                        Image(systemName: isRecording ? "stop.circle.fill" : "mic.fill")
                        Text(isRecording ? "Stop Recording" : "Start Recording")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }

                if !transcript.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Transcribed Text:")
                            .font(.headline)
                        TextEditor(text: $transcript)
                            .frame(height: 120)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                }

                if !transcript.isEmpty {
                    Button("Summarize") {
                        summary = generateSummary(from: transcript)
                        isSummaryVisible = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }

                if isSummaryVisible {
                    VStack(alignment: .leading) {
                        Text("Summary (Editable):")
                            .font(.headline)
                        TextEditor(text: $summary)
                            .frame(height: 120)
                            .background(Color(.tertiarySystemBackground))
                            .cornerRadius(8)
                    }

                    Button("Submit to Hospital Database") {
                        submitToDatabase()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Add Visit Notes")
    }

    func generateSummary(from text: String) -> String {
        // Replace this with real OpenAI call later
        return "Summary: Nurse visited and completed tasks. Notes: \(text)"
    }

    func submitToDatabase() {
        print("📤 Sent to hospital database: \(summary)")
        // Replace this with Firebase or API call
    }
}
