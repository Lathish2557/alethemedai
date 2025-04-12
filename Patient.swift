import Foundation

struct Patient: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let condition: String
    let address: String
}
