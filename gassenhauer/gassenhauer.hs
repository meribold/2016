import Data.Array
import Data.Maybe
import Data.Set (Set)
import qualified Data.Set as Set

data WoodType = Oak | Pine | Cedro | Maple | Wenge
   deriving(Show, Read, Eq, Ord, Enum, Ix)
type Tile = WoodType
type Lane = [Tile]
type Board = Array WoodType Lane

move :: Board -> WoodType -> WoodType -> Int -> Maybe Board
move board from to count =
   if legal
      then Just $ board//[(from, newSource), (to, newTarget)]
      else Nothing
   where movees = take count (board ! from)
         newSource = drop count (board ! from)
         newTarget = movees ++ (board ! to)
         targetType = if null (board ! to) then to else head (board ! to)
         legal = (count == 1 || count == 2) && from /= to &&
                 length movees == count && length newTarget <= 7 &&
                 last movees == targetType

-- Always try moving 2 tiles together first.
newBoards :: Board -> [Board]
newBoards board = catMaybes [move board from to count | count <- [2, 1],
                             from <- [Oak .. Wenge], to <- [Oak .. Wenge]]

solved board = all ok (assocs board)
   where ok (woodType, lane) = all (== woodType) lane

solutions :: Set Board -> [Board] -> [[Board]]
solutions beenThere (board:boards) =
   if solved board
      then [board:boards]
      else concat $ map (solutions beenThereToo) (map (:board:boards) nextBoards)
   where nextBoards = filter (flip Set.notMember beenThere) (newBoards board)
      -- nextBoards = filter (flip notElem (board:boards)) (newBoards board)
         beenThereToo = Set.union beenThere $ Set.fromList nextBoards

emptySet :: Set Board
emptySet = Set.empty

-- Boards {{{1
board :: Board
board = array (Oak, Wenge) $
   [(  Oak, [Wenge, Maple, Cedro, Pine]),
    ( Pine, [Oak,   Wenge, Maple, Cedro]),
    (Cedro, [Pine,  Oak,   Wenge, Maple]),
    (Maple, [Cedro, Pine,  Oak,   Wenge]),
    (Wenge, [Maple, Cedro, Pine,  Oak])]

board2 :: Board
board2 = array (Oak, Wenge) $
   [(  Oak, []),
    ( Pine, [Oak,   Wenge, Maple, Cedro]),
    (Cedro, [Cedro, Pine,  Pine,  Oak,   Wenge, Maple]),
    (Maple, [Cedro, Pine,  Oak,   Wenge]),
    (Wenge, [Wenge, Maple, Maple, Cedro, Pine,  Oak])]

solvedBoard :: Board
solvedBoard = array (Oak, Wenge) $
   [(  Oak, [Oak,   Oak,   Oak,   Oak]),
    ( Pine, [Pine,  Pine,  Pine,  Pine]),
    (Cedro, [Cedro, Cedro, Cedro, Cedro]),
    (Maple, [Maple, Maple, Maple, Maple]),
    (Wenge, [Wenge, Wenge, Wenge, Wenge])]

almostSolvedBoard :: Board
almostSolvedBoard = array (Oak, Wenge) $
   [(  Oak, [Oak,   Oak]),
    ( Pine, [Oak,   Oak,   Pine,  Pine,  Pine,  Pine]),
    (Cedro, [Cedro, Cedro, Cedro, Cedro]),
    (Maple, [Maple, Maple, Maple, Maple]),
    (Wenge, [Wenge, Wenge, Wenge, Wenge])]

boardX :: Board
boardX = array (Oak, Wenge) $
   [(  Oak, [Cedro, Pine, Pine, Oak, Oak]),
    ( Pine, [Cedro, Cedro]),
    (Cedro, [Pine, Oak, Wenge, Maple]),
    (Maple, [Wenge, Wenge, Maple]),
    (Wenge, [Wenge, Maple, Maple, Cedro, Pine, Oak])]

unsolvableBoard :: Board
unsolvableBoard = array (Oak, Wenge) $
   [(  Oak, [Pine, Oak, Oak]),
    ( Pine, [Wenge, Wenge, Wenge, Maple, Cedro]),
    (Cedro, [Cedro, Cedro, Pine, Pine, Oak, Wenge, Maple]),
    (Maple, [Maple, Maple]),
    (Wenge, [Cedro, Pine, Oak])]

-- vim: tw=80 sts=-1 sw=3 et fdm=marker
