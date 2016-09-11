# Stefannuß

Solver for the Stefannuß puzzle game.  The puzzle is explained [here][1] and
[here][2] (both pages are written in German).  Computing the first solution can
be started from `ghci` like this (after loading `stefannuss.hs`):

```haskell
fst $ head $ solutions (Just (board, inventory))
```

Eventually it should print:

```haskell
array (0,15) [(0,Tile (Just Green) Red),(1,Tile (Just Purple) Black),(2,Tile (Just Green) Red), (3,Tile (Just Purple) Black),
              (4,Tile (Just Red) Yellow),(5,Tile (Just Black) Green), (6,Tile (Just Yellow) Purple),(7,Tile (Just Black) Green),
              (8,Tile (Just Yellow) Purple), (9,Tile (Just Green) Red),(10,Tile (Just Purple) Black),(11,Tile (Just Red) Yellow),
              (12,Tile (Just Red) Yellow),(13,Tile (Just Black) Green),(14,Tile (Just Yellow) Purple),(15,Tile (Just Green) Red)]
```

The sequence in which to place stones is relatively easy to work out from the
final placements.

[1]: http://www.neumann-s.net/stefannuss/stefannuss-losung.htm
[2]: http://denken24.de/?p=158

<!-- vim: set tw=80 sts=-1 sw=4 et spell: -->
