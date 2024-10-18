//
//  LazySequenceExtension.swift
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

public extension LazySequenceProtocol {
    /// Filters the sequence to include only elements where the value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let people = [Person(name: "Alice"), Person(name: "Bob"), Person(name: "Alice")].lazy
    ///   let alices = people.filter(on: \.name, equalTo: "Alice")
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, equalTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == value }
    }
    
    /// Filters the sequence to include only elements where the value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1].lazy
    ///   let nonTwos = numbers.filter(on: \.self, notEqualTo: 2)
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, notEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != value }
    }
    
    /// Filters the sequence to include only elements where the optional value at the given key path is equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 1)].lazy
    ///   let itemsWithIdOne = items.filter(on: \.id, equalTo: 1)
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, equalTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == value }
    }
    
    /// Filters the sequence to include only elements where the optional value at the given key path is not equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 2)].lazy
    ///   let itemsNotOne = items.filter(on: \.id, notEqualTo: 1)
    ///   ```
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, notEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != value }
    }
    
    /// Filters the sequence to include only elements where the value at the given key path is less than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let numbersLessThanSix = numbers.filter(on: \.self, lessThan: 6)
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThan value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] < value }
    }
    
    /// Filters the sequence to include only elements where the value at the given key path is greater than the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let numbersGreaterThanSix = numbers.filter(on: \.self, greaterThan: 6)
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThan value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] > value }
    }
    
    /// Filters the sequence to include only elements where the value at the given key path is less than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let numbersLessThanOrEqualToFive = numbers.filter(on: \.self, lessThanOrEqualTo: 5)
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] <= value }
    }
    
    /// Filters the sequence to include only elements where the value at the given key path is greater than or equal to the provided value.
    ///
    /// - Parameters:
    ///   - key: A key path to a property of the element.
    ///   - value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let numbersGreaterThanOrEqualToSeven = numbers.filter(on: \.self, greaterThanOrEqualTo: 7)
    ///   ```
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] >= value }
    }
    
    /// Filters the sequence to include only elements where the optional value at the given key path is not nil.
    ///
    /// - Parameter key: A key path to an optional property of the element.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements with non-nil values for the specified key path.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 2)].lazy
    ///   let itemsWithId = items.filter(onNotNil: \.id)
    ///   ```
    @inlinable func filter<T>(onNotNil key: KeyPath<Element, T?>) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != nil }
    }
    
    /// Filters the sequence to include only elements where the optional value at the given key path is nil.
    ///
    /// - Parameter key: A key path to an optional property of the element.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements with nil values for the specified key path.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(id: 1), Item(id: nil), Item(id: 2)].lazy
    ///   let itemsWithoutId = items.filter(onNil: \.id)
    ///   ```
    @inlinable func filter<T>(onNil key: KeyPath<Element, T?>) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == nil }
    }
}

public extension LazySequenceProtocol where Element: Equatable {
    /// Filters the sequence to include only elements that are equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1].lazy
    ///   let twos = numbers.filter(equalTo: 2)
    ///   ```
    @inlinable func filter(equalTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 == value }
    }
    
    /// Filters the sequence to include only elements that are not equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the non-matching elements.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [1, 2, 3, 2, 1].lazy
    ///   let notTwos = numbers.filter(notEqualTo: 2)
    ///   ```
    @inlinable func filter(notEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 != value }
    }
}

public extension LazySequenceProtocol where Element: Comparable {
    
    /// Filters the sequence to include only elements that are less than the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements less than the provided value.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let lessThanSix = numbers.filter(lessThan: 6)
    ///   ```
    @inlinable func filter(lessThan value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 < value }
    }
    
    /// Filters the sequence to include only elements that are greater than the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements greater than the provided value.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let greaterThanSix = numbers.filter(greaterThan: 6)
    ///   ```
    @inlinable func filter(greaterThan value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 > value }
    }
    
    /// Filters the sequence to include only elements that are less than or equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements less than or equal to the provided value.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let lessThanOrEqualToFive = numbers.filter(lessThanOrEqualTo: 5)
    ///   ```
    @inlinable func filter(lessThanOrEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 <= value }
    }
    
    /// Filters the sequence to include only elements that are greater than or equal to the provided value.
    ///
    /// - Parameter value: The value to compare against.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements greater than or equal to the provided value.
    ///
    /// - Example:
    ///   ```swift
    ///   let numbers = [5, 3, 7, 2, 8].lazy
    ///   let greaterThanOrEqualToSeven = numbers.filter(greaterThanOrEqualTo: 7)
    ///   ```
    @inlinable func filter(greaterThanOrEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 >= value }
    }
}

public extension LazySequenceProtocol {
    /// Filters the sequence to include only elements where the Boolean value at the given key path is true.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements where the specified Boolean property is true.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)].lazy
    ///   let activeItems = items.filter(on: \.isActive)
    ///   ```
    @inlinable func filter(on key: KeyPath<Element, Bool>) -> LazyFilterSequence<Elements> {
        filter(on: key, equalTo: true)
    }
    
    /// Filters the sequence to include only elements where the Boolean value at the given key path is false.
    ///
    /// - Parameter key: A key path to a Boolean property of the element.
    ///
    /// - Returns: A lazy filtered sequence containing only the elements where the specified Boolean property is false.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(isActive: true), Item(isActive: false), Item(isActive: true)].lazy
    ///   let inactiveItems = items.filter(onNot: \.isActive)
    ///   ```
    @inlinable func filter(onNot key: KeyPath<Element, Bool>) -> LazyFilterSequence<Elements> {
        filter(on: key, equalTo: false)
    }
}

public extension LazySequenceProtocol {
    /// Filters the sequence to include only elements where the string value at the given key path contains the provided substring.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["apple", "banana", "cherry"].lazy
    ///   let wordsWithAn = words.filter(on: \.self, contains: "an")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, contains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].contains(substring) }
    }
    
    /// Filters the sequence to include only elements where the string value at the given key path contains the provided substring, ignoring case.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["Apple", "Banana", "Cherry"].lazy
    ///   let wordsWithAn = words.filter(on: \.self, localizedCaseInsensitiveContains: "AN")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    /// Filters the sequence to include only elements where the string value at the given key path contains the provided substring,
    /// using the current locale's rules for string comparison.
    ///
    /// - Parameters:
    ///   - key: A key path to a String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let words = ["café", "apple", "résumé"].lazy
    ///   let wordsWithE = words.filter(on: \.self, localizedStandardContains: "e")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].localizedStandardContains(substring) }
    }
    
    /// Filters the sequence to include only elements where the optional string value at the given key path contains the provided substring.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(name: "apple"), Item(name: nil), Item(name: "banana")].lazy
    ///   let itemsWithAn = items.filter(on: \.name, contains: "an")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, contains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.contains(substring) ?? false }
    }
    
    /// Filters the sequence to include only elements where the optional string value at the given key path contains the provided substring, ignoring case.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(name: "Apple"), Item(name: nil), Item(name: "Banana")].lazy
    ///   let itemsWithAn = items.filter(on: \.name, localizedCaseInsensitiveContains: "AN")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.localizedCaseInsensitiveContains(substring) ?? false }
    }
    
    /// Filters the sequence to include only elements where the optional string value at the given key path contains the provided substring,
    /// using the current locale's rules for string comparison.
    ///
    /// - Parameters:
    ///   - key: A key path to an optional String property of the element.
    ///   - substring: The substring to search for.
    ///   - flag: A Boolean value that determines whether an empty substring should match all elements. Defaults to true.
    ///
    /// - Returns: A lazy filtered sequence containing only the matching elements.
    ///
    /// - Complexity: O(n*m), where n is the length of the sequence and m is the length of the substring.
    ///
    /// - Example:
    ///   ```swift
    ///   let items = [Item(name: "café"), Item(name: nil), Item(name: "résumé")].lazy
    ///   let itemsWithE = items.filter(on: \.name, localizedStandardContains: "e")
    ///   ```
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.localizedStandardContains(substring) ?? false }
    }
}
