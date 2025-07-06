import Foundation
import Tracker

public class ViewWorkoutsPage: Page {
    private var workoutsByDate: [Date: [Workout]]

    public init(workoutDict: [Date: [Workout]]) {
        self.workoutsByDate = workoutDict
    }

    public func render() {
        print(
        """
            +-------------------------+
            |     Project Titan 🦾    |
            +-------------------------+

            === 06-22-2025 - Push Day ===

            | Exercise          | Sets  | Reps  | Weight    |
            |-----------------------------------------------|
            | Bench Press       | 3     | 8     | 135       |
            | Overhead Press    | 3     | 10    | 95        |
            | Triceps Pushdown  | 3     | 12    | 45        |

            === 06-23-2025 - Push Day ===

            | Exercise          | Sets  | Reps  | Weight    |
            |-----------------------------------------------|
            | Bench Press       | 3     | 8     | 135       |
            | Overhead Press    | 3     | 10    | 95        |
            | Triceps Pushdown  | 3     | 12    | 45        |

            === 06-24-2025 - Push Day ===

            | Exercise          | Sets  | Reps  | Weight    |
            |-----------------------------------------------|
            | Bench Press       | 3     | 8     | 135       |
            | Overhead Press    | 3     | 10    | 95        |
            | Triceps Pushdown  | 3     | 12    | 45        |

            === 06-25-2025 - Push Day ===

            | Exercise          | Sets  | Reps  | Weight    |
            |-----------------------------------------------|
            | Bench Press       | 3     | 8     | 135       |
            | Overhead Press    | 3     | 10    | 95        |
            | Triceps Pushdown  | 3     | 12    | 45        |

            === 06-26-2025 - Push Day ===

            | Exercise          | Sets  | Reps  | Weight    |
            |-----------------------------------------------|
            | Bench Press       | 3     | 8     | 135       |
            | Overhead Press    | 3     | 10    | 95        |
            | Triceps Pushdown  | 3     | 12    | 45        |

            [1] Add Exercise
            [2] Edit Entry
            [3] Save Progress
            [4] Exit

            >> 

        """
        )
    }

    public func handleInput(input: String) -> PageAction {
        if let inputNumber = Int(input) {
            print("the number was: \(inputNumber)")
            switch inputNumber {
                case 1:
                    //Add exercise
                    return .goToEditPage
                case 2:
                    //Edit entry
                    return .goToEditPage
                case 3:
                    //Save progress
                    return .stay
                case 4:
                    //exit of course
                    return .exit
                default:
                    return .stay
            }
        } else {
            print("invalid number")
            return .stay
        }
    }

    public func shouldExit() -> Bool {

        return false
    }
}