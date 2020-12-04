//
//  State.swift
//  BisKit
//
//  Created by Nicola on 05/11/18.
//  Copyright © 2018 ho0t. All rights reserved.
//

import UIKit

public enum BisState: Int {
    case open
    case closed
    
    var biscuitHeight: CGFloat {
        return self == .closed ? 50 : BisState.automaticDimension
    }
    
    var titleHeight: CGFloat {
        return self == .closed ? biscuitHeight : 16.0
    }
    
    var titleFont: UIFont {
        if self == .open {
            return UIFont.systemFont(ofSize: 12, weight: .medium)
        }
        return UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    func canTransition(to: BisState) -> Bool {
        return to.rawValue != self.rawValue
    }
    
    static var automaticDimension: CGFloat = CGFloat(MAXFLOAT)
}
