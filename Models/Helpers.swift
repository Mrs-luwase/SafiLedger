import Foundation

func formatted(_ n: Int) -> String {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    f.groupingSeparator = ","
    return f.string(from: NSNumber(value: abs(n))) ?? "\(abs(n))"
}

func signed(_ n: Int) -> String {
    return (n >= 0 ? "+" : "-") + formatted(n)
}

func isSuspicious(amount: Int, hour: Int) -> Bool {
    let isHuge = abs(amount) > 80000
    let isOddHour = hour < 5
    return isHuge || isOddHour
}