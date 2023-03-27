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
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, equalTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T>, notEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, equalTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == value }
    }
    
    @inlinable func filter<T: Equatable>(on key: KeyPath<Element, T?>, notEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThan value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] < value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThan value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] > value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] <= value }
    }
    
    @inlinable func filter<T: Comparable>(on key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] >= value }
    }
    
    @inlinable func filter<T>(onNotNil key: KeyPath<Element, T?>) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] != nil }
    }
    
    @inlinable func filter<T>(onNil key: KeyPath<Element, T?>) -> LazyFilterSequence<Elements> {
        filter { $0[keyPath: key] == nil }
    }
}

public extension LazySequenceProtocol where Element: Equatable {
    @inlinable func filter(equalTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 == value }
    }
    
    @inlinable func filter(notEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 != value }
    }
}

public extension LazySequenceProtocol where Element: Comparable {
    
    @inlinable func filter(lessThan value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 < value }
    }
    
    @inlinable func filter(greaterThan value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 > value }
    }
    
    @inlinable func filter(lessThanOrEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 <= value }
    }
    
    @inlinable func filter(greaterThanOrEqualTo value: Element) -> LazyFilterSequence<Elements> {
        filter { $0 >= value }
    }
}

public extension LazySequenceProtocol {
    @inlinable func filter(on key: KeyPath<Element, Bool>) -> LazyFilterSequence<Elements> {
        filter(on: key, equalTo: true)
    }
    
    @inlinable func filter(onNot key: KeyPath<Element, Bool>) -> LazyFilterSequence<Elements> {
        filter(on: key, equalTo: false)
    }
}

public extension LazySequenceProtocol {
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, contains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].contains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key].localizedStandardContains(substring) }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, contains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.contains(substring) ?? false }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedCaseInsensitiveContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.localizedCaseInsensitiveContains(substring) ?? false }
    }
    
    @inlinable func filter<S: StringProtocol>(on key: KeyPath<Element, String?>, localizedStandardContains substring: S, containsEmpty flag: Bool = true) -> LazyFilterSequence<Elements> {
        guard !(substring.isEmpty && flag) else { return filter { _ in true } }
        return filter { $0[keyPath: key]?.localizedStandardContains(substring) ?? false }
    }
}

