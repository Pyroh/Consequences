//
//  Zip5.swift
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

@inlinable public func zip5<Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence>(
    _ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) -> Zip4Sequence<Sequence1, Sequence2, Sequence3, Sequence4> {
        Zip4Sequence(sequence1, sequence2, sequence3, sequence4)
    }

@frozen public struct Zip5Sequence<Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5: Sequence> {
    @usableFromInline let sequence1: Sequence1
    @usableFromInline let sequence2: Sequence2
    @usableFromInline let sequence3: Sequence3
    @usableFromInline let sequence4: Sequence4
    @usableFromInline let sequence5: Sequence5
    
    @inlinable init(_ sequence1: Sequence1,
                    _ sequence2: Sequence2,
                    _ sequence3: Sequence3,
                    _ sequence4: Sequence4,
                    _ sequence5: Sequence5) {
        self.sequence1 = sequence1
        self.sequence2 = sequence2
        self.sequence3 = sequence3
        self.sequence4 = sequence4
        self.sequence5 = sequence5
    }
}

extension Zip5Sequence {
    @frozen public struct Iterator {
        @usableFromInline var iterator1: Sequence1.Iterator
        @usableFromInline var iterator2: Sequence2.Iterator
        @usableFromInline var iterator3: Sequence3.Iterator
        @usableFromInline var iterator4: Sequence4.Iterator
        @usableFromInline var iterator5: Sequence5.Iterator
        
        @usableFromInline var reachedEnd: Bool = false
        
        @inlinable init(_ iterator1: Sequence1.Iterator,
                        _ iterator2: Sequence2.Iterator,
                        _ iterator3: Sequence3.Iterator,
                        _ iterator4: Sequence4.Iterator,
                        _ iterator5: Sequence5.Iterator) {
            self.iterator1 = iterator1
            self.iterator2 = iterator2
            self.iterator3 = iterator3
            self.iterator4 = iterator4
            self.iterator5 = iterator5
        }
    }
}

extension Zip5Sequence.Iterator: IteratorProtocol {
    public typealias Element = (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element)
    
    @inlinable mutating public func next() -> (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element)? {
        if reachedEnd { return nil }
        guard let item1 = iterator1.next(),
              let item2 = iterator2.next(),
              let item3 = iterator3.next(),
              let item4 = iterator4.next(),
              let item5 = iterator5.next()
        else {
            reachedEnd = true
            return nil
        }
        
        return (item1, item2, item3, item4, item5)
    }
}

extension Zip5Sequence: Sequence {
    public typealias Element = (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element)
    
    @inlinable public func makeIterator() -> Iterator {
        .init(sequence1.makeIterator(),
              sequence2.makeIterator(),
              sequence3.makeIterator(),
              sequence4.makeIterator(),
              sequence5.makeIterator())
    }
    
    @inlinable public var underestimatedCount: Int {
        Swift.min(
            Swift.min(
                Swift.min(sequence1.underestimatedCount, sequence2.underestimatedCount),
                Swift.min(sequence3.underestimatedCount, sequence4.underestimatedCount)
            ),
            sequence5.underestimatedCount
        )
    }
}

