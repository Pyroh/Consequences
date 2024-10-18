//
//  RangeReplaceableCollectionExtension.swift
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

public extension RangeReplaceableCollection {
    /// Removes all elements from the collection where the value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Alice")]
    ///   people.removeAll(where: \.name, equalTo: "Alice")
    ///   // people now contains only [Person(name: "Bob")]
    ///   ```
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) {
        removeAll { $0[keyPath: key] == value }
    }
    
    /// Removes all elements from the collection where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [1, 2, 3, 2, 1]
    ///   numbers.removeAll(where: \.self, notEqualTo: 2)
    ///   // numbers now contains only [2, 2]
    ///   ```
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) {
        removeAll { $0[keyPath: key] != value }
    }
    
    /// Removes all elements from the collection where the optional value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var items = [Item(id: 1), Item(id: nil), Item(id: 1)]
    ///   items.removeAll(where: \.id, equalTo: 1)
    ///   // items now contains only [Item(id: nil)]
    ///   ```
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) {
        removeAll { $0[keyPath: key] == value }
    }
    
    /// Removes all elements from the collection where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var items = [Item(id: 1), Item(id: nil), Item(id: 2)]
    ///   items.removeAll(where: \.id, notEqualTo: 1)
    ///   // items now contains only [Item(id: 1)]
    ///   ```
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) {
        removeAll { $0[keyPath: key] != value }
    }
    
    /// Removes all elements from the collection where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [5, 3, 7, 2, 8]
    ///   numbers.removeAll(where: \.self, lessThan: 5)
    ///   // numbers now contains only [5, 7, 8]
    ///   ```
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) {
        removeAll { $0[keyPath: key] < value }
    }
    
    /// Removes all elements from the collection where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [5, 3, 7, 2, 8]
    ///   numbers.removeAll(where: \.self, greaterThan: 5)
    ///   // numbers now contains only [5, 3, 2]
    ///   ```
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) {
        removeAll { $0[keyPath: key] > value }
    }
    
    /// Removes all elements from the collection where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [5, 3, 7, 2, 8]
    ///   numbers.removeAll(where: \.self, lessThanOrEqualTo: 5)
    ///   // numbers now contains only [7, 8]
    ///   ```
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) {
        removeAll { $0[keyPath: key] <= value }
    }
    
    /// Removes all elements from the collection where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [5, 3, 7, 2, 8]
    ///   numbers.removeAll(where: \.self, greaterThanOrEqualTo: 5)
    ///   // numbers now contains only [3, 2]
    ///   ```
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) {
        removeAll { $0[keyPath: key] >= value }
    }
}

public extension RangeReplaceableCollection {
    /// Removes all elements from the collection where the Boolean value at the given key path is true.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)]
    ///   items.removeAll(on: \.isActive)
    ///   // items now contains only [Item(isActive: false)]
    ///   ```
    @inlinable mutating func removeAll(on key: KeyPath<Element, Bool>) {
        removeAll(where: key, equalTo: true)
    }
    
    /// Removes all elements from the collection where the Boolean value at the given key path is false.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    /// - Example:
    ///   ```swift
    ///   var items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)]
    ///   items.removeAll(onNot: \.isActive)
    ///   // items now contains only [Item(isActive: true), Item(isActive: true)]
    ///   ```
    @inlinable mutating func removeAll(onNot key: KeyPath<Element, Bool>) {
        removeAll(where: key, equalTo: false)
    }
}

public extension RangeReplaceableCollection {
    /// Returns a new collection by appending the right-hand side element to the left-hand side collection.
    ///
    /// - Parameters:
    ///   - lhs: The collection to append to.
    ///   - rhs: The element to append.
    ///
    /// - Returns: A new collection with the element appended.
    ///
    /// - Complexity: O(1) if the collection conforms to `Array`, O(n) otherwise.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3]
    ///   let newNumbers = numbers + 4
    ///   // newNumbers is [1, 2, 3, 4]
    ///   ```
    @inlinable static func +(lhs: Self, rhs: Self.Element) -> Self {
        var ret = lhs
        ret.append(rhs)
        return ret
    }
    
    /// Returns a new collection by appending the elements of the right-hand side sequence to the left-hand side collection.
    ///
    /// - Parameters:
    ///   - lhs: The collection to append to.
    ///   - rhs: The sequence of elements to append.
    ///
    /// - Returns: A new collection with the elements appended.
    ///
    /// - Complexity: O(m) where m is the length of rhs.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3]
    ///   let moreNumbers = numbers + [4, 5]
    ///   // moreNumbers is [1, 2, 3, 4, 5]
    ///   ```
    @inlinable static func +<S>(lhs: Self, rhs: S) -> Self where S: Sequence, S.Element == Element {
        var ret = lhs
        ret.append(contentsOf: rhs)
        return ret
    }
    
    /// Appends the right-hand side element to the left-hand side collection.
    ///
    /// - Parameters:
    ///   - lhs: The collection to append to.
    ///   - rhs: The element to append.
    ///
    /// - Complexity: O(1) if the collection conforms to `Array`, O(n) otherwise.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [1, 2, 3]
    ///   numbers += 4
    ///   // numbers is now [1, 2, 3, 4]
    ///   ```
    @inlinable static func +=(lhs: inout Self, rhs: Self.Element) {
        lhs.append(rhs)
    }
    
    /// Appends the elements of the right-hand side sequence to the left-hand side collection.
    ///
    /// - Parameters:
    ///   - lhs: The collection to append to.
    ///   - rhs: The sequence of elements to append.
    ///
    /// - Complexity: O(m) where m is the length of rhs.
    ///
    /// - Example:
    ///   ```swift
    ///   var numbers = [1, 2, 3]
    ///   numbers += [4, 5]
    ///   // numbers is now [1, 2, 3, 4, 5]
    ///   ```
    @inlinable static func +<S>(lhs: inout Self, rhs: S) where S: Sequence, S.Element == Element {
        lhs.append(contentsOf: rhs)
    }
}
