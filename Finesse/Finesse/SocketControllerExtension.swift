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
    
}