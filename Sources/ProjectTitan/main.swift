// The Swift Programming Language
// https://docs.swift.org/swift-book

import Tracker

class ProjectTitan {
    var isRunning: Bool

    var exerciseTracker: ExerciseTracker
    let pageCoordinator: PageCoordinator

    public init() {
        isRunning = true
        exerciseTracker = ExerciseTracker()
        pageCoordinator = PageCoordinator(exerciseTracker: exerciseTracker)
    }

    func mainLoop() {
        while isRunning {
            pageCoordinator.render()

            //Then wait for user input
            if let input = readLine() {
                pageCoordinator.handleInput(input: input)
                
                //After uiManager processes input, check if we should quit
                if pageCoordinator.shouldQuit() {
                    isRunning = false
                }
            } else {
                print("Failed to read input!")
            }

        }
    }
}

func main() {
    let projectTitan = ProjectTitan()
    projectTitan.mainLoop()
}

main()