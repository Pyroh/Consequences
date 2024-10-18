//
//  CollectionExtension.swift
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

@_exported import Collections

/// Collection+FirstIndex.swift
/// An extension to Collection for finding indices based on key path comparisons.

/// Extends Collection with methods to find the first index of an element
/// that satisfies various conditions based on key path comparisons.
public extension Collection {
    /// Finds the index of the first element where the value at the given key path equals the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first matching element, or `nil` if no element matches.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String; let age: Int }
    ///   let people = [Person(name: "Alice", age: 30), Person(name: "Bob", age: 25)]
    ///   let index = people.firstIndex(where: \.name, equalTo: "Bob")
    ///   print(index) // Prints: Optional(1)
    ///   ```
    @inlinable func firstIndex<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] == value }
    }
    
    /// Finds the index of the first element where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first non-matching element, or `nil` if all elements match.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 1, 2, 1, 3]
    ///   let index = numbers.firstIndex(where: \.self, notEqualTo: 1)
    ///   print(index) // Prints: Optional(2)
    ///   ```
    @inlinable func firstIndex<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] != value }
    }
    
    /// Finds the index of the first element where the optional value at the given key path equals the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first matching element, or `nil` if no element matches.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   struct User { let id: Int; let email: String? }
    ///   let users = [User(id: 1, email: "alice@example.com"), User(id: 2, email: nil)]
    ///   let index = users.firstIndex(where: \.email, equalTo: "alice@example.com")
    ///   print(index) // Prints: Optional(0)
    ///   ```
    @inlinable func firstIndex<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] == value }
    }
    
    /// Finds the index of the first element where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first non-matching element, or `nil` if all elements match.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   struct User { let id: Int; let email: String? }
    ///   let users = [User(id: 1, email: "alice@example.com"), User(id: 2, email: nil)]
    ///   let index = users.firstIndex(where: \.email, notEqualTo: "alice@example.com")
    ///   print(index) // Prints: Optional(1)
    ///   ```
    @inlinable func firstIndex<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] != value }
    }
    
    /// Finds the index of the first element where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first element less than the provided value, or `nil` if no element is less.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 8, 2, 7]
    ///   let index = numbers.firstIndex(where: \.self, lessThan: 4)
    ///   print(index) // Prints: Optional(1)
    ///   ```
    @inlinable func firstIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Index? {
        firstIndex { $0[keyPath: key] < value }
    }
    
    /// Finds the index of the first element where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first element greater than the provided value, or `nil` if no element is greater.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 8, 2, 7]
    ///   let index = numbers.firstIndex(where: \.self, greaterThan: 6)
    ///   print(index) // Prints: Optional(2)
    ///   ```
    @inlinable func firstIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Index? {
        firstIndex { $0[keyPath: key] > value }
    }
    
    /// Finds the index of the first element where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first element less than or equal to the provided value, or `nil` if no element satisfies the condition.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 8, 2, 7]
    ///   let index = numbers.firstIndex(where: \.self, lessThanOrEqualTo: 3)
    ///   print(index) // Prints: Optional(1)
    ///   ```
    @inlinable func firstIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] <= value }
    }
    
    /// Finds the index of the first element where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The index of the first element greater than or equal to the provided value, or `nil` if no element satisfies the condition.
    ///
    /// - Complexity: O(n), where n is the number of elements in the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 8, 2, 7]
    ///   let index = numbers.firstIndex(where: \.self, greaterThanOrEqualTo: 7)
    ///   print(index) // Prints: Optional(2)
    ///   ```
    @inlinable func firstIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Index? {
        firstIndex { $0[keyPath: key] >= value }
    }
}
