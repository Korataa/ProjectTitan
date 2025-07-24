import Foundation

public class ExerciseTracker {
    var workoutsByDate: [Date: [Workout]] = [:]

    public init() {
        do {
            try loadFromFile()
        } catch {
            print("Failed to load workouts: \(error)")
            workoutsByDate = [:]
        }
    }

    public func addWorkout(on date: Date, workout: Workout) {
        let daysOnly = Calendar.current.startOfDay(for: date)
        workoutsByDate[daysOnly, default: []].append(workout)
    }

    public func getWorkouts(on date: Date) -> [Workout] {
        let daysOnly = Calendar.current.startOfDay(for: date)
        return workoutsByDate[daysOnly] ?? []
    }

    public func getAllWorkouts() -> [Date: [Workout]] {
        return workoutsByDate.mapValues { Array($0) }
    }

    public func saveToFile() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601

        let serializableDict = workoutsByDateToSerializable()

        let documentsURL = URL(fileURLWithPath: "C:/Users/lauri/Documents", isDirectory: true)
        let fileURL = documentsURL.appendingPathComponent("workouts.json")
    
        let data = try encoder.encode(serializableDict)
        try data.write(to: fileURL)

        print("Saved to \(fileURL.path)")
    }

    public func loadFromFile() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let documentsURL = URL(fileURLWithPath: "C:/Users/lauri/Documents", isDirectory: true)
        let fileURL = documentsURL.appendingPathComponent("workouts.json")

        let data = try Data(contentsOf: fileURL)
        let decodedDict = try decoder.decode([String: [Workout]].self, from: data)
        workoutsByDate = workoutsByDateFromSerializable(decodedDict)

        print("Loaded from \(fileURL.path)")
    }

    private var iso8601Formatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]   //only date, no time
        return formatter
    }

    //Convert [Date: [Workout]] -> [String: [Workout]] for encoding
    private func workoutsByDateToSerializable() -> [String: [Workout]] {
        var dict: [String: [Workout]] = [:]
        for (date, workouts) in workoutsByDate {
            let key = iso8601Formatter.string(from: date)
            dict[key] = workouts
        }

        return dict
    }

    //Convert [String: [Workout]] -> [Date: [Workout]] for decoding
    private func workoutsByDateFromSerializable(_ dict: [String: [Workout]]) -> [Date: [Workout]] {
        var result: [Date: [Workout]] = [:]
        for (key, workouts) in dict {
            if let date = iso8601Formatter.date(from: key) {
                result[date] = workouts
            } else {
                print("Warning: Count not parse date string \(key)")
            }
        }

        return result
    }
}