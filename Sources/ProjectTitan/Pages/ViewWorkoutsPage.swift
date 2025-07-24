import Foundation
import Tracker

public class ViewWorkoutsPage: Page {
    private let viewModel: ViewWorkoutsViewModel
    private let onAddWorkout: () -> PageAction

    init(viewModel: ViewWorkoutsViewModel, onAddWorkout: @escaping () -> PageAction) {
        self.viewModel = viewModel
        self.onAddWorkout = onAddWorkout
    }

    public func render() {
        let workouts = viewModel.getWorkoutsGroupedByDate()
        print(
        """
            +-------------------------+
            |     Project Titan 🦾    |
            +-------------------------+
        """
        )

        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        for (date, workouts) in workouts.sorted(by: { $0.key < $1.key }) {
            print("\n=== \(formatter.string(from: date)) ===")

            for workout in workouts {
                print("Workout: \(workout.name)")

                print("| Exercise       | Sets  | Reps  | Weight    |")
                print("|--------------------------------------------|")
                for exercise in workout.exercises {
                    //pad or truncate exercise.name to 17 characters
                    let paddedName = String(exercise.name.prefix(17)).padding(toLength: 17, withPad: " ", startingAt: 0)
                    print("| \(paddedName) | \(exercise.sets)   | \(exercise.reps)  | \(exercise.weight)    |")
                }
            }
        }

        print(
            """
            \n[1] Add Workout
            [2] Edit Workout
            [3] Save Progress
            [4] Exit
            >>
            """
        )
    }

    public func handleInput(input: String) -> PageAction {
        switch input {
        case "1": return onAddWorkout()
        case "4": return .exit
        case "3": 
            viewModel.saveWorkoutsToFile()
            return .stay
        default:
            print("invalid selection.")
            return .stay
        }
    }

    public func shouldExit() -> Bool {

        return false
    }
}