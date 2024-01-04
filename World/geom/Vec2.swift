import Foundation

class Vec2 {
    var x: Double
    var y: Double

    // Initializes a two-component vector with specified x and y components.
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    // Sets the components of this vector.
    func setVec2(x: Double, y: Double) -> Vec2 {
        self.x = x
        self.y = y
        return self
    }

    // Copies the components of the specified vector to this vector.
    func copyVec2(vector: Vec2) -> Vec2 {
        self.x = vector.x
        self.y = vector.y
        return self
    }

    // Checks if the x and y components of this vector are equal to those of the specified vector.
    func equals(vector: Vec2) -> Bool {
        return self.x == vector.x && self.y == vector.y
    }

    // Creates and returns a new vector with both x and y set to zero.
    static func zero() -> Vec2 {
        return Vec2(x: 0, y: 0)
    }

    // Computes the average of the specified array of vectors.
    static func average(vectors: [Vec2], result: Vec2) -> Vec2 {
        let count = Double(vectors.count)
        result.x = 0
        result.y = 0

        for vec in vectors {
            result.x += vec.x / count
            result.y += vec.y / count
        }

        return result
    }

    // Adds the specified vector to this vector.
    func add(addend: Vec2) -> Vec2 {
        self.x += addend.x
        self.y += addend.y
        return self
    }

    // Subtracts the specified vector from this vector.
    func subtract(subtrahend: Vec2) -> Vec2 {
        self.x -= subtrahend.x
        self.y -= subtrahend.y
        return self
    }

    // Multiplies this vector by a scalar.
    func multiply(scalar: Double) -> Vec2 {
        self.x *= scalar
        self.y *= scalar
        return self
    }

    // Divides this vector by a scalar.
    func divide(divisor: Double) -> Vec2 {
        self.x /= divisor
        self.y /= divisor
        return self
    }

    // Returns a new vector that is a clone of this vector.
    func clone() -> Vec2 {
        return Vec2(x: self.x, y: self.y)
    }

    // Mixes (interpolates) the specified vector with this vector.
    func mix(vector: Vec2, weight: Double) -> Vec2 {
        let w0 = 1 - weight
        let w1 = weight

        self.x = self.x * w0 + vector.x * w1
        self.y = self.y * w0 + vector.y * w1

        return self
    }

    // Negates this vector.
    func negate() -> Vec2 {
        self.x = -self.x
        self.y = -self.y
        return self
    }

    // Computes the scalar dot product of this vector and the specified vector.
    func dot(vector: Vec2) -> Double {
        return self.x * vector.x + self.y * vector.y
    }

    // Computes the squared magnitude of this vector.
    func magnitudeSquared() -> Double {
        return self.dot(vector: self)
    }

    // Computes the magnitude of this vector.
    func magnitude() -> Double {
        return sqrt(self.magnitudeSquared())
    }

    // Normalizes this vector to a unit vector.
    func normalize() -> Vec2 {
        let magnitude = self.magnitude()
        let magnitudeInverse = 1 / magnitude

        self.x *= magnitudeInverse
        self.y *= magnitudeInverse

        return self
    }

    // Computes the squared distance from this vector to the specified vector.
    func distanceToSquared(vector: Vec2) -> Double {
        let dx = self.x - vector.x
        let dy = self.y - vector.y

        return dx * dx + dy * dy
    }

    // Computes the distance from this vector to the specified vector.
    func distanceTo(vector: Vec2) -> Double {
        return sqrt(self.distanceToSquared(vector: vector))
    }

    // Swaps the components of this vector with those of another vector.
    func swap(that: Vec2) -> Vec2 {
        let tmpX = self.x
        self.x = that.x
        that.x = tmpX

        let tmpY = self.y
        self.y = that.y
        that.y = tmpY

        return self
    }

    // Returns a string representation of this vector.
    func toString() -> String {
        return "(\(self.x), \(self.y))"
    }
}
