-- Ethan Dang
-- Implements functions for NN, PN, and fractions
-- Implemented testing functions as well





------------------
-- NATURAL NUMBERS
------------------ 

data NN = O | S NN
    deriving (Eq,Show)

-- addition
add :: NN -> NN -> NN
add O n = n
add (S n) m = S (add n m)

-- multiplication
mult :: NN -> NN -> NN
mult O n = O
mult (S O) n = n
mult (S n) m = add m (mult n m)

-- subtract 
subtr :: NN -> NN -> NN
subtr O O = O
subtr O n = error "leads to negative number"
subtr n O = n
subtr (S n) (S m) = subtr n m

-- division
divi :: NN -> NN -> NN
divi O n = O
divi n O = error "cannot divide by 0"
divi n m = if modu n m == O
            then S (divi (subtr n m) m) 
            else error "non divisible numbers"

-- modu
modu :: NN -> NN -> NN
modu O n = O
modu n m = if less n m
            then n
            else modu (subtr n m) m

-- greater than
great:: NN -> NN -> Bool
great O O = False
great O n = False
great n O = True
great (S n) (S m) = great n m

-- less n m if n < m
-- use recursion on NN
less :: NN -> NN -> Bool
less O O = False
less n O = False
less O n = True
less (S n) (S m) = less n m

-- equal to
equal :: NN -> NN -> Bool
equal O O = True
equal n O = False
equal O n = False
equal (S n) (S m) = equal n m

-- greatest common divisor
-- implement Euclid's algorithm, allow gcdN O O = O to make it simpler
-- use recursion on NN
gcdN :: NN -> NN -> NN
gcdN O O = O
gcdN O m = m
gcdN n O = n
gcdN n m = gcdN m (modu n m) 





-------------------
-- POSITIVE NUMBERS
-------------------

data PN = I | T PN
    deriving (Eq,Show)

-- addition of positive numbers
-- use recursion over PN
addP :: PN -> PN -> PN
addP I n = (T n)
addP (T n) m = T (addP n m)

-- multiplication of positive numbers
-- use recursion over PN
multP :: PN -> PN -> PN
multP I n = n
multP (T n) m = addP m (multP n m)

-- subtract a positive number from a natural number
-- use recursion over NN
subtrNP :: NN -> PN -> NN
subtrNP O m = error "PN greater than NN"
subtrNP (S n) I = n
subtrNP (S n) (T m) = subtrNP n m

-- divide a natural number by a positive number
-- use recursion over NN
divP :: NN -> PN -> NN
divP O n = O 
divP n I = n
divP n m = if modu n (p2n m) == O 
            then S (divP (subtrNP n m) m)
            else error "non divisible numbers"

-- modu for PN
moduP :: PN -> PN -> NN
moduP n m = modu (p2n n) (p2n m)

-- greatP n m if n > m
greatP :: PN -> PN -> Bool
greatP I I = False
greatP I n = False
greatP n I = True
greatP (T n) (T m) = greatP n m

-- lessP n m if n < m
-- use recursion over PN
lessP :: PN -> PN -> Bool
lessP I I = False
lessP n I = False
lessP I n = True
lessP (T n) (T m) = lessP n m

-- equalP n m if n > m
equalP :: PN -> PN -> Bool
equalP I I = True
equalP n I = False
equalP I n = False
equalP (T n) (T m) = equalP n m

-- lcmP n m returns least common multiple
-- finds LCM through formula LCM = (n * m) / gcd(n, m)
lcmP :: PN -> PN -> PN
lcmP n m = n2p (divP  (p2n (multP n m)) (n2p (gcdN (p2n n) (p2n m))))

-- convert from PN to NN
-- use recursion over PN
p2n :: PN -> NN
p2n I = (S O)
p2n (T n) = S (p2n n)

-- convert from NN to PN
-- use recursion over NN
-- allow runtime error if NN is O
n2p :: NN -> PN
n2p O = error "non-positive number"
n2p (S O) = I
n2p (S n) = T (n2p n)





------------
-- FRACTIONS
------------

-- non-negative fractions
-- a fraction is a pair (numerator,denominator)
type Frac = (NN,PN)

-- add fractions
-- recall from school how to add fractions
addF :: Frac -> Frac -> Frac
addF n m = if equalP (snd n) (snd m)
            then simplifyF (add (fst n) (fst m), snd n)
            else simplifyF (add (mult (fst n) (divP (p2n (lcmP (snd n) (snd m))) (snd n)))  (mult (fst m) (divP (p2n (lcmP (snd n) (snd m))) (snd m))), multP (snd n) (n2p (divP (p2n (lcmP (snd n) (snd m))) (snd n))))
            -- simplify ((numer1 * LCM/denom1) + (numer2 * LCM/denom2), (denom * LCM/denom))
            -- p2n and n2p used to convert to expressions (PN or NN) that match function calls

-- multiply fractions
-- recall from school how to multiply fractions
multF :: Frac -> Frac -> Frac
multF n m = simplifyF (mult (fst n) (fst m), multP (snd n) (snd m))

-- subtract fractions
subtrF :: Frac -> Frac -> Frac
subtrF n m = if equalP (snd n) (snd m)
            then simplifyF (subtr (fst n) (fst m), snd n)
            else simplifyF (subtr (mult (fst n) (divP (p2n (lcmP (snd n) (snd m))) (snd n)))  (mult (fst m) (divP (p2n (lcmP (snd n) (snd m))) (snd m))), multP (snd n) (n2p (divP (p2n (lcmP (snd n) (snd m))) (snd n))))
            -- simplify ((numer1 * LCM/denom1) - (numer2 * LCM/denom2), (denom * LCM/denom))
            -- p2n and n2p used to convert to expressions (PN or NN) that match function calls

-- divide fractions
diviF :: Frac -> Frac -> Frac
diviF n m = if fst m == O
            then (O, I)
            else multF n (p2n (snd m), n2p (fst m))
            -- diviF n/m j/k = multF n/m 

-- equality of fractions
-- recall from school how to check that two fractions are equal
equalF :: Frac -> Frac -> Bool
equalF (n, m) (j, k) = equal (mult n (p2n k)) (mult j (p2n m))
-- n/m = j/k if n * k == j * m

-- simplify fractions
-- divide numerator and denominator by the gcd of both
simplifyF :: Frac -> Frac
simplifyF (n, I) = (n, I)
simplifyF (O, n) = (O, n)
simplifyF (n, m) = (divi n (gcdN n (p2n m)), n2p (divi (p2n m) (gcdN n (p2n m))))





--------------
-- FOR TESTING
--------------

-- use recursion on NN
nn2int :: NN -> Int
nn2int O = 0
nn2int (S n) = 1 + (nn2int n)

-- use recursion on Int
-- allow runtime error for negative numbers
int2nn :: Int -> NN
int2nn 0 = O 
int2nn n = if n < 0
            then error "not a natural number"
            else S (int2nn (n - 1))

-- use recursion on Int
-- allow runtime error for non-positive numbers
int2pn :: Int -> PN
int2pn 1 = I
int2pn n = if n < 1
            then error "not a positive number"
            else T (int2pn (n - 1))

-- use int2nn and int2pn
ints2frac :: (Int,Int) -> Frac
ints2frac (n,p) = (int2nn n, int2pn p)

-- use nn2int 
frac2ints :: Frac -> (Int,Int)
frac2ints x = (nn2int (fst x), nn2int (p2n (snd x)))

-- Some examples (make your own):
-- 
-- frac2ints (addF (ints2frac (2,3)) (ints2frac (6,8)))
-- equalF (ints2frac (2,6)) (ints2frac (1,3))
-- addF (ints2frac (36,60)) (ints2frac (24,45))
-- simplifyF (addF (ints2frac (36,60)) (ints2frac (24,45)))
-- frac2ints(simplifyF (addF (ints2frac (36,60)) (ints2frac (24,45))))