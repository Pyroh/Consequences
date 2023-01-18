import XCTest
@testable import Consequences

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
        
        s1.last(where: { $0 == 1 })
    }
}
