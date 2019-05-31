import Foundation

public class World
{
    //Store our cells
    public var cells = [Cell]()
    //Init the size of our cells
    public let size: Int

    //size initializer
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
    
    //Update cells along with an array
    public func updateCells()
    {
        //Initialise the updated cells
        var updatedCells = [Cell]()
        let liveCells = cells.filter { $0.state == .alive }
        
        for cell in cells
        {
            //Grab the living neighbors
            let livingNeighbors = liveCells.filter { $0.isNeighbor(to: cell) }
            
            /*
                ***Game rules***
             To do that we will create a switch statement who will be our game rules, so if the cell is alive, and its number of live neighbors is two three, it lives on otherwise it dies.
                1 - Any live cell with fewer than two live neighbor will die
                2 - Any live cell with two or three live neighbors will live on the next generation
                3 - Any live cell with more than three live neighbors will die
                4 - Any dead cel with exactly three live neighbors will become a live cell.
             */
            
            switch livingNeighbors.count
            {
            case 2...3 where cell.state == .alive:
                updatedCells.append(cell)
            case 3 where cell.state == .dead:
                let liveCell = Cell(x: cell.x, y: cell.y,  state:  .alive)
                updatedCells.append(liveCell)
            default:
                let deadCell = Cell(x: cell.x, y: cell.y, state: .dead)
                updatedCells.append(deadCell)
            }
        }
        cells = updatedCells
    }
}


