//
//  ExestationImageView.swift
//  RobustaTask
//
//  Created by mac on 17/04/2021.
//

import Foundation
import UIKit

extension UIImageView{

func makeRounded() {
    let radius = self.frame.width/2.0
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
   }
}
