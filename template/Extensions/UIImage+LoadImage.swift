//
//  UIImage+LoadImage.swift
//  template
//
//  Created by Максим Ермолаев on 22.10.2021.
//  Copyright © 2021 Maxim Ermolaev. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImageByKf(_ url: String?,
                      placeholder: UIImage?,
                      width: CGFloat,
                      height: CGFloat) {
        
        guard let imgUrl = url else {
            image = placeholder
            return
        }
        
        if let urlImg = URL(string: imgUrl) {
            let screenScale: CGFloat = UIScreen.main.scale
            let processor = ResizingImageProcessor(referenceSize: CGSize(width: width,
                                                                         height: height)) |>
                CroppingImageProcessor(size: CGSize(width: (width) - (1 * screenScale),
                                                    height: (height) - (1 * screenScale)))
            
            kf.setImage(with: urlImg, placeholder: placeholder, options: [.processor(processor)])
        } else {
            image = placeholder
        }
    }
    
    func setImageByKf(_ url: String?,
                      placeholder: UIImage?) {
        
        guard let imgUrl = url else {
            image = placeholder
            return
        }
        
        if let urlImg = URL(string: imgUrl) {
            kf.setImage(with: urlImg, placeholder: placeholder)
        } else {
            image = placeholder
        }
    }
}
