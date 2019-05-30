import Foundation

public class World
{
    public var cells = [Cell]()
    public let size: Int

    public init(size: Int)
    {
        self.size = size
        for x in 0..<size
            {
                for y in 0..<size
                {
                    let randomState = arc4random_uniform(3)
                    let cell = Cell (x: x, y: y, state: randomState == 0 ? .alive : .dead)
                    cells.append(cell)
                }
            }
        
    
    }
}

