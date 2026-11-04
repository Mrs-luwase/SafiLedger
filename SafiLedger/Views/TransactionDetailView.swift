import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    @ObservedObject var vm: LedgerViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text(transaction.kind).font(.largeTitle).bold()
            Text(signed(transaction.amount)).font(.title2)
            Text("Hour: \(transaction.hour)h").foregroundStyle(.secondary)
            Text("Status: \(String(describing: transaction.status))")
                .foregroundStyle(.secondary)

            Button("Flag as suspicious") {
                vm.flagAsSuspicious(transaction)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
        .navigationTitle("Transaction")
    }
}