//
//  SocketController.swift
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

import Foundation
import UIKit
import Starscream

@objc(SocketController)
class SocketController : WebSocketDelegate {
    private var endpoint = NSURL(string: FIN_ENDPOINT)!
    var socket : WebSocket
    
//MARK: Init
    init () {
        self.socket = WebSocket(url: endpoint)
        //self.socket.delegate = self
        //self.socket.connect()
    }
    
//MARK: - WebSocketDelegate
//MARK: Connection
    func websocketDidConnect() {
        println("Websocket connected")
    }
    
    func websocketDidDisconnect(error: NSError?) {
        println("Websocket disconnected \(error?.localizedDescription)")
        
    }
    
//MARK: Receiving
    func websocketDidReceiveData(data: NSData) {
        println("Received data from Websocket")
    }
    
    func websocketDidReceiveMessage(text: String) {
        println("Received message from Websocket")
    }
    
//MARK: Error
    func websocketDidWriteError(error: NSError?) {
        println("Websocket wrote error \(error?.localizedDescription)")

    }
    
}
