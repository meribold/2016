import Data.List
import Data.Array
import Data.Map (Map)
import qualified Data.Map as Map

data Color = Black | Green | Purple | Red | Yellow deriving(Show, Read, Eq, Ord)
data Tile = Tile (Maybe Color) Color deriving(Show, Eq, Ord)
type Stone = Color
type Board = Array Int Tile
type Position = Int
type Inventory = Map Color Integer

color :: Board -> Position -> Color
color board position = case board ! position of
   Tile Nothing color  -> color
   Tile (Just color) _ -> color

free :: Tile -> Bool
free (Tile Nothing _) = True
free _ = False

-- Includes the position itself.
adjacent :: Position -> [Position]
adjacent n = [m | m <- [0..15], abs(row m - row n) <= 1, abs(col m - col n) <= 1]
   where row pos = pos `div` 4
         col pos = pos `mod` 4

place :: Color -> (Board, Inventory) -> Position -> Maybe (Board, Inventory)
place stone (board, inventory) position =
   if valid then Just (newBoard, newInventory) else Nothing
   where valid = free (board ! position) &&
                 notElem stone adjacentColors &&
                 (newInventory Map.! stone) >= 0
         newBoard = board//[(position, Tile (Just stone) (color board position))]
         newInventory = Map.adjust (subtract 1) stone inventory
         adjacentColors = map (color board) (adjacent position)

solutions :: Maybe (Board, Inventory) -> [(Board, Inventory)]
solutions Nothing = []
solutions (Just (board, inventory)) =
   if inventoryEmpty
      then [(board, inventory)]
      else concat $ map solutions boardInventoryPairs
   where inventoryEmpty = sum (Map.elems inventory) == 0
         boardInventoryPairs = [place color (board, inventory) position | color <- colors, position <- [0..15]]
         colors = [Black, Green, Purple, Red, Yellow]

board :: Board
board = array (0, 15) $ zipWith (\i color -> (i, Tile Nothing color)) [0..15]
                        [Red,    Black, Red,    Black,
                         Yellow, Green, Purple, Green,
                         Purple, Red,   Black,  Yellow,
                         Yellow, Green, Purple, Red]
inventory = Map.fromList [(Black, 3), (Green, 4), (Purple, 3), (Red, 3), (Yellow, 3)]

-- vim: tw=80 sts=-1 sw=3 et
