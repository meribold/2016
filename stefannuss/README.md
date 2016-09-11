# Stefannuß

Solver for the Stefannuß puzzle game.  The puzzle is explained [here][1] and
[here][2] (both pages are written in German).  Computing the first solution can
be started from `ghci` like this (after loading `stefannuss.hs`):

    fst $ head $ solutions (Just (board, inventory))

[1]: http://www.neumann-s.net/stefannuss/stefannuss-losung.htm
[2]: http://denken24.de/?p=158

<!-- vim: set tw=80 sts=-1 sw=4 et spell: -->
