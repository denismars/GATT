//
//  LinuxPeripheral.swift
//  GATT
//
//  Created by Alsey Coleman Miller on 4/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import SwiftFoundation
import Bluetooth
import BluetoothLinux

#if os(Linux)
    /// The platform specific peripheral.
    public typealias Peripheral = LinuxPeripheral
#endif

public final class LinuxPeripheral: PeripheralManager {
    
    // MARK: - Properties
    
    public var log: (String -> ())?
    
    public let maximumTransmissionUnit: Int
    
    // MARK: - Private Properties
    
    private var database = GATTDatabase()
    
    // MARK: - Initialization
    
    public init(maximumTransmissionUnit: Int = ATT.MTU.LowEnergy.Default) {
        
        self.maximumTransmissionUnit = maximumTransmissionUnit
    }
    
    // MARK: - Methods
    
    public func add(service: Service) throws {
        
        database.services.append(service)
    }
    
    public func clear() {
        
        database.clear()
    }
}