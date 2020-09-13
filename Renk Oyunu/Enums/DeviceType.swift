//
//  Model.swift
//  Renk Oyunu
//
//  Created by Burak Erarslan on 13.09.2020.
//  Copyright © 2020 Burak ERARSLAN. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

import UIKit

public enum DeviceType {
    case iPhone4
    case iPhone5
    case iPhone678
    case iPhone678Plus
    case iPhoneXXs
    case iPhoneXsMaxXr
    case unknown
    
    public func size() -> CGSize {
        switch self {
        case .iPhone4:
            return CGSize(width: 320, height: 480)
        case .iPhone5:
            return CGSize(width: 320, height: 568)
        case .iPhone678:
            return CGSize(width: 375, height: 667)
        case .iPhone678Plus:
            return CGSize(width: 414, height: 736)
        case .iPhoneXXs:
            return CGSize(width: 375, height: 812)
        case .iPhoneXsMaxXr:
            return CGSize(width: 414, height: 896)
        default:
            return CGSize.zero
        }
    }
    
    public func currentDevice(size: CGSize = UIScreen.main.bounds.size) -> DeviceType {
        switch size {
        case CGSize(width: 320, height: 480):
            return .iPhone4
        case CGSize(width: 320, height: 568):
            return .iPhone5
        case CGSize(width: 375, height: 667):
            return .iPhone678
        case CGSize(width: 414, height: 736):
            return .iPhone678Plus
        case CGSize(width: 375, height: 812):
            return .iPhoneXXs
        case CGSize(width: 414, height: 896):
            return .iPhoneXsMaxXr
        default:
            return .unknown
        }
    }
}
