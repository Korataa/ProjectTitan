import Foundation
import Tracker

public protocol Page {
    func render()
    func handleInput(input: String) -> PageAction
    func shouldExit() -> Bool
}

public enum PageAction {
    case stay
    case pop
    case exit
}