import Data.Char (isUpper, isLower, isDigit)

main :: IO ()
main = do
    senhasFortes <- processarSenhas []
    imprimirSenhasFortes senhasFortes

processarSenhas :: [String] -> IO [String]
processarSenhas acumulador = do
    linha <- getLine
    if linha == "fim"
        then return acumulador
        else do
            if isSenhaForte linha  
                then processarSenhas (acumulador ++ [linha])
                else processarSenhas acumulador
            
imprimirSenhasFortes :: [String] -> IO ()
imprimirSenhasFortes = mapM_ (\senha -> putStrLn $ "Senha forte: " ++ senha)
            
isSenhaForte :: String -> Bool
isSenhaForte senha =
    comprimentoValido senha
    && temMaiuscula senha
    && temMinuscula senha
    && temDigito senha
    && temCaractereEspecial senha
    
comprimentoValido :: String -> Bool
comprimentoValido s = length s >= 8

temMaiuscula :: String -> Bool
temMaiuscula = any isUpper

temMinuscula :: String -> Bool
temMinuscula = any isLower

temDigito :: String -> Bool
temDigito = any isDigit

temCaractereEspecial :: String -> Bool
temCaractereEspecial senha = 
    let 
        caracteresEspeciais = "!@#$%^&*()_+-=[]{}|;':/,.<>?`~"
    in
        any (`elem` caracteresEspeciais) senha
