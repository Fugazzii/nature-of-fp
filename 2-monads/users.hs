data User = User { 
	username :: String,
	email :: String
} deriving (Show)

database :: [User]
database = [
	User "iliamagaria" "sichinavailia@gmail.com",
	User "fugazzi" "fugazzi@gmail.com",
	User "grimmwolf" "grimmwolf@gmail.com"
	]

findOne :: String -> Maybe User
findOne query = case filter (\u -> username u == query || email u == query )
	database of
	[user] 	-> Just user
	_ 		-> Nothing

main :: IO ()
main = do
	putStrLn "Finding user by email: "
	let resultByEmail = findOne "sichinavailia@gmail.com"
	print resultByEmail 

	putStrLn "Finding user by username: "
	let resultByUsername = findOne "zd"
	print resultByUsername
