import Data.Char (toUpper)

data Transaction = Transaction { 
	description :: String, 
	amount :: Double
} deriving (Show)

-- Sample list of transactions
transactions :: [Transaction]
transactions =
  [ Transaction "Groceries" 50.0
  , Transaction "Dinner" 30.0
  , Transaction "Clothing" 80.0
  , Transaction "Gas" 40.0
  , Transaction "Entertainment" 20.0
  ]

calculateTotalAmount :: [Transaction] -> Double
calculateTotalAmount = foldl (\acc tx -> acc + amount tx) 0.0

filterHighValueTransactions :: Double -> [Transaction] -> [Transaction]
filterHighValueTransactions threshold = filter (\tx -> amount tx > threshold)

mapDescriptionsToUppercase :: [Transaction] -> [String]
mapDescriptionsToUppercase = map (\tx -> map toUpper (description tx))

main :: IO ()
main = do
  putStrLn "List of Transactions:"
  mapM_ print transactions

  let totalAmount = calculateTotalAmount transactions
  putStrLn $ "Total Amount Spent: $" ++ show totalAmount

  let highValueTransactions = filterHighValueTransactions 50.0 transactions
  putStrLn "High-Value Transactions:"
  mapM_ print highValueTransactions

  let uppercaseDescriptions = mapDescriptionsToUppercase transactions
  putStrLn "Uppercase Descriptions:"
  mapM_ putStrLn uppercaseDescriptions