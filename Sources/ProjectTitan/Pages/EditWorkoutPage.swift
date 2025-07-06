import Foundation
import Tracker

public class AddEditWorkoutsPage: Page {
    var date: Date?
    var workout: Workout?

    public init(date: Date? = nil, workout: Workout? = nil) {
        self.date = date
        self.workout = workout
        //If we go to AddEditWorkoutsPage with those things both null
        //Then we just use it as an adding page
    }

    public func render() {
        print(
            """
                Edit Exercise: Bench
                --------------------
                Exercise Name: Bench Press
                Sets: 3
                Reps: 8
                Weight: 135

                [1] Save Changes
                [2] Delete
                [3] Cancel
            """
        )
    }

    public func handleInput(input: String) -> PageAction {
        return .stay
    }

    public func shouldExit() -> Bool {

        return false
    }
}