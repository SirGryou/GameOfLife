import Foundation
import UIKit

public class WorldView: UIView
{
    //Declaring world size
    var world: World = World(size: 100)
    //Declaring cell size
    var cellSize: Int = 10
    
    //Declare some parameters
    public convenience init(worldSize: Int, cellSize: Int)
    {
        let frame = CGRect(x: 0, y: 0, width: worldSize * cellSize, height: worldSize * cellSize)
        self.init(frame: frame)
        self.world = World(size: worldSize)
        self.cellSize = cellSize
    }
    
    //Calculating the canvas for the world size
    public convenience init()
    {
        let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        self.init(frame: frame)
    }
    
    //Solving Bugs
    public required init?(coder aDecoder: NSCoder)
    {
        fatalError("Not implemented yet")
    }
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
}

