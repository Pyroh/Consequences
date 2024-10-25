//
//  MutableCollectionExtension.swift
//  Consequences
//
//  MIT License
//
//  Copyright (c) 2024 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

extension MutableCollection where Self: RandomAccessCollection {
    /// Sorts the collection in place using a key path to a comparable property.
    ///
    /// - **Parameters**:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - descending: If `true`, sorts in descending order. If `false`, sorts in ascending order.
    ///                Default is `false`.
    ///
    /// - **Complexity**: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var people = [Person(name: "Alice", age: 30), Person(name: "Bob", age: 25)]
    ///
    ///   // Ascending order (default)
    ///   people.sort(by: \.age)
    ///   // people is now [Bob(age: 25), Alice(age: 30)]
    ///
    ///   // Descending order
    ///   people.sort(by: \.age, descending: true)
    ///   // people is now [Alice(age: 30), Bob(age: 25)]
    ///   ```
    @inlinable mutating func sort<T: Comparable>(by key: KeyPath<Element, T>, descending flag: Bool = false) {
        flag ?
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key] > rhs[keyPath: key] } :
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key] < rhs[keyPath: key] }
    }
    
    /// Sorts the collection in place alphabetically using a key path to a string property.
    ///
    /// - Parameter key: A key path to a string property of the element.
    ///
    /// - Complexity: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var people = [Person(name: "Bob"), Person(name: "Alice")]
    ///   people.sort(alphabeticallyBy: \.name)
    ///   // people is now sorted alphabetically by name
    ///   ```
    @inlinable mutating func sort(alphabeticallyBy key: KeyPath<Element, String>) {
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key].compare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Sorts the collection in place case-insensitively using a key path to a string property.
    ///
    /// - Parameter key: A key path to a string property of the element.
    ///
    /// - Complexity: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var people = [Person(name: "bob"), Person(name: "Alice")]
    ///   people.sort(caseInsensitiveBy: \.name)
    ///   // people is now sorted case-insensitively by name
    ///   ```
    @inlinable mutating func sort(caseInsensitiveBy key: KeyPath<Element, String>) {
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key].caseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Sorts the collection in place using localized comparison of a key path to a string property.
    ///
    /// - Parameter key: A key path to a string property of the element.
    ///
    /// - Complexity: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var words = [Word(text: "ábc"), Word(text: "abd")]
    ///   words.sort(localizedBy: \.text)
    ///   // words is now sorted using localized comparison
    ///   ```
    @inlinable mutating func sort(localizedBy key: KeyPath<Element, String>) {
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Sorts the collection in place using localized, case-insensitive comparison of a key path to a string property.
    ///
    /// - Parameter key: A key path to a string property of the element.
    ///
    /// - Complexity: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var words = [Word(text: "Ábc"), Word(text: "abd")]
    ///   words.sort(localizedCaseInsensitiveBy: \.text)
    ///   // words is now sorted using localized, case-insensitive comparison
    ///   ```
    @inlinable mutating func sort(localizedCaseInsensitiveBy key: KeyPath<Element, String>) {
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCaseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Sorts the collection in place using localized, standard comparison of a key path to a string property.
    ///
    /// - Parameter key: A key path to a string property of the element.
    ///
    /// - Complexity: O(n log n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var words = [Word(text: "a10"), Word(text: "a2")]
    ///   words.sort(localizedStandardBy: \.text)
    ///   // words is now sorted using localized standard comparison (e.g., "a2" comes before "a10")
    ///   ```
    @inlinable mutating func sort(localizedStandardBy key: KeyPath<Element, String>) {
        sort { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedStandardCompare(rhs[keyPath: key]) == .orderedAscending }
    }
}
