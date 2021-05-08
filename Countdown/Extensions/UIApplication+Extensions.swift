//
//  UIApplication+Extensions.swift
//  Countdown
//
//  Created by cnwang on 2021/5/8.
//

import Foundation
import SwiftUI
extension UIApplication {
static var appVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
 }
    static var appBuildVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
