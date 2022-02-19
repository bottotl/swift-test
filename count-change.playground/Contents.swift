import UIKit


func firstDenomination(kindOfCoins: Int) -> Int {
    if (kindOfCoins == 1) {
        return 1;
    } else if (kindOfCoins == 2) {
        return 5;
    } else if (kindOfCoins == 3) {
        return 10;
    } else if (kindOfCoins == 4) {
        return 25;
    } else if (kindOfCoins == 5) {
        return 50;
    }

    return 50;
}

func countChange(amount: Int) -> Int {
    return cc(amount: amount, kindOfCoins: 5);
}

var cache: [String : Int] = NSMutableDictionary.init() as! [String : Int]

func cc(amount: Int, kindOfCoins: Int) -> Int {
    let key = "\(amount)-\(kindOfCoins)"
    if let t = cache[key] {
        return t;
    }
    var result = 0
    if (amount == 0) {
        result = 1
    } else if ((amount < 0) || (kindOfCoins == 0)) {
        result = 0
    } else {
        result = cc(amount: amount, kindOfCoins: kindOfCoins - 1) + cc(amount: amount - firstDenomination(kindOfCoins: kindOfCoins), kindOfCoins: kindOfCoins)
    }
    cache[key] = result
    return result
}


print(countChange(amount: 100))
