//: Playground - noun: a place where people can play

import UIKit

func volumeAndSurfaceOfSphere(radian r: Int) -> (volume: Double?, surface: Double?) {

    if (r <= 0 ) {
        return (nil, nil)
    }
    
    return (Double(4 / 3) * .pi * Double(r) * Double(r) * Double(r),
            4 * .pi * Double(r) * Double(r))
}

let calculateSphere = volumeAndSurfaceOfSphere(radian: 10)
print("Volume of sphere : \(calculateSphere.volume) \nSurface area of sphere : \(calculateSphere.surface)")
