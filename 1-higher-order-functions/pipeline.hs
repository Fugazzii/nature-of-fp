-- Sample data type representing a data record
data Record = Record
  { id :: Int
  , value :: Double
  } deriving (Show)

-- Transformation functions
addId :: [Record] -> [Record]
addId = zipWith (\index record -> record { Main.id = index + 1 }) [0..]

doubleValues :: [Record] -> [Record]
doubleValues = map (\record -> record { value = 2 * value record })

filterHighValues :: Double -> [Record] -> [Record]
filterHighValues threshold = filter (\record -> value record > threshold)

-- Data processing pipeline
dataProcessingPipeline :: [Record] -> [Record]
dataProcessingPipeline records =
  records
    |> addId
    |> doubleValues
    |> filterHighValues 5.0

-- Custom function composition operator
(|>) :: a -> (a -> b) -> b
x |> f = f x
infixl 0 |>

-- Sample list of records
records :: [Record]
records =
  [ Record 0 3.0
  , Record 0 8.0
  , Record 0 5.0
  ]

-- Process the data using the pipeline
result :: [Record]
result = dataProcessingPipeline records

-- Print the result
main :: IO ()
main = print result
