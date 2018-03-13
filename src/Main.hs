import World
import Graphics
import qualified Conway

colorCell :: Conway.CellState -> PatchColor
colorCell Conway.Alive = brown
colorCell Conway.Dead  = pink

main :: IO ()
main = do
  world <- Conway.randomWorld 200 200
  doGraphics colorCell (evolve Conway.evolveCell) world
