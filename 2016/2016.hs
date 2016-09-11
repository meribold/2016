data SolutionCandidate = SolutionCandidate { nums :: [Double] , ops :: [Char] }
   deriving(Show)

problem = SolutionCandidate [1..10] []

-- We can't generally convert functions to strings in Haskell; store the names
-- along with the operators.
allowedOps = [((+), '+'), ((-), '-'), ((*), '*'), ((/), '/')]

-- Apply all operators to the first two numbers of a SolutionCandidate and
-- return a list of the resulting new candidates.
applyOps (SolutionCandidate (x:y:zs) ops) =
   map (\(f, name) -> SolutionCandidate ((f x y):zs) (ops ++ [name])) allowedOps

getSolutions :: SolutionCandidate -> [SolutionCandidate]
-- Did we get 2016?  If so, just wrap it in a list.
getSolutions sC@(SolutionCandidate [2016] _) = [sC]
-- If only one number remains in the list of numbers, return the empty list.
getSolutions sC@(SolutionCandidate [x] _) = []
-- Apply all operators to the first two numbers, recurse over the returned
-- candidates, and flatten the resulting list of lists of `SolutionCandidate`s.
getSolutions sC = concat $ map getSolutions (applyOps sC)

main = print $ getSolutions problem

-- vim: tw=80 sts=-1 sw=3 et
