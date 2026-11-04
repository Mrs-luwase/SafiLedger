import Foundation

enum TxStatus {
    case pending, cleared, flagged, reversed
}

struct Transaction: Identifiable, Hashable {
    let id: Int
    let amount: Int
    var kind: String
    let hour: Int
    var status: TxStatus = .pending

    var looksSuspicious: Bool {
        return isSuspicious(amount: amount, hour: hour)
    }

    func summary() -> String {
        return "\(signed(amount)) · \(kind) · \(status)"
    }

    mutating func clear() {
        guard status == .pending else { return }
        status = .cleared
    }

    mutating func flag() {
        guard status == .pending || status == .cleared else { return }
        status = .flagged
    }
}
