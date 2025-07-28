simularCorridaF1 :: Int -> Double -> IO()
simularCorridaF1 totalVoltas qtdCombustivelInicial = go 1 qtdCombustivelInicial
    where 
        consumoPorVolta = 2.5 :: Double
        
        go :: Int -> Double -> IO()
        go voltaAtual combustivelRestante
            | voltaAtual > totalVoltas = putStrLn "Corrida finalizada!"
            | combustivelRestante >= consumoPorVolta = do
                putStrLn $ "Volta " ++ show voltaAtual ++ " completa"
                go (voltaAtual + 1) (combustivelRestante - consumoPorVolta)
            | otherwise = putStrLn $ "Parada na volta " ++ show voltaAtual

main :: IO()
main = do
    totalVoltasStr <- getLine
    let totalVoltas = read totalVoltasStr :: Int
    
    combustivelInicialStr <- getLine
    let combustivelInicial = read combustivelInicialStr :: Double
    
    simularCorridaF1 totalVoltas combustivelInicial
