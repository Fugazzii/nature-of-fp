data Option val = Some val | None deriving (Show)

unwrapOr :: Option x -> x -> x
unwrapOr (Some x) _ = x
unwrapOr None defaultValue = defaultValue

main :: IO ()
main = do
	let someOption = Some "Ilia magaria"
	let someResult = unwrapOr someOption "default"
	putStrLn someResult

	let noneOption = None
	let noneResult = unwrapOr noneOption "No value inside option"
	putStrLn noneResult