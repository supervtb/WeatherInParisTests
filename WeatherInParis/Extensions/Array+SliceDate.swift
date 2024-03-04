//
//  Array+SliceDate.swift
//  WeatherInParis
//
//  Created by Chubakov, Albert on 03/03/2024.
//

import Foundation

/// Extension for Array
extension Array {
    func sliced(by dateComponents: Set<Calendar.Component>, for key: KeyPath<Element, Date>) -> [Date: [Element]] {
        let initial: [Date: [Element]] = [:]
        let groupedByDateComponents = reduce(into: initial) { acc, cur in
            let components = Calendar.current.dateComponents(dateComponents, from: cur[keyPath: key])
            guard let date = Calendar.current.date(from: components) else { return }
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        return groupedByDateComponents
    }
}
