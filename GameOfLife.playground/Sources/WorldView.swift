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
    
    //Drawing some cells
    public override func draw(_ rect: CGRect)
    {
        //Reference to the CGContext
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        //Passing messages thrue this context to draw for every cell that exists in the world
        for cell in world.cells
            {
                let rect = CGRect(x: cell.x * cellSize, y: cell.y * cellSize, width: cellSize, height: cellSize)
                let color = cell.state == .alive ? UIColor.blue.cgColor : UIColor.white.cgColor
                context?.addRect(rect)
                context?.setFillColor(color)
                context?.fill(rect)
                //Set the change we done so that they can appear in the view
                context?.restoreGState()
            }
    }
}

