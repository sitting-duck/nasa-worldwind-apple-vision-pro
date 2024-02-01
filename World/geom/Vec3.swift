//
//  Vec3.swift
//  World
//
//  Created by Ashley on 1/30/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

class Vec3: Vec2 {
    public var z: Double
    
    /**
     * A vector corresponding to the origin.
     */
    // public static readonly ZERO = new Vec3(0, 0, 0);
    /**
     * Constructs a three-component vector.
     * Represents a three-component vector. Access the X component of the vector as v.x, the Y
     * component as v.y and the Z component as v.z.
     * @param  x - X component of vector.
     * @param  y - Y component of vector.
     * @param  z - Z component of vector.
     */
    init(x: Double, y: Double, z: Double) {
        self.z = z
        super.init(x: x, y: y)
    }
    
    // Static method to create a zero vector
    func zero() -> Vec3 {
        return Vec3(x: 0, y: 0, z: 0)
    }
    
    // Method to clone the vector
    override func clone() -> Vec3 {
        return Vec3(x: self.x, y: self.y, z: self.z)
    }
    
    // Static method to compute the average of an array of Vec3
    static func average(vectors: [Vec3], result: inout Vec3) throws {
        guard !vectors.isEmpty else {
            throw WWError.customError(MessageTable.values["missingArray"] ?? "")
        }

        result.x = 0
        result.y = 0
        result.z = 0

        let count = Double(vectors.count)
        for vec in vectors {
            result.x += vec.x / count
            result.y += vec.y / count
            result.z += vec.z / count
        }
    }
    
}
