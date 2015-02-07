//
//  SocketControllerExtension.swift
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

import Foundation

@objc(SocketDataIO)
protocol SocketDataIO {
    @objc(dataIn:)
    func dataIn(NSData)
    
    @objc(dataOut:)
    func dataOut(NSData)
}

extension SocketController {
    class var sharedInstance: SocketController {
        struct Static {
            static var instance: SocketController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = SocketController()
        }
        
        return Static.instance!
    }
    
//MARK: Messaging
    
//MARK: Data
    
    
}