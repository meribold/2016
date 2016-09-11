# Gassenhauer

Solver for the Gassenhauer puzzle game.  It can be started from `ghci` like this
to get the first solution:

```haskell
head $ solutions emptySet [board]
```

It probably takes several hours.  Eventually it should print:

```haskell
[array (Oak,Wenge) [(Oak,[Oak,Oak,Oak,Oak]),(Pine,[Pine,Pine,Pine,Pine]),(Cedro,[Cedro,Cedro,Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Pine,Pine,Pine,Pine]),(Cedro,[Cedro,Cedro,Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Oak,Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Pine,Pine,Pine]),(Cedro,[Cedro,Cedro,Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Pine,Oak,Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Pine,Pine,Pine]),(Cedro,[Cedro,Cedro,Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Pine,Pine,Oak,Oak,Oak]),(Pine,[Pine]),(Cedro,[Cedro,Cedro,Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Pine,Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Pine,Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Cedro,Cedro,Pine]),(Cedro,[]),(Maple,[Maple,Maple,Maple,Maple]),(Wenge,[Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Pine,Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Cedro,Cedro,Pine]),(Cedro,[Maple]),(Maple,[Maple,Maple,Maple]),(Wenge,[Oak,Wenge,Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Pine,Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Cedro,Cedro,Pine]),(Cedro,[Oak,Wenge,Maple]),(Maple,[Maple,Maple,Maple]),(Wenge,[Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Cedro,Cedro,Pine]),(Cedro,[Pine,Pine,Oak,Wenge,Maple]),(Maple,[Maple,Maple,Maple]),(Wenge,[Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Maple,Maple,Maple]),(Wenge,[Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Maple,Maple]),(Wenge,[Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Maple,Maple,Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[]),(Wenge,[Wenge,Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Maple,Maple,Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge]),(Wenge,[Wenge,Wenge])],
 array (Oak,Wenge) [(Oak,[Pine,Oak,Oak,Oak]),(Pine,[Maple,Maple,Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge,Wenge,Wenge]),(Wenge,[])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Maple,Maple,Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge,Wenge,Wenge]),(Wenge,[Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Maple,Maple,Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge,Wenge,Wenge]),(Wenge,[Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge,Wenge,Wenge]),(Wenge,[Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak,Oak]),(Pine,[Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[Maple,Cedro,Cedro,Pine]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Oak,Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[Maple,Cedro,Cedro,Pine]),(Cedro,[Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[Cedro,Pine]),(Cedro,[Pine,Oak,Wenge,Maple]),(Maple,[Maple,Cedro,Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Maple,Cedro,Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[Maple,Cedro]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Oak]),(Pine,[Wenge,Maple,Cedro]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[]),(Pine,[Oak,Wenge,Maple,Cedro]),(Cedro,[Cedro,Pine,Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Cedro,Pine]),(Pine,[Oak,Wenge,Maple,Cedro]),(Cedro,[Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Wenge,Maple,Maple,Cedro,Pine,Oak])],
 array (Oak,Wenge) [(Oak,[Wenge,Maple,Cedro,Pine]),(Pine,[Oak,Wenge,Maple,Cedro]),(Cedro,[Pine,Oak,Wenge,Maple]),(Maple,[Cedro,Pine,Oak,Wenge]),(Wenge,[Maple,Cedro,Pine,Oak])]]
```

<!-- vim: set tw=80 sts=-1 sw=4 et spell: -->
