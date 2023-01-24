//
//  Predicate.swift
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

public struct Predicate<Element> {
    @usableFromInline
    let isIncluded: (Element) -> Bool
    
    @usableFromInline
    init(isIncluded: @escaping (Element) -> Bool) {
        self.isIncluded = isIncluded
    }
    
    @usableFromInline
    func apply<S: Sequence>(to sequence: S) -> [Element] where S.Element == Element {
        sequence.filter(isIncluded)
    }
}

public extension Predicate {
    @inlinable static func custom(_ isIncluded: @escaping (Element) -> Bool) -> Self {
        .init(isIncluded: isIncluded)
    }
    @inlinable static func onNil<T>(_ key: KeyPath<Element, T?>) -> Self {
        .init { $0[keyPath: key] == nil }
    }
    @inlinable static func onNotNil<T>(_ key: KeyPath<Element, T?>) -> Self {
        .init { $0[keyPath: key] != nil }
    }
    @inlinable static func on<T: Equatable>(_ key: KeyPath<Element, T>, equalTo value: T) -> Self {
        .init { $0[keyPath: key] == value }
    }
    @inlinable static func on<T: Equatable>(_ key: KeyPath<Element, T>, notEqualTo value: T) -> Self {
        .init { $0[keyPath: key] != value }
    }
    @inlinable static func on<T: Equatable>(_ key: KeyPath<Element, T?>, equalTo value: T) -> Self {
        .init { $0[keyPath: key] == value }
    }
    @inlinable static func on<T: Equatable>(_ key: KeyPath<Element, T?>, notEqualTo value: T) -> Self {
        .init { $0[keyPath: key] != value }
    }
    @inlinable static func on<T: Comparable>(_ key: KeyPath<Element, T>, lessThan value: T) -> Self {
        .init { $0[keyPath: key] < value }
    }
    @inlinable static func on<T: Comparable>(_ key: KeyPath<Element, T>, greaterThan value: T) -> Self {
        .init { $0[keyPath: key] > value }
    }
    @inlinable static func on<T: Comparable>(_ key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Self {
        .init { $0[keyPath: key] <= value }
    }
    @inlinable static func on<T: Comparable>(_ key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Self {
        .init { $0[keyPath: key] >= value }
    }
    @inlinable static func on(_ key: KeyPath<Element, Bool>) -> Self {
        .init { $0[keyPath: key] }
    }
    @inlinable static func onNot(_ key: KeyPath<Element, Bool>) -> Self {
        .init { !$0[keyPath: key] }
    }
    @inlinable static func on<S: StringProtocol>(_ key: KeyPath<Element, String>, contains substring: S, containsEmpty flag: Bool = true) -> Self {
        guard !(substring.isEmpty && flag) else { return .init { _ in true } }
        return .init { $0[keyPath: key].contains(substring) }
    }
    @inlinable static func on<S: StringProtocol>(_ key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> Self {
        guard !(substring.isEmpty && flag) else { return .init { _ in true } }
        return .init { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    @inlinable static func on<S: StringProtocol>(_ key: KeyPath<Element, String>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> Self {
        guard !(substring.isEmpty && flag) else { return .init { _ in true } }
        return .init { $0[keyPath: key].localizedStandardContains(substring) }
    }
}
