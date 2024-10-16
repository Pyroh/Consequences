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
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T>, equalTo value: T) {
        removeAll { $0[keyPath: key] == value }
    }
    
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T>, notEqualTo value: T) {
        removeAll { $0[keyPath: key] != value }
    }
    
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T?>, equalTo value: T) {
        removeAll { $0[keyPath: key] == value }
    }
    
    @inlinable mutating func removeAll<T: Equatable>(where key: KeyPath<Element, T?>, notEqualTo value: T) {
        removeAll { $0[keyPath: key] != value }
    }
    
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, lessThan value: T) {
        removeAll { $0[keyPath: key] < value }
    }
    
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, greaterThan value: T) {
        removeAll { $0[keyPath: key] > value }
    }
    
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, lessThanOrEqualTo value: T) {
        removeAll { $0[keyPath: key] <= value }
    }
    
    @inlinable mutating func removeAll<T: Comparable>(where key: KeyPath<Element, T>, greaterThanOrEqualTo value: T) {
        removeAll { $0[keyPath: key] >= value }
    }
}

public extension RangeReplaceableCollection {
    @inlinable mutating func removeAll(on key: KeyPath<Element, Bool>) {
        removeAll(where: key, equalTo: true)
    }
    
    @inlinable mutating func removeAll(onNot key: KeyPath<Element, Bool>) {
        removeAll(where: key, equalTo: false)
    }
}

public extension RangeReplaceableCollection {
    @inlinable static func +(lhs: Self, rhs: Self.Element) -> Self {
        var ret = lhs
        ret.append(rhs)
        return ret
    }
    
    @inlinable static func +<S>(lhs: Self, rhs: S) -> Self where S: Sequence, S.Element == Element {
        var ret = lhs
        ret.append(contentsOf: rhs)
        return ret
    }
    
    @inlinable static func +=(lhs: inout Self, rhs: Self.Element) {
        lhs.append(rhs)
    }
    
    @inlinable static func +<S>(lhs: inout Self, rhs: S) where S: Sequence, S.Element == Element {
        lhs.append(contentsOf: rhs)
    }
}
