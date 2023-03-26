hd1 :: [a] -> a
hd1 (x:xs) = x 

tl1 :: [a] -> [a]
tl1 [] = []
tl1 (x:xs) = xs
 
last1 :: [a] -> a
last1 xs = hd1 (reverse xs)  

init1 :: [a] -> [a]
init1 [x] = []
init1 (x:xs) = x:init1 xs

--3

maxTres :: Int -> Int -> Int -> Int
maxTres x y z | (x>y && x>z) = x
              | (y>x && y>z) = y
              | otherwise = z

--otra solucion 

maxTres2 :: Int -> Int -> Int -> Int
maxTres2 x y z = max (maximoDeDos x y) (maximoDeDos y z) 

maximoDeDos :: Int -> Int -> Int
maximoDeDos x y = max x y        

--4

concatenar1 :: [a] -> [a] -> [a]
concatenar1 [] ys = ys
concatenar1 (x:xs) [] = x:concatenar1 xs []
concatenar1 (x:xs) (y:ys) = x:concatenar1 xs (y:ys) 

--take
tomar :: [Int] -> Int -> [Int]
tomar [] _     = []
tomar _ 0      = []
tomar (x:xs) n = x:tomar xs (n-1)

--drop
tirar :: [Int] -> Int ->[Int]
tirar [] _     = []
tirar xs 0     = xs 
tirar (x:xs) n = tirar xs (n-1)


-- : concatenacion de listas a la cabeza 

concCabeza :: a -> [a] -> [a]
concCabeza n xs = n:xs  

-- 5) valor absoluto

abso :: Int -> Int
abso n | n >= 0 = n
       | n < 0  = (-n)
  
-- 6) edad con ifs ,acomodar casos

edad :: (Int,Int,Int) -> (Int,Int,Int) -> Int
edad (x,y,z) (n,m,k) = if k>z then (if m<y then (k-z)-1 else (if n<x then (k-z)-1 else k-z) ) else (if m<y then (z-k) else (if n<x then (z-k)-1 else (z-k) ))

-- edad con casos
{-
edad2 :: (Int,Int,Int) -> (Int,Int,Int) -> Int
edad2 (x,y,z) (n,m,k) | k>z | m<y = (k-z)-1 
                                  | n<x = (k-z)-1  
                                  | otherwise = k-z
                      | otherwise | m<y = (z-k)
                                        | n<x = (z-k)-1  
                                        | otherwise = z-k
-}

-- 7)

xor :: Bool -> Bool -> Bool
xor False False = False
xor False True = True
xor True False = True
xor True True = False 

xor2 :: Bool -> Bool -> Bool
xor2 False True = True
xor2 True False = True
xor2 _ _ = False

-- 8)

primo :: Int -> Bool
primo n = divisoresDeN == 2 

divisoresDeN :: Int -> Int
divisoresDeN 0 = 0
divisoresDeN n = (length [n | n <- [0..n] , mod n n]) == 2


--la diferencia seria la eficiencia, me ahorro casos


--primo :: Int -> Bool 
--primo x | (x > 0 && ((contarDivisores n c) == 2)) = True
--        | otherwise = False

--primo2 :: Int -> Bool 
--primo2 x = contarDivisores n c == 2

contarDivisores :: Int -> Int -> Int
contarDivisores _ 0 = 0
contarDivisores n c | mas1div = 1 + contarDivisores n (c-1)
                    | otherwise               = contarDivisores n (c-1)
              where mas1div = (c > 0 && mod n c == 0) 


--primosMenores :: Int -> Int -> [Int] 
--primosMenores _ 0 = []
--primosMenores x n | (primo n == True) = n:primosMenores x (n-1) 
--                  | otherwise         = primosMenores x (n-1) 

reversa :: (Eq a) => [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

iguales :: [Int] -> [Int] -> Bool
iguales [] []         = True
iguales xs []         = False
iguales [] ys         = False
iguales (x:xs) (y:ys) | x == y = iguales xs ys 
                      | otherwise = False 

palindromo :: (Eq a) => [a] -> Bool
palindromo [] = True
palindromo xs = xs == reversa xs

