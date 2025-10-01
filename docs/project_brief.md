# Project Brief: Linhagem Bíblica - De Adão a Cristo

## Visão Geral

Este projeto pessoal é uma aplicação web estática interativa que visualiza a árvore genealógica bíblica da linhagem principal de Adão até Jesus, integrando Gênesis 5/11 e Mateus 1. Usando dados em JSON, a página renderiza uma árvore hierárquica com blocos temáticos, tooltips educativos e um menu para alternar configurações. Inspirado na leitura devocional da NVT, promove reflexão sobre a fidelidade divina através das gerações.

## Objetivos

- **Principal**: Criar uma ferramenta visual acessível que conecta narrativas bíblicas (criação ao Messias), facilitando estudos devocionais e compreensão teológica.
- **Secundários**:
  - Suportar comparações de linhagens (Mateus vs. Lucas) e variantes textuais (MT vs. LXX).
  - Garantir interatividade simples e multilíngue para expansão.
  - Manter um MVP leve, desenvolvido no VS Code com GitHub Copilot, hospedado no Cloudflare Pages.

## Escopo

### In-Scope

- Linhagem de ~62 gerações em blocos: Pré-Dilúvio (Adão-Noé), Pós-Dilúvio (Noé-Abraão), Monarquia (Abraão-Davi), Exílio e Restauração (Davi-Jesus).
- Funcionalidades: Árvore interativa (tooltips com versos/notas), menu dropdown (versão/livro/idioma/variante), timeline com marcos.
- Dados: JSON padronizado (genealogia-completa-nvt.json) com metadados (nomes, idades, mães, notes).
- Tecnologias: Astro (páginas estáticas) com Vue islands (interatividade); Vite para build; CSS minimalista.
- Idioma: PT-BR default; suporte futuro a EN/ES.

### Out-of-Scope (MVP)

- Backend/APIs (ex.: áudio dinâmico).
- Recursos avançados (autenticação, quizzes).
- Linhas secundárias completas ou cálculos cronológicos automáticos.

## Visão Geral de Entregas

- **MVP**: Site único com árvore/menu carregados via Astro.
- **Fases Futuras**: Integrações devocionais, export PDF.
- **Métricas**: Tempo de exploração <1min; engajamento via menu >70% em testes pessoais.

Este é a "fonte de verdade". Valide toda documentação futura aqui.
