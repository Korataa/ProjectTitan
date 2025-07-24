import Foundation
import Tracker

class AddWorkoutViewModel {
    private let tracker: ExerciseTracker
    public var workout: Workout
    public var currentExercise: Exercise
    public var step: Int = 0

    public init(tracker: ExerciseTracker) {
        self.tracker = tracker
        self.workout = Workout()
        self.currentExercise = Exercise()
    }

    public func setWorkoutName(_ name: String) {
        workout.name = name
    }

    public func setWorkoutDate(from input: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: input) {
            workout.date = date
            return true
        }
        return false
    }

    public func addCurrentExercise() {
        workout.exercises.append(currentExercise)
        currentExercise = Exercise()
    }

    public func saveWorkout() {
        tracker.addWorkout(on: workout.date, workout: workout)
    }
}