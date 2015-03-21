-- Trabalho 1 Haskell 
-- Alessandro Bueno Ribeiro

-- 1. Escreva uma fun��o hasEqHeads :: [Int] -> [Int] -> Bool que verifica se as 2 listas possuem o mesmo primeiro elemento. Exemplo de uso:

hasEqHeads :: [Int] -> [Int] -> Bool 
hasEqHeads [] [] = True
hasEqHeads (x:_) (y:_) = if x == y then True else False

-- 2. Observe a fun��o abaixo, que eleva ao cubo cada elemento da lista, produzindo outra lista.

pot3 :: [Int] -> [Int]
pot3 [] = []
pot3 ns = (head ns)^3 : pot3 (tail ns)

-- 3. Escreva uma fun��o recursiva add10, que adicione a constante 10 a cada elemento de uma lista, produzindo outra lista.
add10 :: [Int] -> [Int]
add10 [] = []
add10 (x:xs) = x+10 : add10 (xs)

-- 4. Escreva uma fun��o recursiva addComma, que adicione uma v�rgula no final de cada string contida numa lista. 
-- Dica: (1) Strings s�o listas de caracteres. (2) Para concatenar listas, use o operador ++.

addComma :: [String] -> [String]
addComma [] = []
addComma x = ((head x) ++ ",") : addComma (tail x)

-- 5. Refa�a os 2 exerc�cios anteriores usando a fun��o de alta ordem 'map'.

add10map :: [Int] -> [Int]
add10map [] = []
add10map x = map (+10) x

addCommap :: [String] -> [String]
addCommap [] = []
addcommap x = map (++ ",") x

-- 6. Crie uma fun��o htmlListItems :: [String] -> [String], que receba uma lista de strings e retorne outra lista contendo as strings formatadas 
--como itens de lista em HTML. Dica: use map e defina uma fun��o auxiliar a ser aplicada a cada elemento. Exemplo de uso da fun��o:
-- > htmlListItems ["abra", "ca", "dabra"]
--["<LI>abra</LI>", "<LI>ca</LI>", "<LI>dabra</LI>"]

htmlListItems :: [String] -> [String]
htmlListItems [] = []
htmlListItems s = ("<LI>" ++ (head s) ++ "</LI>") : htmlListItems (tail s)

-- 7. Crie uma fun��o recursiva charFound :: Char -> String -> Bool, que verifique se o caracter (primeiro argumento) est� contido na string (segundo argumento). 
charFound :: Char -> String -> Bool
charFound _ "" = False -- percorre lista e n�o encontra o caracter
charFound x y = if x == (head y) then True else charFound x (tail y)

-- 8. Reescreva a fun��o anterior sem recurs�o, usando outras fun��es pr�-definidas j� vistas em aula.

-- 9. Use a fun��o de alta ordem 'zipWith' para produzir uma fun��o que obtenha as diferen�as, par a par, 
-- dos elementos de duas listas. Por exemplo: para listas de entrada [1,2,3,4] e [2,2,1,1], o resultado ser� [-1,0,2,3].

diferencas2list :: [Int] -> [Int] -> [Int]
diferencas2list _ [] = []
diferencas2list x y =(zipWith (-) x y)

-- Fun��es de alta ordem 

-- 1.Dada uma lista de n�meros, calcular 2*n+1 para cada n�mero n contido na lista. 

lambda1 = \x -> (x*2) + 1

funclambda1 :: [Int]->[Int]
funclambda1 []=[]
funclambda1 n = map lambda1 n

-- 2. Dadas duas listas X e Y de n�meros inteiros, calcular 4*x+2*y+1 para cada par de n�meros x e y pertencentes �s listas. Exemplo:

auxFunc :: (Int,Int) -> Int
auxFunc (x,y) = ((4*x) +(2*y) +1)

mapfuncxy :: [(Int,Int)] -> [Int]
mapfuncxy [] = []
mapfuncxy (x:xs) = (auxFunc x) : mapfuncxy xs

-- 3. Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema:
-- strings de entrada com mais de 10 caracteres s�o truncadas, strings com at� 10 caracteres s�o completadas com '.' at� ficarem com 10 caracteres. 
-- Exemplo: > func ["palavras","paralelas","pedal","paralelepipedo"]
-- ["palavras..","paralelas.","pedal.....","paralelepi"]
-- calcula tamanho de uma string
tamanho :: String -> Int
tamanho [] = 0 -- se string vazia, retorna 0
tamanho x = 1 + tamanho(tail x) -- conta todos os elementos da string  

--stringList :: String -> String
--stringList "" = ""
--stringList x 
	--| (tamanho x) < 10 = (++ ".") 10 - x 	
	--| (tamanho x) > 10 = x

-- 4. Dada uma lista de idades, selecionar as que s�o maiores que 20 e, para cada uma, calcular o ano de nascimento correspondente (aproximado, considerando o ano atual).

idcalc :: Int->Int
idcalc x = if x>20 then (2015-x) else 0

idadeFunc :: [Int]->[Int]
idadeFunc []=[]
idadeFunc (x:xs) = idcalc x : idadeFunc xs 