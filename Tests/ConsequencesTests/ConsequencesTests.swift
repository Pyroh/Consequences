import XCTest
@testable import Consequences

struct OPT: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByNilLiteral, Equatable {
    let value: Double?
    
    var amount: Double { value ?? 0 }
    
    init(_ value: Double?) {
        self.value = value
    }
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
    }
    
    init(floatLiteral value: FloatLiteralType) {
        self.value = Double(value)
    }
    
    init(nilLiteral: ()) {
        self.value = nil
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

struct PT: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, Equatable {
    let value: Double
    
    init(_ value: Double) {
        self.value = value
    }
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
    }
    
    init(floatLiteral value: FloatLiteralType) {
        self.value = Double(value)
    }
}

final class ConsequencesTests: XCTestCase {
    func testZip3() {
        let s1 = Array(repeating: 1, count: 2)
        let s2 = Array(repeating: 2, count: 2)
        let s3 = Array(repeating: 3, count: 2)
        
        let z1 = Zip3Sequence(s1, s2, s3)
        let z2 = s1.zip(s2, s3)
        
        XCTAssert(z1.map { $0 == (1, 2, 3) }.allTrue())
        XCTAssert(z2.map { $0 == (1, 2, 3) }.allTrue())
    }
    
    func testZip4() {
        let s1 = Array(repeating: 1, count: 2)
        let s2 = Array(repeating: 2, count: 2)
        let s3 = Array(repeating: 3, count: 2)
        let s4 = Array(repeating: 4, count: 2)
        
        let z1 = Zip4Sequence(s1, s2, s3, s4)
        let z2 = s1.zip(s2, s3, s4)
        
        XCTAssert(z1.map { $0 == (1, 2, 3, 4) }.allTrue())
        XCTAssert(z2.map { $0 == (1, 2, 3, 4) }.allTrue())
    }
    
    func testOptionalPredicates() {
        let s = [OPT](arrayLiteral: 1, 2, nil, nil, 5, nil, 7)
        XCTAssert(s.filter(using: [.onNotNil(\.value)]) == [1, 2, 5, 7])
        XCTAssert(s.filter(using: [.onNil(\.value)]) == [nil, nil, nil])
        XCTAssert(s.filter(using: [.onNotNil(\.value), .on(\.amount, lessThan: 2)]) == [1])
        XCTAssert(s.filter(using: [.onNotNil(\.value), .on(\.amount, lessThanOrEqualTo: 2)]) == [1, 2])
        XCTAssert(s.filter(using: [.onNotNil(\.value), .on(\.amount, equalTo: 3)]).isEmpty)
    }
}
