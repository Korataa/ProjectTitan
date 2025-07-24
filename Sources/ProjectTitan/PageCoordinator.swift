import Tracker

public class PageCoordinator {
    private var exerciseTracker: ExerciseTracker
    private var pageStack: [Page] = []

    private var currentPage: Page? {
        return pageStack.last
    }

    private var quit: Bool

    public init(exerciseTracker: ExerciseTracker) {
        self.exerciseTracker = exerciseTracker
        quit = false
        
        //Start with viewWorkoutsPage and inject a closure that tells the coordinator what to do
        let viewModel = ViewWorkoutsViewModel(tracker: exerciseTracker)
        let viewPage = ViewWorkoutsPage(
            viewModel: viewModel,
            onAddWorkout: { [weak self] in
                guard let self = self else { return .stay }
                let addWorkoutVM = AddWorkoutViewModel(tracker: self.exerciseTracker)
                let addWorkoutPage = AddWorkoutPage(viewModel: addWorkoutVM)
                self.pageStack.append(addWorkoutPage)
                return .stay    //signal no further action needed
            }
        )

        //Start with this page
        pageStack.append(viewPage)
    }

    public func render() {
        currentPage?.render()
    }

    public func handleInput(input: String) {
        guard let page = currentPage else {
            quit = true
            return
        }

        let action = page.handleInput(input: input)

        switch action {
        case .stay:
            return
        case .pop:
            _ = pageStack.popLast()
        case .exit:
            quit = true             
        }
    }

    public func setPage(page: Page) {
        pageStack.append(page)
    }

    public func shouldQuit() -> Bool {
        return quit
    }

}