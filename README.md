# SafiLedger

A SwiftUI app that tracks a day's transactions and flags suspicious ones, built with MVVM.


## Steps for Build/Run on the Mac

1. Clone this repo.
2. Open Xcode → File → New → Project → iOS → App → SwiftUI interface, name it SafiLedger.
3. Delete the default ContentView.swift Xcode creates.
4. Drag the Models, ViewModels, and Views folders from the cloned repo into the
   Xcode project navigator (check "Copy items if needed").
5. Open the auto-generated `...App.swift` file, replace what's inside `WindowGroup`
   with `TransactionListView()`.
6. Cmd+B to build. Fix any red errors.
7. Cmd+R to run in Simulator, test tapping a transaction and flagging it.