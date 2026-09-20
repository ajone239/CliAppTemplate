import Testing
import Foundation
@testable import CalTrackCore

func loadFixture(_ name: String) throws -> [DailyRecord] {
    let url = try #require(Bundle.module.url(
        forResource: name, withExtension: "csv", subdirectory: "Fixtures"
    ))
    let text = try String(contentsOf: url, encoding: .utf8)
    let fmt = DateFormatter()
    fmt.dateFormat = "yyyy-MM-dd"
    return text.split(separator: "\n").dropFirst().compactMap { line in
        let f = line.split(separator: ",")
        guard f.count >= 3, let d = fmt.date(from: String(f[0])),
              let w = Double(f[1]), let k = Double(f[2]) else { return nil }
        return DailyRecord(date: d, weightLb: w, intakeKcal: k)
    }
}

@Test func tdeeIsUnbiasedOnKnownFixture() throws {
    let records = try loadFixture("sample")
    let tdee = try #require(EnergyBalance.estimateTDEE(records))
    #expect(abs(tdee - 2600) < 50)
}
