import Test.HUnit

doubledList :: [Int] -> [Int]
doubledList [] = []
doubledList (x:xs) = 2 * x : doubledList xs

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

productList :: [Int] -> Int
productList [] = 1
productList (x:xs) = x * productList xs

testList = [2, 4, 6, 8, 10]

testCases :: Test
testCases = test
    [ 
	  "Test doubledList" ~: doubledList testList ~?= map (\x -> 2 * x) testList,
	  "Test sumList" ~: sumList testList ~?= sum testList,
	  "Test productList" ~: productList testList ~?= product testList
    ]

main :: IO Counts
main = runTestTT testCases