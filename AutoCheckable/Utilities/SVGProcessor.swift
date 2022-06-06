//
//  SVGProcessor.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import Foundation
import SVGKit
import Kingfisher

public struct SVGImgProcessor: ImageProcessor {
    public var identifier: String = "ke.co.smith.Smithers"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
