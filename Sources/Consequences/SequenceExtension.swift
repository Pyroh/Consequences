//
//  SequenceExtension.swift
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

public extension Sequence {
    /// Zips this sequence with another sequence.
    ///
    /// - Parameter sequence2: The sequence to zip with this sequence.
    /// - Returns: A `Zip2Sequence` of this sequence and the provided sequence.
    ///
    /// - Complexity: O(1)
    ///
    /// - Note: This is a convenience wrapper around Swift's built-in `zip(_:_:)` function.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3]
    ///   let letters = ["a", "b", "c"]
    ///   let zipped = numbers.zip(letters)
    ///   // zipped is equivalent to [(1, "a"), (2, "b"), (3, "c")]
    ///   ```
    @inlinable func zip<Sequence2: Sequence>(_ sequence2: Sequence2) -> Zip2Sequence<Self, Sequence2> {
        Swift.zip(self, sequence2)
    }
    
    /// Zips this sequence with two other sequences.
    ///
    /// - Parameters:
    ///   - sequence2: The second sequence to zip.
    ///   - sequence3: The third sequence to zip.
    /// - Returns: A `Zip3Sequence` of this sequence and the two provided sequences.
    ///
    /// - Complexity: O(1)
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3]
    ///   let letters = ["a", "b", "c"]
    ///   let symbols = ["!", "@", "#"]
    ///   let zipped = numbers.zip(letters, symbols)
    ///   // zipped is equivalent to [(1, "a", "!"), (2, "b", "@"), (3, "c", "#")]
    ///   ```
    @inlinable func zip<Sequence2: Sequence, Sequence3: Sequence>(_ sequence2: Sequence2, _ sequence3: Sequence3) -> Zip3Sequence<Self, Sequence2, Sequence3> {
        zip3(self, sequence2, sequence3)
    }
    
    /// Zips this sequence with three other sequences.
    ///
    /// - Parameters:
    ///   - sequence2: The second sequence to zip.
    ///   - sequence3: The third sequence to zip.
    ///   - sequence4: The fourth sequence to zip.
    /// - Returns: A `Zip4Sequence` of this sequence and the three provided sequences.
    ///
    /// - Complexity: O(1)
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3]
    ///   let letters = ["a", "b", "c"]
    ///   let symbols = ["!", "@", "#"]
    ///   let colors = ["red", "green", "blue"]
    ///   let zipped = numbers.zip(letters, symbols, colors)
    ///   // zipped is equivalent to [(1, "a", "!", "red"), (2, "b", "@", "green"), (3, "c", "#", "blue")]
    ///   ```
    @inlinable func zip<Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence>(_ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) -> Zip4Sequence<Self, Sequence2, Sequence3, Sequence4> {
        zip4(self, sequence2, sequence3, sequence4)
    }
}
public extension Sequence {
    /// Filters the sequence to include only elements where the specified key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob"), Person(id: 1, name: "Charlie")]
    ///   let filteredPeople = people.filter(on: \.id, equalTo: 1)
    ///   // filteredPeople contains [Person(id: 1, name: "Alice"), Person(id: 1, name: "Charlie")]
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, equalTo value: T) -> [Element] {
        filter { $0[keyPath: key] == value }
    }
    
    /// Filters the sequence to include only elements where the specified key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is not equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob"), Person(id: 1, name: "Charlie")]
    ///   let filteredPeople = people.filter(on: \.id, notEqualTo: 1)
    ///   // filteredPeople contains [Person(id: 2, name: "Bob")]
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, notEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] != value }
    }
    
    /// Filters the sequence to include only elements where the specified optional key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified optional property is equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil), Person(id: 3, nickname: "Al")]
    ///   let filteredPeople = people.filter(on: \.nickname, equalTo: "Al")
    ///   // filteredPeople contains [Person(id: 1, nickname: "Al"), Person(id: 3, nickname: "Al")]
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, equalTo value: T) -> [Element] {
        filter { $0[keyPath: key] == value }
    }
    
    /// Filters the sequence to include only elements where the specified optional key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified optional property is not equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil), Person(id: 3, nickname: "Charlie")]
    ///   let filteredPeople = people.filter(on: \.nickname, notEqualTo: "Al")
    ///   // filteredPeople contains [Person(id: 2, nickname: nil), Person(id: 3, nickname: "Charlie")]
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, notEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] != value }
    }
    
    /// Filters the sequence to include only elements where the specified key path's value is less than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is less than the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25), Person(id: 3, age: 35)]
    ///   let filteredPeople = people.filter(on: \.age, lessThan: 30)
    ///   // filteredPeople contains [Person(id: 2, age: 25)]
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThan value: T) -> [Element] {
        filter { $0[keyPath: key] < value }
    }
    
    /// Filters the sequence to include only elements where the specified key path's value is greater than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is greater than the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25), Person(id: 3, age: 35)]
    ///   let filteredPeople = people.filter(on: \.age, greaterThan: 30)
    ///   // filteredPeople contains [Person(id: 3, age: 35)]
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThan value: T) -> [Element] {
        filter { $0[keyPath: key] > value }
    }
    
    /// Filters the sequence to include only elements where the specified key path's value is less than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is less than or equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25), Person(id: 3, age: 35)]
    ///   let filteredPeople = people.filter(on: \.age, lessThanOrEqualTo: 30)
    ///   // filteredPeople contains [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] <= value }
    }
    
    /// Filters the sequence to include only elements where the specified key path's value is greater than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: An array containing only the elements where the specified property is greater than or equal to the given value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25), Person(id: 3, age: 35)]
    ///   let filteredPeople = people.filter(on: \.age, greaterThanOrEqualTo: 30)
    ///   // filteredPeople contains [Person(id: 1, age: 30), Person(id: 3, age: 35)]
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] >= value }
    }
    
    /// Filters the sequence to include only elements where the specified optional key path's value is not nil.
    ///
    /// - Parameter key: A key path to an optional property of the element.
    ///
    /// - Returns: An array containing only the elements where the specified optional property is not nil.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil), Person(id: 3, nickname: "Charlie")]
    ///   let filteredPeople = people.filter(onNotNil: \.nickname)
    ///   // filteredPeople contains [Person(id: 1, nickname: "Al"), Person(id: 3, nickname: "Charlie")]
    ///   ```
    @inlinable func filter<T>(onNotNil key: KeyPath<Element, T?>) -> [Element] {
        filter { $0[keyPath: key] != nil }
    }
    
    /// Filters the sequence to include only elements where the specified optional key path's value is nil.
    ///
    /// - Parameter key: A key path to an optional property of the element.
    ///
    /// - Returns: An array containing only the elements where the specified optional property is nil.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil), Person(id: 3, nickname: "Charlie")]
    ///   let filteredPeople = people.filter(onNil: \.nickname)
    ///   // filteredPeople contains [Person(id: 2, nickname: nil)]
    ///   ```
    @inlinable func filter<T>(onNil key: KeyPath<Element, T?>) -> [Element] {
        filter { $0[keyPath: key] == nil }
    }
}

public extension Sequence where Element: Equatable {
    /// Filters the sequence to include only elements that are equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements equal to the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1]
    ///   let twos = numbers.filter(equalTo: 2)
    ///   // twos is [2, 2]
    ///   ```
    @inlinable func filter(equalTo value: Element) -> [Element] {
        filter { $0 == value }
    }
    
    /// Filters the sequence to include only elements that are not equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements not equal to the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1]
    ///   let notTwos = numbers.filter(notEqualTo: 2)
    ///   // notTwos is [1, 3, 1]
    ///   ```
    @inlinable func filter(notEqualTo value: Element) -> [Element] {
        filter { $0 != value }
    }
}

public extension Sequence where Element: Comparable {
    
    /// Filters the sequence to include only elements that are less than the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements less than the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lessThanSix = numbers.filter(lessThan: 6)
    ///   // lessThanSix is [5, 3, 2]
    ///   ```
    @inlinable func filter(lessThan value: Element) -> [Element] {
        filter { $0 < value }
    }
    
    /// Filters the sequence to include only elements that are greater than the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements greater than the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let greaterThanSix = numbers.filter(greaterThan: 6)
    ///   // greaterThanSix is [7, 8]
    ///   ```
    @inlinable func filter(greaterThan value: Element) -> [Element] {
        filter { $0 > value }
    }
    
    /// Filters the sequence to include only elements that are less than or equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements less than or equal to the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let lessThanOrEqualToFive = numbers.filter(lessThanOrEqualTo: 5)
    ///   // lessThanOrEqualToFive is [5, 3, 2]
    ///   ```
    @inlinable func filter(lessThanOrEqualTo value: Element) -> [Element] {
        filter { $0 <= value }
    }
    
    /// Filters the sequence to include only elements that are greater than or equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    /// - Returns: An array containing only the elements greater than or equal to the provided value.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8]
    ///   let greaterThanOrEqualToSeven = numbers.filter(greaterThanOrEqualTo: 7)
    ///   // greaterThanOrEqualToSeven is [7, 8]
    ///   ```
    @inlinable func filter(greaterThanOrEqualTo value: Element) -> [Element] {
        filter { $0 >= value }
    }
}

public extension Sequence {
    /// Filters the sequence to include only elements where the Boolean value at the given key path is true.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    /// - Returns: An array containing only the elements where the specified Boolean property is true.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)]
    ///   let activeItems = items.filter(on: \.isActive)
    ///   // activeItems contains only the items where isActive is true
    ///   ```
    @inlinable func filter(on key: KeyPath<Element, Bool>) -> [Element] {
        filter(on: key, equalTo: true)
    }
    
    /// Filters the sequence to include only elements where the Boolean value at the given key path is false.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    /// - Returns: An array containing only the elements where the specified Boolean property is false.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)]
    ///   let inactiveItems = items.filter(onNot: \.isActive)
    ///   // inactiveItems contains only the items where isActive is false
    ///   ```
    @inlinable func filter(onNot key: KeyPath<Element, Bool>) -> [Element] {
        filter(on: key, equalTo: false)
    }
}

public extension Sequence {
    /// Filters the sequence based on whether a specified property of each element contains a given substring.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific `String` property
    /// of each element contains a given substring. The comparison is case-sensitive.
    ///
    /// - Parameters:
    ///   - key: A key path to a `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]
    ///   let filtered = people.filter(on: \.name, contains: "li")
    ///   // filtered contains [Person(name: "Alice"), Person(name: "Charlie")]
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, contains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].contains(substring) }
    }
    
    /// Filters the sequence based on whether a specified property of each element contains a given substring, ignoring case.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific `String` property
    /// of each element contains a given substring. The comparison is case-insensitive and uses the current locale.
    ///
    /// - Parameters:
    ///   - key: A key path to a `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]
    ///   let filtered = people.filter(on: \.name, localizedCaseInsensitiveContains: "AL")
    ///   // filtered contains [Person(name: "Alice")]
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    /// Filters the sequence based on whether a specified property of each element contains a given substring, using standard comparison.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific `String` property
    /// of each element contains a given substring. The comparison uses the current locale's standard comparison options.
    ///
    /// - Parameters:
    ///   - key: A key path to a `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Éclair"), Person(name: "Eclair"), Person(name: "Charlie")]
    ///   let filtered = people.filter(on: \.name, localizedStandardContains: "éclair")
    ///   // filtered may contain both "Éclair" and "Eclair" depending on the current locale
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].localizedStandardContains(substring) }
    }
    
    /// Filters the sequence based on whether a specified optional property of each element contains a given substring.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific optional `String` property
    /// of each element contains a given substring. The comparison is case-sensitive.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///         If the property is `nil`, the element is not included in the result.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let nickname: String? }
    ///   let people = [Person(nickname: "Al"), Person(nickname: nil), Person(nickname: "Charlie")]
    ///   let filtered = people.filter(on: \.nickname, contains: "al")
    ///   // filtered contains [Person(nickname: "Al")]
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, contains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.contains(substring) ?? false }
    }
    
    /// Filters the sequence based on whether a specified optional property of each element contains a given substring, ignoring case.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific optional `String` property
    /// of each element contains a given substring. The comparison is case-insensitive and uses the current locale.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///         If the property is `nil`, the element is not included in the result.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let nickname: String? }
    ///   let people = [Person(nickname: "Al"), Person(nickname: nil), Person(nickname: "Charlie")]
    ///   let filtered = people.filter(on: \.nickname, localizedCaseInsensitiveContains: "AL")
    ///   // filtered contains [Person(nickname: "Al")]
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.localizedCaseInsensitiveContains(substring) ?? false }
    }
    
    /// Filters the sequence based on whether a specified optional property of each element contains a given substring, using standard comparison.
    ///
    /// This method allows you to filter a sequence of elements based on whether a specific optional `String` property
    /// of each element contains a given substring. The comparison uses the current locale's standard comparison options.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional `String` property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///   - flag: A Boolean value that determines whether to include all elements when the substring is empty. Defaults to `true`.
    ///
    /// - Returns: An array containing the elements of the sequence that satisfy the given predicate.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: If the substring is empty and `flag` is `true`, this method returns all elements of the sequence.
    ///         If the property is `nil`, the element is not included in the result.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let nickname: String? }
    ///   let people = [Person(nickname: "Éclair"), Person(nickname: nil), Person(nickname: "Eclair")]
    ///   let filtered = people.filter(on: \.nickname, localizedStandardContains: "éclair")
    ///   // filtered may contain both "Éclair" and "Eclair" depending on the current locale
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.localizedStandardContains(substring) ?? false }
    }
}

public extension Sequence {
    /// Returns the first element of the sequence where the specified key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob")]
    ///   let person = people.first(where: \.id, equalTo: 2)
    ///   // person is Person(id: 2, name: "Bob")
    ///   ```
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Element? {
        first { $0[keyPath: key] == value }
    }
    
    /// Returns the first element of the sequence where the specified key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is not equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob")]
    ///   let person = people.first(where: \.id, notEqualTo: 1)
    ///   // person is Person(id: 2, name: "Bob")
    ///   ```
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Element? {
        first { $0[keyPath: key] != value }
    }
    
    /// Returns the first element of the sequence where the specified optional key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified optional property is equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil)]
    ///   let person = people.first(where: \.nickname, equalTo: "Al")
    ///   // person is Person(id: 1, nickname: "Al")
    ///   ```
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Element? {
        first { $0[keyPath: key] == value }
    }
    
    /// Returns the first element of the sequence where the specified optional key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified optional property is not equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil)]
    ///   let person = people.first(where: \.nickname, notEqualTo: "Al")
    ///   // person is Person(id: 2, nickname: nil)
    ///   ```
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Element? {
        first { $0[keyPath: key] != value }
    }
    
    /// Returns the first element of the sequence where the specified key path's value is less than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is less than the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let person = people.first(where: \.age, lessThan: 28)
    ///   // person is Person(id: 2, age: 25)
    ///   ```
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Element? {
        first { $0[keyPath: key] < value }
    }
    
    /// Returns the first element of the sequence where the specified key path's value is greater than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is greater than the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let person = people.first(where: \.age, greaterThan: 28)
    ///   // person is Person(id: 1, age: 30)
    ///   ```
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Element? {
        first { $0[keyPath: key] > value }
    }
    
    /// Returns the first element of the sequence where the specified key path's value is less than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is less than or equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let person = people.first(where: \.age, lessThanOrEqualTo: 25)
    ///   // person is Person(id: 2, age: 25)
    ///   ```
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Element? {
        first { $0[keyPath: key] <= value }
    }
    
    /// Returns the first element of the sequence where the specified key path's value is greater than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: The first element in the sequence where the specified property is greater than or equal to the given value, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let person = people.first(where: \.age, greaterThanOrEqualTo: 30)
    ///   // person is Person(id: 1, age: 30)
    ///   ```
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Element? {
        first { $0[keyPath: key] >= value }
    }
}

public extension Sequence {
    /// Returns the first element of the sequence where the specified key path's String value contains the given substring.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///
    /// - Returns: The first element in the sequence where the specified String property contains the given substring, or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: This method performs a case-sensitive search.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]
    ///   let person = people.first(where: \.name, contains: "li")
    ///   // person is Person(name: "Alice")
    ///   ```
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, contains substring: S) -> Element? {
        first { $0[keyPath: key].contains(substring) }
    }
    
    /// Returns the first element of the sequence where the specified key path's String value contains the given substring, ignoring case.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///
    /// - Returns: The first element in the sequence where the specified String property contains the given substring (ignoring case), or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: This method performs a case-insensitive search using the current locale.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]
    ///   let person = people.first(where: \.name, localizedCaseInsensitiveContains: "AL")
    ///   // person is Person(name: "Alice")
    ///   ```
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S) -> Element? {
        first { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    /// Returns the first element of the sequence where the specified key path's String value contains the given substring, using standard comparison.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for within the specified property.
    ///
    /// - Returns: The first element in the sequence where the specified String property contains the given substring (using standard comparison), or `nil` if no such element is found.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Note: This method performs a search using the current locale's standard comparison options.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Éclair"), Person(name: "Eclair"), Person(name: "Charlie")]
    ///   let person = people.first(where: \.name, localizedStandardContains: "éclair")
    ///   // person might be Person(name: "Éclair") or Person(name: "Eclair") depending on the current locale
    ///   ```
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, localizedStandardContains substring: S) -> Element? {
        first { $0[keyPath: key].localizedStandardContains(substring) }
    }
}

public extension Sequence {
    /// Returns a new array with the elements of the sequence sorted based on the specified key path.
    ///
    /// - **Parameters**:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - descending: If `true`, sorts in descending order. If `false`, sorts in ascending order.
    ///                Default is `false`.
    ///
    /// - **Returns**: A new array with the elements sorted based on the values of the specified key path.
    ///
    /// - **Complexity**: O(n log n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String, let age: Int }
    ///   let people = [Person(name: "Alice", age: 30), Person(name: "Bob", age: 25)]
    ///
    ///   // Ascending order (default)
    ///   let sortedAscending = people.sorted(by: \.age)
    ///   // [Person(name: "Bob", age: 25), Person(name: "Alice", age: 30)]
    ///
    ///   // Descending order
    ///   let sortedDescending = people.sorted(by: \.age, descending: true)
    ///   // [Person(name: "Alice", age: 30), Person(name: "Bob", age: 25)]
    ///   ```
    @inlinable func sorted<T: Comparable>(by key: KeyPath<Element, T>, descending flag: Bool = false) -> [Element] {
        flag ?
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key] > rhs[keyPath: key] } :
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key] < rhs[keyPath: key] }
    }
    
    /// Returns a new array with the elements of the sequence sorted alphabetically based on the specified String key path.
    ///
    /// - Parameter key: A key path to a String property of the element.
    ///
    /// - Returns: A new array with the elements sorted alphabetically based on the values of the specified String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses the default String comparison, which is case-sensitive and not localized.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Charlie"), Person(name: "Alice"), Person(name: "Bob")]
    ///   let sortedPeople = people.sorted(alphabetically: \.name)
    ///   // sortedPeople is [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Charlie")]
    ///   ```
    @inlinable func sorted(alphabetically key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].compare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Returns a new array with the elements of the sequence sorted case-insensitively based on the specified String key path.
    ///
    /// - Parameter key: A key path to a String property of the element.
    ///
    /// - Returns: A new array with the elements sorted case-insensitively based on the values of the specified String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses case-insensitive String comparison, which is not localized.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "alice"), Person(name: "Bob"), Person(name: "charlie")]
    ///   let sortedPeople = people.sorted(caseInsensitiveBy: \.name)
    ///   // sortedPeople is [Person(name: "alice"), Person(name: "Bob"), Person(name: "charlie")]
    ///   ```
    @inlinable func sorted(caseInsensitiveBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].caseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized comparison based on the specified String key path.
    ///
    /// - Parameter key: A key path to a String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized comparison based on the values of the specified String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized String comparison, which takes into account the current locale settings.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "Émile"), Person(name: "Ádám"), Person(name: "Zlatan")]
    ///   let sortedPeople = people.sorted(localizedBy: \.name)
    ///   // sortedPeople order may vary depending on the current locale
    ///   ```
    @inlinable func sorted(localizedBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized case-insensitive comparison based on the specified String key path.
    ///
    /// - Parameter key: A key path to a String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized case-insensitive comparison based on the values of the specified String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized case-insensitive String comparison, which takes into account the current locale settings.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "émile"), Person(name: "Ádám"), Person(name: "zlatan")]
    ///   let sortedPeople = people.sorted(localizedCaseInsensitiveBy: \.name)
    ///   // sortedPeople order may vary depending on the current locale, but case is ignored
    ///   ```
    @inlinable func sorted(localizedCaseInsensitiveBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCaseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized standard comparison based on the specified String key path.
    ///
    /// - Parameter key: A key path to a String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized standard comparison based on the values of the specified String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized standard String comparison, which takes into account the current locale settings and provides the most appropriate comparison for user-visible strings.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String }
    ///   let people = [Person(name: "café"), Person(name: "cafe"), Person(name: "CAFE")]
    ///   let sortedPeople = people.sorted(localizedStandardBy: \.name)
    ///   // sortedPeople order follows the current locale's standard sorting rules
    ///   ```
    @inlinable func sorted(localizedStandardBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedStandardCompare(rhs[keyPath: key]) == .orderedAscending }
    }
}

public extension Sequence {
    /// Returns a new array with the elements of the sequence sorted based on the specified optional key path.
    ///
    /// - Parameter key: A key path to an optional property of the element that conforms to `Comparable`.
    ///
    /// - Returns: A new array with the elements sorted based on the values of the specified optional key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method places `nil` values at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String, let age: Int? }
    ///   let people = [Person(name: "Alice", age: 30), Person(name: "Bob", age: nil), Person(name: "Charlie", age: 25)]
    ///   let sortedPeople = people.sorted(by: \.age)
    ///   // sortedPeople is [Person(name: "Charlie", age: 25), Person(name: "Alice", age: 30), Person(name: "Bob", age: nil)]
    ///   ```
    @inlinable func sorted<T: Comparable>(by key: KeyPath<Element, T?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)): return l < r
            default: return true
            }
        }
    }
    
    /// Returns a new array with the elements of the sequence sorted alphabetically based on the specified optional String key path.
    ///
    /// - Parameter key: A key path to an optional String property of the element.
    ///
    /// - Returns: A new array with the elements sorted alphabetically based on the values of the specified optional String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses the default String comparison, which is case-sensitive and not localized.
    ///         `nil` values are placed at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String? }
    ///   let people = [Person(name: "Charlie"), Person(name: nil), Person(name: "Alice")]
    ///   let sortedPeople = people.sorted(alphabetically: \.name)
    ///   // sortedPeople is [Person(name: "Alice"), Person(name: "Charlie"), Person(name: nil)]
    ///   ```
    @inlinable func sorted(alphabetically key: KeyPath<Element, String?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)):
                return l.compare(r) == .orderedAscending
            default: return true
            }
        }
    }
    
    /// Returns a new array with the elements of the sequence sorted case-insensitively based on the specified optional String key path.
    ///
    /// - Parameter key: A key path to an optional String property of the element.
    ///
    /// - Returns: A new array with the elements sorted case-insensitively based on the values of the specified optional String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses case-insensitive String comparison, which is not localized.
    ///         `nil` values are placed at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String? }
    ///   let people = [Person(name: "alice"), Person(name: nil), Person(name: "Bob")]
    ///   let sortedPeople = people.sorted(caseInsensitiveBy: \.name)
    ///   // sortedPeople is [Person(name: "alice"), Person(name: "Bob"), Person(name: nil)]
    ///   ```
    @inlinable func sorted(caseInsensitiveBy key: KeyPath<Element, String?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)):
                return l.caseInsensitiveCompare(r) == .orderedAscending
            default: return true
            }
        }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized comparison based on the specified optional String key path.
    ///
    /// - Parameter key: A key path to an optional String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized comparison based on the values of the specified optional String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized String comparison, which takes into account the current locale settings.
    ///         `nil` values are placed at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String? }
    ///   let people = [Person(name: "Émile"), Person(name: nil), Person(name: "Ádám")]
    ///   let sortedPeople = people.sorted(localizedBy: \.name)
    ///   // sortedPeople order may vary depending on the current locale
    ///   ```
    @inlinable func sorted(localizedBy key: KeyPath<Element, String?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)):
                return l.localizedCompare(r) == .orderedAscending
            default: return true
            }
        }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized case-insensitive comparison based on the specified optional String key path.
    ///
    /// - Parameter key: A key path to an optional String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized case-insensitive comparison based on the values of the specified optional String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized case-insensitive String comparison, which takes into account the current locale settings.
    ///         `nil` values are placed at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String? }
    ///   let people = [Person(name: "émile"), Person(name: nil), Person(name: "Ádám")]
    ///   let sortedPeople = people.sorted(localizedCaseInsensitiveBy: \.name)
    ///   // sortedPeople order may vary depending on the current locale, but case is ignored
    ///   ```
    @inlinable func sorted(localizedCaseInsensitiveBy key: KeyPath<Element, String?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)):
                return l.localizedCaseInsensitiveCompare(r) == .orderedAscending
            default: return true
            }
        }
    }
    
    /// Returns a new array with the elements of the sequence sorted using localized standard comparison based on the specified optional String key path.
    ///
    /// - Parameter key: A key path to an optional String property of the element.
    ///
    /// - Returns: A new array with the elements sorted using localized standard comparison based on the values of the specified optional String key path.
    ///
    /// - Complexity: O(n log n), where n is the length of the sequence.
    ///
    /// - Note: This method uses localized standard String comparison, which takes into account the current locale settings and provides the most appropriate comparison for user-visible strings.
    ///         `nil` values are placed at the end of the sorted array.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let name: String? }
    ///   let people = [Person(name: "café"), Person(name: nil), Person(name: "cafe")]
    ///   let sortedPeople = people.sorted(localizedStandardBy: \.name)
    ///   // sortedPeople order follows the current locale's standard sorting rules
    ///   ```
    @inlinable func sorted(localizedStandardBy key: KeyPath<Element, String?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)):
                return l.localizedStandardCompare(r) == .orderedAscending
            default: return true
            }
        }
    }
}

public extension Sequence {
    /// Checks if the sequence contains an element where the specified key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob")]
    ///   let containsId2 = people.contains(where: \.id, equalTo: 2)  // Returns true
    ///   ```
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Bool {
        contains { $0[keyPath: key] == value }
    }
    
    /// Checks if the sequence contains an element where the specified key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is not equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let name: String }
    ///   let people = [Person(id: 1, name: "Alice"), Person(id: 2, name: "Bob")]
    ///   let containsNotId1 = people.contains(where: \.id, notEqualTo: 1)  // Returns true
    ///   ```
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] != value }
    }
    
    /// Checks if the sequence contains an element where the specified optional key path's value is equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified optional property is equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil)]
    ///   let containsNicknameAl = people.contains(where: \.nickname, equalTo: "Al")  // Returns true
    ///   ```
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Bool {
        contains { $0[keyPath: key] == value }
    }
    
    /// Checks if the sequence contains an element where the specified optional key path's value is not equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element that conforms to `Equatable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified optional property is not equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let nickname: String? }
    ///   let people = [Person(id: 1, nickname: "Al"), Person(id: 2, nickname: nil)]
    ///   let containsNotNicknameAl = people.contains(where: \.nickname, notEqualTo: "Al")  // Returns true
    ///   ```
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] != value }
    }
    
    /// Checks if the sequence contains an element where the specified key path's value is less than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is less than the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let containsAgeLessThan28 = people.contains(where: \.age, lessThan: 28)  // Returns true
    ///   ```
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Bool {
        contains { $0[keyPath: key] < value }
    }
    
    /// Checks if the sequence contains an element where the specified key path's value is greater than the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is greater than the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let containsAgeGreaterThan28 = people.contains(where: \.age, greaterThan: 28)  // Returns true
    ///   ```
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Bool {
        contains { $0[keyPath: key] > value }
    }
    
    /// Checks if the sequence contains an element where the specified key path's value is less than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is less than or equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let containsAgeLessThanOrEqual25 = people.contains(where: \.age, lessThanOrEqualTo: 25)  // Returns true
    ///   ```
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] <= value }
    }
    
    /// Checks if the sequence contains an element where the specified key path's value is greater than or equal to the given value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element that conforms to `Comparable`.
    ///   - value: The value to compare against.
    ///
    /// - Returns: `true` if the sequence contains an element where the specified property is greater than or equal to the given value, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   struct Person { let id: Int, let age: Int }
    ///   let people = [Person(id: 1, age: 30), Person(id: 2, age: 25)]
    ///   let containsAgeGreaterThanOrEqual30 = people.contains(where: \.age, greaterThanOrEqualTo: 30)  // Returns true
    ///   ```
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] >= value }
    }
}

public extension Sequence where Element == Bool {
    /// Determines if all elements in the sequence are true.
    ///
    /// This method iterates through the sequence and returns `false` as soon as it encounters
    /// a `false` value. If all elements are `true`, it returns `true`.
    ///
    /// - Returns: `true` if all elements in the sequence are `true`, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///   The method may not need to traverse the entire sequence if a `false` value is encountered early.
    ///
    /// - Note: This method short-circuits on the first `false` value it encounters.
    ///   For an empty sequence, this method returns `true` (vacuous truth).
    ///
    /// - Example:
    ///   ```swift
    ///   let allTrue = [true, true, true].allTrue()  // Returns true
    ///   let notAllTrue = [true, false, true].allTrue()  // Returns false
    ///   let emptySequence = [Bool]().allTrue()  // Returns true
    ///   ```
    @inlinable func allTrue() -> Bool {
        for item in self { guard item else { return false } }
        return true
    }
    
    /// Determines if all elements in the sequence are false.
    ///
    /// This method iterates through the sequence and returns `false` as soon as it encounters
    /// a `true` value. If all elements are `false`, it returns `true`.
    ///
    /// - Returns: `true` if all elements in the sequence are `false`, otherwise `false`.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///   The method may not need to traverse the entire sequence if a `true` value is encountered early.
    ///
    /// - Note: This method short-circuits on the first `true` value it encounters.
    ///   For an empty sequence, this method returns `true` (vacuous truth).
    ///
    /// - Example:
    ///   ```swift
    ///   let allFalse = [false, false, false].allFalse()  // Returns true
    ///   let notAllFalse = [false, true, false].allFalse()  // Returns false
    ///   let emptySequence = [Bool]().allFalse()  // Returns true
    ///   ```
    @inlinable func allFalse() -> Bool {
        for item in self { guard !item else { return false } }
        return true
    }
}

public extension Sequence {
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let people = [Person(name: "Alice"), Person(name: "Alice"), Person(name: "Alice")]
    ///   let allAlice = people.allSatisfy(where: \.name, equalTo: "Alice") // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] == value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 3, 5, 7, 9]
    ///   let allOdd = numbers.allSatisfy(where: \.self, notEqualTo: 2) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] != value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the optional value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: 1), Item(id: 1)]
    ///   let allIdOne = items.allSatisfy(where: \.id, equalTo: 1) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] == value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 2), Item(id: 3), Item(id: nil)]
    ///   let noneIdOne = items.allSatisfy(where: \.id, notEqualTo: 1) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] != value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 4, 5]
    ///   let allLessThanSix = numbers.allSatisfy(where: \.self, lessThan: 6) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Bool {
        allSatisfy { $0[keyPath: key] < value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [6, 7, 8, 9, 10]
    ///   let allGreaterThanFive = numbers.allSatisfy(where: \.self, greaterThan: 5) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Bool {
        allSatisfy { $0[keyPath: key] > value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 4, 5]
    ///   let allLessThanOrEqualToFive = numbers.allSatisfy(where: \.self, lessThanOrEqualTo: 5) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] <= value }
    }
    
    /// Checks if all elements in the sequence satisfy the condition where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    /// - Returns: `true` if all elements satisfy the condition, `false` otherwise.
    ///
    /// - Complexity: O(n), where n is the length of the sequence.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 6, 7, 8, 9]
    ///   let allGreaterThanOrEqualToFive = numbers.allSatisfy(where: \.self, greaterThanOrEqualTo: 5) // Returns true
    ///   ```
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] >= value }
    }
}
