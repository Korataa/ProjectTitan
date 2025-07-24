import Foundation

public struct Workout: Codable {
    public var date: Date
    public var name: String
    public var exercises: [Exercise]

    public init() {
        self.date = Date.now
        self.name = ""
        self.exercises = []
    }
}

public struct Exercise: Codable {
    public var name: String
    public var sets: Int
    public var reps: Int
    public var weight: Float
    public var notes: String

    public init() {
        self.name = ""
        self.sets = 0
        self.reps = 0
        self.weight = 0
        self.notes = ""
    }
}