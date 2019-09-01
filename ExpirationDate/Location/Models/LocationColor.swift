//
//  LocationColor.swift
//  ExpirationDate
//
//  Created by JiminYoo on 01/09/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

/// DB Location.color와 맞춘 색생. 함부로 바꾸지 말것.
enum LocationColor: Int {
    case red = 1
    case orange = 2
//    case yellow = 3
    case green = 4
//    case blue = 5
//    case navy = 6
    case purple = 7
//    case skyBlue = 8
    case gray = 9
    
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .orange:
            return .orange
        case .green:
            return .green
        case .purple:
            return .purple
        case .gray:
            return .gray
        }
    }
}
