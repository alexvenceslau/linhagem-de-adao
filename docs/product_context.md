# Product Context: Linhagem Bíblica - De Adão a Cristo

## Por Que o Projeto Existe

Nascido da jornada de leitura bíblica na NVT, o projeto transforma genealogias fragmentadas (Gênesis 5, Mateus 1) em uma narrativa visual coesa, destacando temas de redenção e fidelidade divina. Resolve a barreira de visualização para leitores iniciantes, fomentando devoção diária.

## Problemas que Resolve

- Narrativas desconectadas: Une Gênesis ao NT sem esforço manual.
- Complexidade para novatos: Idades/nomes/variantes confundem; tooltips simplificam.
- Engajamento estático: Menu interativo permite personalização (ex.: alternar Lucas).
- Falta de inspiração: Notas simbólicas (ex.: 3x14 em Mateus) adicionam profundidade teológica.

## Como Deve Funcar

- **Fluxo**: Carrega página com árvore em blocos coloridos; cliques expandem detalhes NVT. Menu atualiza view dinamicamente via Vue islands em Astro.
- **Renderização**: JSON parseado para árvore (ex.: D3.js leve ou Vue Flow); timeline estática com marcos.
- **Interações**: Hover para versos/significados; busca por nome; toggle "modo completo" (mulheres como Tamar).

## Objetivos de Experiência do Usuário (UX)

- **Princípios**: Intuitivo, sereno (tons bíblicos: terra/azul/dourado); acessível (ARIA, mobile-first); carga <2s via Astro.
- **Personas**:
  - **Iniciante Devocional (25-40a)**: Precisa conexões simples; dor: overload de texto; delícia: insights rápidos.
  - **Estudioso Casual (30-50a)**: Comparações variantes; dor: mapeamento manual; delícia: menu acadêmico.
  - **Familiar (35-55a)**: Mobile para grupos; dor: conteúdo seco; delícia: timeline interativa.
- **Jornada**:
  1. Entrada: Citação Gn 5:1 acolhedora.
  2. Exploração: Navega árvore/menu.
  3. Engajamento: Reflexão em notes.
  4. Saída: Links devocionais; sensação de conexão.
- **Métricas**: Taxa de retenção >80%; feedback: "Enriquece minha leitura".

Guia decisões para visão devocional alinhada.
