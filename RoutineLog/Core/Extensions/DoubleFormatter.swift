//
//  DoubleFormatter.swift
//  RoutineLog
//
//  Created by Acoman on 5.06.2026.
//

import Foundation


extension Double {
    var oneDecimal: String {
        return self.formatted(.number.precision(.fractionLength(1)))
    }
}

