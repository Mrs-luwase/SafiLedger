import SwiftUI

struct TransactionListView: View {
    @StateObject private var vm = LedgerViewModel()

    var body: some View {
        NavigationStack {
            List(vm.transactions) { transaction in
                NavigationLink(value: transaction) {
                    HStack {
                        Circle()
                            .fill(color(for: transaction))
                            .frame(width: 12, height: 12)
                        VStack(alignment: .leading) {
                            Text(transaction.kind).font(.headline)
                            Text("\(transaction.hour):00")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(signed(transaction.amount))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Today's Ledger")
            .navigationDestination(for: Transaction.self) { transaction in
                TransactionDetailView(transaction: transaction, vm: vm)
            }
        }
    }

    func color(for transaction: Transaction) -> Color {
        switch transaction.status {
        case .flagged:  return .red
        case .pending:  return .orange
        case .cleared:  return .green
        case .reversed: return .gray
        }
    }
}