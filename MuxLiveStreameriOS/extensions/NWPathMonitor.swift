//
//  NWPathMonitor.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/28/21.
//

import Network

extension NWPathMonitor {

    /// Unfortunately in order to give accurate observations of connectivity a slight delay is required.
    /// To prove the issue, connect, disconnect, then connect again, the value of connectivity will be disconnected
    ///  After a slight delay the connectivity provides the correct value.
    /// - Parameter connectionChanged: Passes a boolean value indicating when connected. true means connected.
    func monitorConnected(
        connectionChanged: @escaping (Bool) -> Void
    ) {
        pathUpdateHandler = { path in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                connectionChanged(sockaddr_in.isConnectedToNetwork)
            }
        }
        start(queue: DispatchQueue(label: "Monitor"))
    }
}
