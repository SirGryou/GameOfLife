import UIKit
import PlaygroundSupport

/*
 Here is the playground of my Game of life
*/

let view = WorldView(worldSize: 50, cellSize: 5)
view .autoRun()
PlaygroundPage.current.liveView = view

