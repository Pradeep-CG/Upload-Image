//
//  ImageManager.swift
//  UploadImage
//
//  Created by Pradeep on 01/05/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation

struct ImageManager
{
    func uploadImage(data: Data, completionHandler: @escaping(_ result: ImageResponse) -> Void)
    {
        let httpUtility = HttpUtility()

//        let imageUploadRequest = ImageRequest(attachment: data.base64EncodedString(), fileName: "multipartFormUploadExample")
//
//        httpUtility.postApiDataWithMultipartForm(requestUrl: URL(string: Endpoints.uploadImageMultiPartForm)!, request: imageUploadRequest, resultType: ImageResponse.self) {
//            (response) in
//
//            _ = completionHandler(response)
//
//        }

        // Upload image with base64 format
         let imageUploadRequest = ImageRequest(attachment: data.base64EncodedString(), fileName: "base64Example")
                do {
                     let postBody = try JSONEncoder().encode(imageUploadRequest)
        
                    httpUtility.postApiData(requestUrl: URL(string: Endpoints.uploadImage)!, requestBody: postBody, resultType: ImageResponse.self) { (response) in
        
                        _ = completionHandler(response)
                    }
        
                } catch let error {
                    debugPrint(error)
                }

//----------------------------------------------------------------------------------
        
        // Upload image with byte array format

        // let imageUploadRequest = ImageRequest(attachment: data, fileName: "base64Example")
        //        do {
        //             let postBody = try JSONEncoder().encode(request)
        //
        //            httpUtility.postApiData(requestUrl: URL(string: Endpoints.uploadImageWithByteArray)!, requestBody: postBody, resultType: ImageResponse.self) { (response) in
        //
        //                _ = completionHandler(response)
        //            }
        //
        //        } catch let error {
        //            debugPrint(error)
        //        }


    }
}
