//
//  BidirectionalCollection.swift
//  Consequences
//
//  MIT License
//
//  Copyright (c) 2023 Pierre Tacchi
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

public extension BidirectionalCollection {
    /// Finds the last index of an element where the value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Alice")]
    ///   let lastAliceIndex = people.lastIndex(where: \.name, equalTo: "Alice") // Returns 2
    ///   ```
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] == value }
    }
    
    /// Finds the last index of an element where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1]
    ///   let lastNonTwoIndex = numbers.lastIndex(where: \.self, notEqualTo: 2) // Returns 4
    ///   ```
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] != value }
    }
    
    /// Finds the last index of an element where the optional value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 1)]
    ///   let lastItemWithIdOne = items.lastIndex(where: \.id, equalTo: 1) // Returns 2
    ///   ```
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] == value }
    }
    
    /// Finds the last index of an element where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 2)]
    ///   let lastItemNotOne = items.lastIndex(where: \.id, notEqualTo: 1) // Returns 2
    ///   ```
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] != value }
    }
    
    /// Finds the last index of an element where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastIndexLessThanSix = numbers.lastIndex(where: \.self, lessThan: 6) // Returns 3
    ///   ```
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Index? {
        lastIndex { $0[keyPath: key] < value }
    }
    
    /// Finds the last index of an element where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastIndexGreaterThanSix = numbers.lastIndex(where: \.self, greaterThan: 6) // Returns 4
    ///   ```
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Index? {
        lastIndex { $0[keyPath: key] > value }
    }
    
    /// Finds the last index of an element where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastIndexLessThanOrEqualToFive = numbers.lastIndex(where: \.self, lessThanOrEqualTo: 5) // Returns 3
    ///   ```
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] <= value }
    }
    
    /// Finds the last index of an element where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last index where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Note: This method uses the `lastIndex(where:)` method internally.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastIndexGreaterThanOrEqualToSeven = numbers.lastIndex(where: \.self, greaterThanOrEqualTo: 7) // Returns 4
    ///   ```
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] >= value }
    }
}

public extension BidirectionalCollection {
    /// Finds the last element where the value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Alice")]
    ///   let lastAlice = people.last(where: \.name, equalTo: "Alice") // Returns Person(name: "Alice")
    ///   ```
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Element? {
        last { $0[keyPath: key] == value }
    }
    
    /// Finds the last element where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1]
    ///   let lastNonTwo = numbers.last(where: \.self, notEqualTo: 2) // Returns 1
    ///   ```
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Element? {
        last { $0[keyPath: key] != value }
    }
    
    /// Finds the last element where the optional value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 1)]
    ///   let lastItemWithIdOne = items.last(where: \.id, equalTo: 1) // Returns Item(id: 1)
    ///   ```
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Element? {
        last { $0[keyPath: key] == value }
    }
    
    /// Finds the last element where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 2)]
    ///   let lastItemNotOne = items.last(where: \.id, notEqualTo: 1) // Returns Item(id: 2)
    ///   ```
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Element? {
        last { $0[keyPath: key] != value }
    }
    
    /// Finds the last element where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastLessThanSix = numbers.last(where: \.self, lessThan: 6) // Returns 2
    ///   ```
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Element? {
        last { $0[keyPath: key] < value }
    }
    
    /// Finds the last element where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastGreaterThanSix = numbers.last(where: \.self, greaterThan: 6) // Returns 8
    ///   ```
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Element? {
        last { $0[keyPath: key] > value }
    }
    
    /// Finds the last element where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastLessThanOrEqualToFive = numbers.last(where: \.self, lessThanOrEqualTo: 5) // Returns 2
    ///   ```
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Element? {
        last { $0[keyPath: key] <= value }
    }
    
    /// Finds the last element where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lastGreaterThanOrEqualToSeven = numbers.last(where: \.self, greaterThanOrEqualTo: 7) // Returns 8
    ///   ```
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Element? {
        last { $0[keyPath: key] >= value }
    }
}

public extension BidirectionalCollection {
    /// Finds the last element where the string value at the given key path contains the provided substring.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n*m), where n is the length of the collection and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["apple", "banana", "cherry", "date"]
    ///   let lastWordWithAn = words.last(where: \.self, contains: "an") // Returns "banana"
    ///   ```
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, contains substring: S) -> Element? {
        last { $0[keyPath: key].contains(substring) }
    }
    
    /// Finds the last element where the string value at the given key path contains the provided substring, ignoring case.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n*m), where n is the length of the collection and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["Apple", "Banana", "Cherry", "Date"]
    ///   let lastWordWithAn = words.last(where: \.self, localizedCaseInsensitiveContains: "AN") // Returns "Banana"
    ///   ```
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S) -> Element? {
        last { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    /// Finds the last element where the string value at the given key path contains the provided substring,
    /// using the current locale's rules for string comparison.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///
    /// - Returns: The last element where the condition is met, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n*m), where n is the length of the collection and m is the length of the substring.
    ///
    /// - Note: This method uses `localizedStandardContains`, which performs comparisons based on the current locale's rules.
    ///   This can be useful for natural language comparisons that should respect locale-specific behaviors.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["café", "apple", "résumé", "banana"]
    ///   let lastWordWithE = words.last(where: \.self, localizedStandardContains: "e") // Returns "résumé"
    ///   ```
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, localizedStandardContains substring: S) -> Element? {
        last { $0[keyPath: key].localizedStandardContains(substring) }
    }
}
