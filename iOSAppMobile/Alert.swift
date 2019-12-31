//
//  sound.swift
//  ios_ring
//
//  Created by mwnl on 2019/8/26.
//  Copyright © 2019年 mwnl. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVPlayer?

public func Alert(){
    if let url = Bundle.main.url(forResource: "Alert", withExtension: "mp3") {
        player = AVPlayer(url: url)
        player?.play()
    }
}
public func stopAlert(){
    player?.pause()
}
