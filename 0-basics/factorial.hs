factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
	putStrLn "Enter number to calculate its factorial"
	input <- getLine
	let number = read input :: Integer
	let result = factorial number
	putStrLn $ "Factorial of " ++ show number ++ " is: " ++ show result