import System.IO (isEOF)
import Control.Monad (unless)

main :: IO ()
main = processaNumeros []

processaNumeros :: [Int] -> IO ()
processaNumeros janela = do
    fim <- isEOF
    unless fim $ do
        linha <- getLine
        let num = read linha :: Int
        if length janela < 5
            then processaNumeros (janela ++ [num])
        else
            if num `elem` janela
                then do
                    putStrLn $ "repeticao " ++ show num
                else do
                    let novaJanela = tail janela ++ [num]
                    processaNumeros novaJanela
