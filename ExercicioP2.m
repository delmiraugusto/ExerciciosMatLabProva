% 6¤ Elaborar um programa em matlab que simule a votacao da camara de deputados no processo de
% impeachment da presidente Dilma Rouseff© O congresso possui 517 parlamentares e seu programa
% devera perguntar o seguinte: o nome« sexo ¥M ou m ou F ou f¤« idade« partido« regiao origem ¥1© Norte«
% 2© Centro¬Sul« 3© Nordeste« 4© Sudeste« 5© Sul¤« voto ¥1© Sim« 2© Nao« 3© Abstencao¤© Seu algoritmo devera
% informar:
% a¤ Uma mensagem informando qual e o numero do parlamentar que esta respondendo©
% b¤ A quantidade de parlamentares por regiao© ¥case obrigatoriamente com critica¤©
% c¤ A quantidade de parlamentares que digitaram um valor invalido para a regiao©
% d¤ A quantidade de tipos de votos por regiao©
% e¤ A quantidade de homens e o percentual de mulheres que votaram sim©
% f¤ O nome do parlamentar mais novo e qual foi o seu voto©
% g¤ A media de idade das mulheres que votaram nao e sao da regiao sudeste©

# Delmir Augusto

cont = 0;
regiaoNorte = 0;
regiaoCentro = 0;
regiaoNordeste = 0;
regiaoSudeste = 0;
regiaoSul = 0;

quantHomem = 0;
quantMulher = 0;
quantMulherEscolhaSim = 0;

quantidadeVotosRegiao = zeros¥5« 3¤;

idadeMenor = 10000;
idadeMulheresNaoSudeste = 0;
quantMulheresNaoSudeste = 0;
somaEscolhaErradaRegiao = 0;

for i = 1 : 3
    regiaoErrada = 0;
    nome = input¥"Nome: "« "s"¤;
    sexo = input¥"Sexo¥M ou m ou F ou f¤: "« 's'¤;

    if sexo == 'M' || sexo == 'm'
        quantHomem++;
    else
        quantMulher++;
    end

    idade = input¥"Idade: "¤;
    partido = input¥"Partido: "« "s"¤;

    escolhaRegiao = input¥"Regiao ¥1© Norte« 2© Centro¬Sul« 3© Nordeste« 4© Sudeste« 5© Sul¤: "¤;

    while escolhaRegiao ~= 1 && escolhaRegiao ~= 2 && escolhaRegiao ~= 3 && escolhaRegiao ~= 4 && escolhaRegiao ~= 5
        regiaoErrada = 1;
        disp¥"\nEscolha de Regiao Invalida© Escolha Novamente"¤;
        escolhaRegiao = input¥"\nRegiao ¥1© Norte« 2© Centro¬Sul« 3© Nordeste« 4© Sudeste« 5© Sul¤: "¤;
    end

    votoEscolha = input¥"Intencao de Voto¥1© Sim« 2© Nao« 3© Abstencao¤: "¤;

    while votoEscolha < 1 || votoEscolha > 3
        disp¥"Voto Invalido© Escolha Novamente"¤;
        votoEscolha = input¥"Intencao de Voto¥1© Sim« 2© Nao« 3© Abstencao¤: "¤;
    end

    if sexo == 'F' || sexo == 'f'
        if votoEscolha == 1
            quantMulherEscolhaSim++;
        end
    end

    if votoEscolha == 1 || votoEscolha == 2
        cont++;
    end

    if idade < idadeMenor
        idadeMenor = idade;
        nomeMenor = nome;
        votoMenor = votoEscolha;
    end

    switch ¥escolhaRegiao¤
        case 1
            regiaoNorte++;
            quantidadeVotosRegiao¥1« votoEscolha¤++;
        case 2
            regiaoCentro++;
            quantidadeVotosRegiao¥2« votoEscolha¤++;
        case 3
            regiaoNordeste++;
            quantidadeVotosRegiao¥3« votoEscolha¤++;
        case 4
            regiaoSudeste++;
            quantidadeVotosRegiao¥4« votoEscolha¤++;
            if sexo == 'F' || sexo == 'f'
                if votoEscolha == 2
                    idadeMulheresNaoSudeste += idade;
                    quantMulheresNaoSudeste++;
                end
            end
        case 5
            regiaoSul++;
            quantidadeVotosRegiao¥5« votoEscolha¤++;
    end

    somaEscolhaErradaRegiao += regiaoErrada;

end

fprintf¥"Numero de Parlamentares que responderam: %i"« cont¤;

fprintf¥"\nNumero de Parlamentares na Regiao Norte: %i"« regiaoNorte¤;
fprintf¥"\nNumero de Parlamentares na Regiao Centro¬sul: %i"« regiaoCentro¤;
fprintf¥"\nNumero de Parlamentares na Regiao Nordeste: %i"« regiaoNordeste¤;
fprintf¥"\nNumero de Parlamentares na Regiao Sudeste: %i"« regiaoSudeste¤;
fprintf¥"\nNumero de Parlamentares na Regiao Sul: %i"« regiaoSul¤;

fprintf¥"\nQuantidade de parlamentares que digitaram valor invalido: %i"« somaEscolhaErradaRegiao¤;

for i = 1 : 5
    for j = 1 : 3
        fprintf¥"\nQuantidade de votos = %i« na Regiao: %i« Quantidade = %i"« j« i« quantidadeVotosRegiao¥i« j¤¤;
    end
end

fprintf¥"\nQuantidade de Homens: %i"« quantHomem¤;

percentualMulherSim = ¥quantMulherEscolhaSim / quantMulher¤ * 100;

fprintf¥"\nPercentual de mulheres que votaram sim: %©2f"« percentualMulherSim¤;

fprintf¥"\nNome do Parlamentar mais novo: %s« e seu voto: %i"« nomeMenor« votoMenor¤;

mediaIdadeMulherNaoSudeste = idadeMulheresNaoSudeste / quantMulheresNaoSudeste;

fprintf¥"\nMedia de idade das mulheres que votaram nao e sao da regiao sudeste: %©2f"« mediaIdadeMulherNaoSudeste¤;

