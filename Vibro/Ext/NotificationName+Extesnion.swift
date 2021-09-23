//
//  NotificationName+Extesnion.swift
//  Gromi
//
//  Created by Ivan Apet on 24.03.21.
//

import Foundation

extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
    static let onboardEnded = Notification.Name("onboardEnded")
    static let progressChanged = Notification.Name("progressChanged")
    static let progressBreathChanged = Notification.Name("progressBreathChanged")
    static let showTaskComplete = Notification.Name("showTaskComplete")
    static let taskIsDone = Notification.Name("taskIsDone")
    static let affirmationFileChanged = Notification.Name("affirmationFileChanged")
    static let newTaskSelected = Notification.Name("newTaskSelected")
    static let seedsUpdate = Notification.Name("seedsUpdate")
}
