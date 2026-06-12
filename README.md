
# bivariate-gaussian-approximation

Aproximando Gaussiana Bivariada usando polinômios

problemas :

- Gerar pontos de uma uniforme sobre o retangulo [-4,4]x[-4,4] não é bom;
  - dependendo do c, a maioria dos pontos vai cair em regiões cujo f é próximo de zero... -- Haverá poucos pontos próximos de (0,0), sendo dificil capturar a curvatura da gaussiana -- Provavelmente isso está dificultando o ajuste (investigar gerando dados de uma N([0,0], SIGMA))
  - Esses pontos próximos de (0,0) são vistos como pontos de alavancagem, o ajuste não levará muito em conta a presença deles(já que a maioria tem z próximo de 0).
  - Provavelmente essa presença apenas vai mudar os outros coeficientes do hiperplano (investigar se esses pontos são influentes).
  - Ao usar geração uniforme, o modelo linear de grau 3 teve apenas os coeficientes de x\^2 e y\^2 (e interecpto) como estatisticamente significativos; (mas o ajuste do modelo de grau 2 não é bom... provavelmente devido a geraçao dos pontos)
  - Basicamente, a superfície gerada pelo modelo é similar a uma gaussiana com c e k tendendo a zero

- Pela natureza do polinômio, parece haver um trade-off entre tentar diminuir o erro nos dados das caldas ou nos dados do "sino"...
- Para evitar isso, provavelemtne será necessário fazer uma transformaçao em Y, para eliminar a exponencial (testar f(y) = ln(y)) (Testes preliminares sugerem que essa é uma ótima transformaçao)
