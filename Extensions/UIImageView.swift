//
//  UIImageView.swift
//  Useful
//
//  Created by 정호진 on 2023/07/14.
//

import Foundation
import UIKit

extension UIImageView {
    func load(img: UIImageView, url: URL, btn: UIButton){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        img.image = image
                        btn.setImage(img.image?.resize(newWidth: 50), for: .normal)
                    }
                }
            }
        }
    }
    func load(img: UIImageView, url: URL, size: CGFloat?){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if let size = size{
                            img.image = image.resize(newWidth: size)
                        }
                        else{
                            img.image = image
                        }
                    }
                }
            }
        }
    }
    
    func load(img: UIImageView, url: URL, width: CGFloat?, height: CGFloat?){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if let width = width, let height = height{
                            img.image = image.resize(newWidth: width, newHeight: height)
                        }
                        else{
                            img.image = image
                        }
                    }
                }
            }
        }
    }
}
