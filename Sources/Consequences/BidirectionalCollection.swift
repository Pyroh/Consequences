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
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] == value }
    }
    
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] != value }
    }
    
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] == value }
    }
    
    @inlinable func lastIndex<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] != value }
    }
    
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Index? {
        lastIndex { $0[keyPath: key] < value }
    }
    
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Index? {
        lastIndex { $0[keyPath: key] > value }
    }
    
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] <= value }
    }
    
    @inlinable func lastIndex<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Index? {
        lastIndex { $0[keyPath: key] >= value }
    }
}

public extension BidirectionalCollection {
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) -> Element? {
        last { $0[keyPath: key] == value }
    }
    
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) -> Element? {
        last { $0[keyPath: key] != value }
    }
    
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) -> Element? {
        last { $0[keyPath: key] == value }
    }
    
    @inlinable func last<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) -> Element? {
        last { $0[keyPath: key] != value }
    }
    
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) -> Element? {
        last { $0[keyPath: key] < value }
    }
    
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) -> Element? {
        last { $0[keyPath: key] > value }
    }
    
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) -> Element? {
        last { $0[keyPath: key] <= value }
    }
    
    @inlinable func last<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) -> Element? {
        last { $0[keyPath: key] >= value }
    }
}

public extension BidirectionalCollection {
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, contains substring: S) -> Element? {
        last { $0[keyPath: key].contains(substring) }
    }
    
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, localizedCaseInsensitiveContains substring: S) -> Element? {
        last { $0[keyPath: key].localizedCaseInsensitiveContains(substring) }
    }
    
    @inlinable func last<S: StringProtocol>(where key: KeyPath<Element, String>, localizedStandardContains substring: S) -> Element? {
        last { $0[keyPath: key].localizedStandardContains(substring) }
    }
}
