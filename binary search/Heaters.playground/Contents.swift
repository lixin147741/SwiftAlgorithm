// Author: Kee
class Heaters {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var i = 0, radius = 0
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        
        for house in houses {
            while i < heaters.count - 1 && 2 * house >= heaters[i] + heaters[i + 1]  {
                i += 1
            }
            
            radius = max(radius, abs(house - heaters[i]))
        }
        
        return radius
    }
}

