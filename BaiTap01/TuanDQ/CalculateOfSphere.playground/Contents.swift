//: Playground - noun: a place where people can play

import UIKit
import Darwin

func volumeAndSurfaceOfSphere(radian r: Int) -> (volume: Double, surface: Double) {

    if (r <= 0 ) {
        return (0, 0)
    }
    
    return (Double(4 / 3) * M_PI * Double(r) * Double(r) * Double(r),
            4 * M_PI * Double(r) * Double(r))
}

let calculateSphere = volumeAndSurfaceOfSphere(radian: 10)
print("Volume of sphere : \(calculateSphere.volume) \nSurface area of sphere : \(calculateSphere.surface)")