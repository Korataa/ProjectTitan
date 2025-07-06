// The Swift Programming Language
// https://docs.swift.org/swift-book

import Tracker

class ProjectTitan {
    var isRunning: Bool

    var exerciseTracker: ExerciseTracker
    let uiManager: UIManager

    public init() {
        isRunning = true
        exerciseTracker = ExerciseTracker()
        uiManager = UIManager(exerciseTracker: exerciseTracker)
    }

    func mainLoop() {
        while isRunning {
            uiManager.render()

            //Then wait for user input
            if let input = readLine() {
                let action = uiManager.handleInput(input: input)
                handleAction(action)
            } else {
                print("Failed to read input!")
            }

        }
    }

    func handleAction(_ action: PageAction) {
        switch action {
            case .goToEditPage:
                let workoutsDict = exerciseTracker.getAllWorkouts()
                uiManager.setPage(page: AddEditWorkoutsPage(workoutsDict))
        }
    }
}

func main() {
    let projectTitan = ProjectTitan()
    projectTitan.mainLoop()
}

main()