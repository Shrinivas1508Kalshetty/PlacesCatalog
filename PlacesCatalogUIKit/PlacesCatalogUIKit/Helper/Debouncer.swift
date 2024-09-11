//
//  Debouncer.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import Foundation

class Debouncer {
    private var workItem: DispatchWorkItem?
    private let delay: TimeInterval

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func debounce(action: @escaping () -> Void) {
        // Cancel any previous task
        workItem?.cancel()

        // Create a new work item with the action
        workItem = DispatchWorkItem(block: action)

        // Schedule the new task after the delay
        if let workItem = workItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem)
        }
    }
}
