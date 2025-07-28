import Text.Printf (printf)

avaliarCisterna :: Double -> Double -> Double -> (Double, Int, String)
avaliarCisterna raio altura consumoDiario =
    let
        volumeTotal = (pi * raio^2 * altura) * 1000
        diasDuracao = floor (volumeTotal / consumoDiario) :: Int

        mensagem = if diasDuracao >= 180
                    then "suficiente"
                    else "Nao suficiente"
        in
        (volumeTotal, diasDuracao, mensagem)
        
main :: IO ()
main = do
    raioStr <- getLine
    let raio = read raioStr :: Double
    
    alturaStr <- getLine
    let altura = read alturaStr :: Double
    
    consumoDiarioStr <- getLine
    let consumoDiario = read consumoDiarioStr :: Double
    
    let (volumeTotal, diasDuracao, mensagem) = avaliarCisterna raio altura consumoDiario
    
    printf "Volume da cisterna: %.2f litros\n" volumeTotal
    putStrLn $ "A agua durara: " ++ show diasDuracao ++ " dias"
    putStrLn mensagem
