import Foundation

public struct Workout: Codable {
    var date: Date
    var name: String
    var exercises: [Exercise]
}

public struct Exercise: Codable {
    var name: String
    var sets: Int
    var reps: Int
    var weight: Float
    var notes: String
}