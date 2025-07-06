import Tracker

public class UIManager {
    private var exerciseTracker: ExerciseTracker
    private var currentPage: Page

    private var quit: Bool

    public init(exerciseTracker: ExerciseTracker) {
        self.exerciseTracker = exerciseTracker
        self.currentPage = ViewWorkoutsPage(exerciseTracker: exerciseTracker)

        quit = false
    }

    public func render() {
        currentPage.render()
    }

    public func handleInput(input: String) -> PageAction {
        return currentPage.handleInput(input: input)
    }

    public func setPage(page: Page) {
        currentPage = page
    }

    public func shouldQuit() -> Bool {
        return quit
    }

}