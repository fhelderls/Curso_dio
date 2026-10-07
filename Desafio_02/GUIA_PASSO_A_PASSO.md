# Guia de montagem – Desafio 02 (Relatório Financial Sample)

Tempo estimado: 2h30 a 3h. Siga na ordem. As posições (X, Y, L, A) estão em pixels: digite os valores em **Formatar > Geral > Propriedades** para alinhar com os fundos.

## Estrutura do relatório

| Página | Pergunta que responde | Toggle com indicadores (bookmarks) |
|---|---|---|
| 1. Visão Geral | Como estão vendas, lucro e margem no período? | – |
| 2. Geografia | Qual país vende mais e qual tem melhor margem? | **Mapa ↔ Tabela** |
| 3. Produtos | Quais produtos e faixas de desconto dão lucro? | **Gráfico ↔ Tabela** |
| 4. Segmentos | Quem gera e quem destrói lucro? | **Gráfico ↔ Tabela** |

Em todas as páginas: menu lateral com botões de imagem, 3 segmentadores sincronizados no topo, 4 cartões de KPI e botão "Limpar filtros".

---

## Etapa 1 – Dados (Power Query) · 15 min
1. **Obter dados > Excel** > `dados/Financial_Sample.xlsx` > marque `Sheet1` > **Transformar dados**.
2. Renomeie a consulta para `financials`.
3. A coluna ` Sales` tem um **espaço no início**. Renomeie para `Sales` (sem esse ajuste, a medida não acha a coluna).
4. Confira os tipos: números decimais para valores monetários e `Date` como Data.
5. `Discount Band` tem o valor "None": deixe como está. É uma categoria válida (sem desconto).
6. **Fechar e aplicar**.

## Etapa 2 – Medidas · 15 min
1. **Inserir dados** > tabela vazia chamada `_Medidas` > Carregar.
2. Crie as medidas do arquivo `medidas.dax` dentro de `_Medidas`.
3. Formatos: Vendas, Lucro e Descontos em **Moeda** ($, 0 casas). Margem % e % Desconto em **Porcentagem** (1 casa).
4. Crie a coluna `Ano-Mês` na tabela financials (está no final do arquivo).

## Etapa 3 – Tema e layout · 20 min
1. **Exibição > Temas > Procurar temas** > `tema_financial.json`.
2. Página: **Formatar página > Tela de fundo > Adicionar imagem** > `fundos/01_visao_geral.png`, ajuste **Ajustar**, transparência **0%**.
3. Duplique a página 3 vezes e troque o fundo (`02_geografia`, `03_produtos`, `04_segmentos`). Renomeie as páginas.

> Os fundos já trazem menu lateral, cabeçalho com título, 4 caixas de KPI e 2 painéis. Se o desafio pedir layout feito com **objetos** (formas), recrie com **Inserir > Formas > Retângulo arredondado** nas mesmas posições abaixo. A estrutura é a mesma.

### Mapa de posições (tela 1280 × 720)
| Elemento | X | Y | L | A |
|---|---|---|---|---|
| Menu lateral | 0 | 0 | 80 | 720 |
| Botão nav 1 (Visão Geral) | 20 | 118 | 40 | 40 |
| Botão nav 2 (Geografia) | 20 | 194 | 40 | 40 |
| Botão nav 3 (Produtos) | 20 | 270 | 40 | 40 |
| Botão nav 4 (Segmentos) | 20 | 346 | 40 | 40 |
| Botão Limpar filtros | 20 | 650 | 40 | 40 |
| Segmentador Ano | 720 | 15 | 160 | 42 |
| Segmentador País | 892 | 15 | 180 | 42 |
| Segmentador Segmento | 1084 | 15 | 180 | 42 |
| Cartões KPI 1 a 4 | 96 / 392 / 688 / 984 | 86 | 280 | 84 |
| Painel esquerdo (pág. 1) | 96 | 186 | 632 | 518 |
| Painel direito (pág. 1) | 744 | 186 | 520 | 518 |
| Painel esquerdo (pág. 2–4) | 96 | 186 | 760 | 518 |
| Painel direito (pág. 2–4) | 872 | 186 | 392 | 518 |
| Botões de toggle (pág. 2–4) | 774 e 812 | 196 | 32 | 32 |

## Etapa 4 – Página 1 (Visão Geral) · 30 min

**Cartões (novo cartão ou cartão clássico):** `Vendas` · `Lucro` · `Margem %` · `Unidades Vendidas`. Desligue o fundo do visual, pois o fundo da página já desenha a caixa.

**Painel esquerdo:** *Gráfico de linhas e colunas clusterizadas*
- Eixo X: `Ano-Mês` · Colunas: `Vendas` · Linha: `Margem %`
- Título: "Vendas mensais e margem"

**Painel direito:** *Gráfico de barras clusterizadas*
- Eixo Y: `Country` · Eixo X: `Vendas` e `Lucro`
- Título: "Vendas e lucro por país"

**Segmentadores (topo):**
- `Year` em estilo **Bloco** (botões 2013 / 2014)
- `Country` em **Lista suspensa** com "Selecionar tudo"
- `Segment` em **Lista suspensa**

Depois: **Exibir > Sincronizar segmentações** e marque as 4 páginas (sincronizar e visível) nos três segmentadores. Copie e cole os segmentadores nas outras páginas. Ao colar, o Power BI pergunta se quer sincronizar: escolha **Sincronizar**.

## Etapa 5 – Botões de navegação com imagem · 20 min
1. **Inserir > Botão > Em branco**. Posicione conforme a tabela.
2. **Formatar > Botão > Estilo**:
   - Estado **Padrão**: Ícone desligado. Em *Preenchimento*, ligue a **Imagem** e use `icones/nav_visao_geral_cinza.png`, ajuste "Ajustar", fundo transparente.
   - Estado **Ao passar o mouse**: imagem `..._branco.png`.
3. **Ação** ligada > Tipo **Navegação de página** > Destino: Visão Geral.
4. Repita para Geografia (`nav_geografia`), Produtos (`nav_produtos`) e Segmentos (`nav_segmentos`).
5. Selecione os 4 botões, copie e cole nas outras páginas. Eles mantêm a mesma posição.
6. Na página atual, deixe o ícone **branco** no estado padrão. O fundo já destaca a página ativa.

**Alternativa rápida:** *Inserir > Botão > Navegador > Navegador de páginas* gera o menu automaticamente. Para cumprir o requisito de "botões com imagem", use os botões em branco.

**Limpar filtros:** botão em branco com imagem `limpar_filtros_cinza.png` > Ação > Tipo **Limpar todas as segmentações**.

No Power BI Desktop, use **Ctrl + clique** para testar botões. No serviço publicado, um clique simples basta.

## Etapa 6 – Visuais das páginas 2 a 4 · 40 min
Repita os 4 cartões (copie da página 1).

**Página 2 – Geografia**
- Painel esquerdo, visual A: **Mapa** com Local `Country`, Tamanho da bolha `Vendas`, Dica de ferramenta `Lucro` e `Margem %`.
- Painel esquerdo, visual B (mesma posição e tamanho): **Matriz** com Linhas `Country`, Colunas `Year`, Valores `Vendas`, `Lucro` e `Margem %`.
- Painel direito: **Barras clusterizadas** com Eixo Y `Country` e Eixo X `Margem %`. Cor das barras: fx > Valor do campo > `Cor Margem`.

**Página 3 – Produtos**
- Esquerdo A: **Barras empilhadas** com Eixo Y `Product`, Eixo X `Lucro`, Legenda `Discount Band`.
- Esquerdo B: **Matriz** com Linhas `Product`, Colunas `Discount Band`, Valores `Margem %`. Formatação condicional > Cor da tela de fundo > escala de cores.
- Direito: **Colunas** com Eixo X `Discount Band`, Eixo Y `Margem %`. Ordem: None, Low, Medium, High.

**Página 4 – Segmentos**
- Esquerdo A: **Barras** com Eixo Y `Segment`, Eixo X `Lucro`, Cor fx > `Cor Lucro`. Enterprise aparece em vermelho.
- Esquerdo B: **Tabela** com `Segment`, `Vendas`, `Lucro`, `Margem %`, `Unidades Vendidas` e `% Desconto`.
- Direito: **Dispersão** com Eixo X `Vendas`, Eixo Y `Margem %`, Tamanho `Unidades Vendidas`, Valores `Segment`.

## Etapa 7 – Indicadores + botões (toggle de visuais) · 30 min
Exemplo da página 2. As páginas 3 e 4 seguem o mesmo padrão.

1. **Exibir > Seleção** e **Exibir > Indicadores** (abra os dois painéis).
2. No painel Seleção, renomeie os visuais: `Geo_Mapa` e `Geo_Tabela`.
3. **Indicador 1:** deixe `Geo_Mapa` visível e oculte `Geo_Tabela` (ícone do olho). Em Indicadores > **Adicionar** > renomeie para `BK Geo Mapa`.
4. **Indicador 2:** inverta (Tabela visível, Mapa oculto) > Adicionar > `BK Geo Tabela`.
5. Em **cada** indicador, clique nos 3 pontos e **desmarque "Dados"**. Mantenha "Exibir" e "Página atual" marcados.
   **Isso é essencial**: com "Dados" marcado, o indicador reseta os segmentadores ao ser clicado.
6. Crie 2 botões em branco (32×32) no canto superior direito do painel:
   - Botão 1: imagem `toggle_mapa_azul.png` > Ação **Indicador** > `BK Geo Mapa`
   - Botão 2: imagem `toggle_tabela_azul.png` > Ação **Indicador** > `BK Geo Tabela`
7. Teste com Ctrl + clique e deixe o relatório salvo com o **Mapa** visível (estado padrão).

Páginas 3 e 4: use `toggle_grafico` e `toggle_tabela`, com os indicadores `BK Prod Grafico`, `BK Prod Tabela`, `BK Seg Grafico` e `BK Seg Tabela`.

**Opcional (diferencial):** selecione os 2 indicadores de cada página > 3 pontos > **Agrupar**, e use **Inserir > Botão > Navegador > Navegador de indicadores** como alternativa visual.

## Etapa 8 – Acabamento e entrega · 15 min
- [ ] Títulos de todos os visuais em português
- [ ] Rótulos de dados em milhões (Formatar > Rótulos > Unidades de exibição: Milhões)
- [ ] Interações: Formatar > **Editar interações** para os KPIs não filtrarem uns aos outros sem querer
- [ ] Testar todos os botões e toggles em todas as páginas
- [ ] Salvar `Desafio_02_Financial.pbix` nesta pasta
- [ ] **Arquivo > Exportar > PDF** e salvar `Desafio_02_Financial.pdf`
- [ ] Prints de cada página em `prints/` para o README
- [ ] Commit + push e enviar o link do repositório na DIO

## Insights para colocar no README (já calculados na base)
- Total: **$118,7 Mi em vendas**, **$16,9 Mi de lucro**, margem de **14,2%**.
- **Government** é o maior gerador de lucro: $11,4 Mi, 67% do total.
- **Enterprise vende $19,6 Mi e dá prejuízo de –$0,6 Mi** (margem –3%). É o principal alerta.
- **Channel Partners** tem a maior margem (73%), mas volume baixo ($1,8 Mi). É uma oportunidade de crescimento.
- Desconto corrói margem: **None 22% → Low 18% → Medium 14% → High 9%**.
- Países equilibrados em vendas ($21 a 25 Mi). França e Alemanha têm a melhor margem (16%); EUA, a pior (12%).
- **Paseo** é o produto líder em vendas ($33 Mi) e lucro ($4,8 Mi).
