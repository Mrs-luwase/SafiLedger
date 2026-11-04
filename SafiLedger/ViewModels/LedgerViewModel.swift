import SwiftUI

class LedgerViewModel: ObservableObject {
    @Published var transactions: [Transaction] = [
        Transaction(id: 1, amount: 45000,   kind: "MoMo",     hour: 9,  status: .cleared),
        Transaction(id: 2, amount: -12500,  kind: "Bank",     hour: 10, status: .cleared),
        Transaction(id: 3, amount: -900000, kind: "Transfer", hour: 3,  status: .pending),
        Transaction(id: 4, amount: 8000,    kind: "Cash",     hour: 11, status: .cleared),
        Transaction(id: 5, amount: 60000,   kind: "MoMo",     hour: 14, status: .cleared)
    ]

    var totalBalance: Int {
        transactions.reduce(0) { $0 + $1.amount }
    }

    var flaggedCount: Int {
        transactions.filter { $0.status == .flagged }.count
    }

    func flagAsSuspicious(_ transaction: Transaction) {
        if let i = transactions.firstIndex(where: { $0.id == transaction.id }) {
            transactions[i].flag()
        }
    }
}
