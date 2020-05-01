//
//  ImageRequestModel.swift
//  UploadImage
//
//  Created by Pradeep on 01/05/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation

struct ImageRequest : Encodable
{
    let attachment : String
    let fileName : String
}

// use this for uploading images with byte array
//struct ImageRequest : Encodable
//{
//    let attachment : Data
//    let fileName : String
//}
