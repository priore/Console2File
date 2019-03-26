//
//  Console2File.swift
//
//  Created by Danilo Priore on 26/08/18.
//  Copyright © 2018 Danilo Priore. All rights reserved.
//

import Foundation

public class Console2File {
    
    // to log even when a device is not connected to xcode
    // it generates a file that you can then download from the Organizer
    // select Devices -> select device -> select app ->  Dowload container
    // after you can able show the content of file and you navigate
    // to Document folder for get the log file.
    public static func start() {
        
        #if DEBUG // only DEBUG mode
        
        if !self.isXcode() {
            let docDirectory: NSString = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                                             FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
            let logpath = docDirectory.appendingPathComponent("application.log")
            let log = logpath.cString(using: .ascii)
            
            freopen(log, "a+", stderr)
            freopen(log, "a+", stdin)
            freopen(log, "a+", stdout)
        }
        #endif
    }
    
    #if DEBUG
    private static func isXcode() -> Bool {
        
        var info = kinfo_proc()
        var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        assert(junk == 0, "sysctl failed")
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
    #endif
    
}
