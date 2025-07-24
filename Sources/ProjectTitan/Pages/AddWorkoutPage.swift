import Foundation
import Tracker

public class AddWorkoutPage: Page {
    private var viewModel: AddWorkoutViewModel

    init(viewModel: AddWorkoutViewModel) {
        self.viewModel = viewModel
    }

    public func render() {
        print("Add Workout Page")

        if viewModel.workout.name.isEmpty {
            switch viewModel.step {
            case 0: print("Enter workout name:")
            case 1: print("Enter date (YYYY-MM-DD):")
            default: break
            }
        } else {
            switch viewModel.step {
            case 0: print("Enter exercise name:")
            case 1: print("Enter sets:")
            case 2: print("Enter reps:")
            case 3: print("Enter weight:")
            case 4: print("Enter notes (optional):")
            case 5:
                print(
                    """
                    [1] Add another exercise
                    [2] Finish and save workout
                    [3] Cancel workout
                    """
                )
            default: break
            }
        }
    }

    public func handleInput(input: String) -> PageAction {

        // === STEP: Creating Workout ===
        if viewModel.workout.name.isEmpty {
            switch viewModel.step {
            case 0:
                viewModel.setWorkoutName(input)
                viewModel.step = 0
            case 1:
                if viewModel.setWorkoutDate(from: input) {
                    viewModel.step = 0
                } else {
                    print("invalid date. Use YYYY-MM-DD")
                }
            default: break
            }
            return .stay
        }

        // === STEP: Adding exercise ===
        switch viewModel.step {
        case 0: 
            viewModel.currentExercise.name = input
            viewModel.step = 1
        case 1:
            viewModel.currentExercise.sets = Int(input) ?? 0
            viewModel.step = 2
        case 2:
            viewModel.currentExercise.reps = Int(input) ?? 0
            viewModel.step = 3
        case 3:
            viewModel.currentExercise.weight = Float(input) ?? 0
            viewModel.step = 4
        case 4:
            viewModel.currentExercise.notes = input
            viewModel.step = 5
        case 5:
            switch input {
            case "1": 
                viewModel.addCurrentExercise()
                viewModel.step = 0
            case "2":
                viewModel.addCurrentExercise()
                viewModel.saveWorkout()
                return .pop
            case "3":
                print("Workout cancelled.")
                return .pop
            default:
                print("Invalid option.")
            }
        default: break
        }

        return .stay
    }

    public func shouldExit() -> Bool {

        return false
    }
}