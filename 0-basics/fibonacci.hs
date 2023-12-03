fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main :: IO ()
main = do
    putStrLn "Enter a number to calculate its Fibonacci value:"
    input <- getLine
    let number = read input :: Integer
    let result = fibonacci number
    putStrLn $ "Fibonacci of " ++ show number ++ " is: " ++ show result
