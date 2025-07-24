import Foundation
import Tracker

class ViewWorkoutsViewModel {
    private var tracker: ExerciseTracker

    init(tracker: ExerciseTracker) {
        self.tracker = tracker
    }

    public func getWorkoutsGroupedByDate() -> [Date: [Workout]] {
        tracker.getAllWorkouts()
    }

    public func saveWorkoutsToFile() {
        do {
            try tracker.saveToFile()
        } catch {
            print("Could not save for some reason \(error)")
        }
    }
}