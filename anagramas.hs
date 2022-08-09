caractere :: Char -> String ->  Bool
caractere a (x:l) | a == x = True
                  | l == [] = False
                  | otherwise = caractere a l

remove :: Char -> String -> String
remove a (x:l) | a == x = l
               | otherwise = [x] ++ remove a l

compara :: String -> String -> Bool
compara (x:s) l | s == [] && l /= [x] = False
                | s == [] && l == [x] = True
                | caractere x l == False = False
                | caractere x l == True = compara s (remove x l)

anagramas :: String -> [String] -> [String]
anagramas a (x:l) | l == [] = []
                  | compara a x == True = [x] ++ anagramas a l
                  | otherwise = anagramas a l