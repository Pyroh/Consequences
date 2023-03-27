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
    @inlinable func zip<Sequence2: Sequence>(_ sequence2: Sequence2) -> Zip2Sequence<Self, Sequence2> {
        Swift.zip(self, sequence2)
    }
    
    @inlinable func zip<Sequence2: Sequence, Sequence3: Sequence>(_ sequence2: Sequence2, _ sequence3: Sequence3) -> Zip3Sequence<Self, Sequence2, Sequence3> {
        zip3(self, sequence2, sequence3)
    }
    
    @inlinable func zip<Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence>(_ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) -> Zip4Sequence<Self, Sequence2, Sequence3, Sequence4> {
        zip4(self, sequence2, sequence3, sequence4)
    }
}



public extension Sequence {
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, equalTo value: T) -> [Element] {
        filter { $0[keyPath: key] == value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, notEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] != value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, equalTo value: T) -> [Element] {
        filter { $0[keyPath: key] == value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, notEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] != value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThan value: T) -> [Element] {
        filter { $0[keyPath: key] < value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThan value: T) -> [Element] {
        filter { $0[keyPath: key] > value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] <= value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> [Element] {
        filter { $0[keyPath: key] >= value }
    }
    
    @inlinable func filter<T>(onNotNil key: KeyPath<Element, T?>) -> [Element] {
        filter { $0[keyPath: key] != nil }
    }
    
    @inlinable func filter<T>(onNil key: KeyPath<Element, T?>) -> [Element] {
        filter { $0[keyPath: key] == nil }
    }
}

public extension Sequence where Element: Equatable {
    @inlinable func filter(equalTo value: Element) -> [Element] {
        filter { $0 == value }
    }
    
    @inlinable func filter(notEqualTo value: Element) -> [Element] {
        filter { $0 != value }
    }
}
   
public extension Sequence where Element: Comparable {
    
    @inlinable func filter(lessThan value: Element) -> [Element] {
        filter { $0 < value }
    }
    
    @inlinable func filter(greaterThan value: Element) -> [Element] {
        filter { $0 > value }
    }
    
    @inlinable func filter(lessThanOrEqualTo value: Element) -> [Element] {
        filter { $0 <= value }
    }
    
    @inlinable func filter(greaterThanOrEqualTo value: Element) -> [Element] {
        filter { $0 >= value }
    }
}
    
public extension Sequence {
    @inlinable func filter(on key: KeyPath<Element, Bool>) -> [Element] {
        filter(on: key, equalTo: true)
    }
    
    @inlinable func filter(onNot key: KeyPath<Element, Bool>) -> [Element] {
        filter(on: key, equalTo: false)
    }
}

public extension Sequence {
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, contains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].contains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key].localizedStandardContains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, contains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.contains(substring) ?? false }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.localizedCaseInsensitiveContains(substring) ?? false }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> [Element] {
        guard !(substring.isEmpty && flag) else { return .init(self) }
        return filter { $0[keyPath: key]?.localizedStandardContains(substring) ?? false }
    }
}

public extension Sequence {
    @inlinable func filter(using predicates: [Predicate<Element>]) -> [Element] {
        predicates.reduce([Element](self)) { partialResult, predicate in
            predicate.apply(to: partialResult)
        }
    }
}

public extension Sequence {
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Element? {
        first { $0[keyPath: key] == value }
    }
    
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Element? {
        first { $0[keyPath: key] != value }
    }
    
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Element? {
        first { $0[keyPath: key] == value }
    }
    
    @inlinable func first<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Element? {
        first { $0[keyPath: key] != value }
    }
    
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Element? {
        first { $0[keyPath: key] < value }
    }
    
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Element? {
        first { $0[keyPath: key] > value }
    }
    
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Element? {
        first { $0[keyPath: key] <= value }
    }
    
    @inlinable func first<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Element? {
        first { $0[keyPath: key] >= value }
    }
}

public extension Sequence {
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, contains substring: S) -> Element? {
        first { $0[keyPath: key].contains(substring) }
    }
    
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S) -> Element? {
        first { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    @inlinable func first<S: StringProtocol>(where key: KeyPath<Element, String>, localizedStandardContains substring: S) -> Element? {
        first { $0[keyPath: key].localizedStandardContains(substring) }
    }
}

public extension Sequence {
    
    @inlinable func sorted<T: Comparable>(by key: KeyPath<Element, T>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key] < rhs[keyPath: key] }
    }
    
    @inlinable func sorted(alphabetically key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].compare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    @inlinable func sorted(caseInsensitiveBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].caseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    @inlinable func sorted(localizedBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    @inlinable func sorted(localizedCaseInsensitiveBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedCaseInsensitiveCompare(rhs[keyPath: key]) == .orderedAscending }
    }
    
    @inlinable func sorted(localizedStandardBy key: KeyPath<Element, String>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in lhs[keyPath: key].localizedStandardCompare(rhs[keyPath: key]) == .orderedAscending }
    }
}

public extension Sequence {
    
    @inlinable func sorted<T: Comparable>(by key: KeyPath<Element, T?>) -> [Element] {
        sorted { (lhs, rhs) -> Bool in
            switch (lhs[keyPath: key], rhs[keyPath: key]) {
            case (.some, .none): return false
            case (.some(let l), .some(let r)): return l < r
            default: return true
            }
        }
    }
    
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
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Bool {
        contains { $0[keyPath: key] == value }
    }
    
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] != value }
    }
    
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Bool {
        contains { $0[keyPath: key] == value }
    }
    
    @inlinable func contains<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] != value }
    }
    
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Bool {
        contains { $0[keyPath: key] < value }
    }
    
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Bool {
        contains { $0[keyPath: key] > value }
    }
    
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] <= value }
    }
    
    @inlinable func contains<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Bool {
        contains { $0[keyPath: key] >= value }
    }
}

public extension Sequence where Element == Bool {
    @inlinable func allTrue() -> Bool {
        for item in self { guard item else { return false } }
        return true
    }
    
    @inlinable func allFalse() -> Bool {
        for item in self { guard !item else { return false } }
        return true
    }
}

public extension Sequence {
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] == value }
    }
    
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] != value }
    }
    
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] == value }
    }
    
    @inlinable func allSatisfy<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] != value }
    }
    
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Bool {
        allSatisfy { $0[keyPath: key] < value }
    }
    
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Bool {
        allSatisfy { $0[keyPath: key] > value }
    }
    
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] <= value }
    }
    
    @inlinable func allSatisfy<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Bool {
        allSatisfy { $0[keyPath: key] >= value }
    }
}
