# bivariate-gaussian-approximation

uniforme: https://www.desmos.com/3d/pnrxd83mdv?lang=pt-BR

normal: https://www.desmos.com/3d/askq9n8oax?lang=pt-BR

uniforme> https://www.geogebra.org/3d/ce8g6vtd

Aproximando Gaussiana Bivariada usando polinômios

problemas :

- Pela natureza do polinômio, parece haver um trade-off entre tentar diminuir o erro nos dados das caldas ou nos dados do "sino"... A prioridade é determinado pelo número de pontos em cada uma das regiões... Quando há muitos pontos no "sino" (gerados a partir de uma N[(0,0), SIGMA]), o modelo tende a dar mais prioridade a esses pontos... Quando há muitos pontos nas caldas, o modelo é quase um plano sendo puxado pra cima pelos pontos do sino;
- O modelo prevê valores negativos.
- Os resíduos são heterocedásticos e correlacionados.

Para evitar isso, usaremos a trasnformação logaritmica

 
