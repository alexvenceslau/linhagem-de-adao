# Progress: Linhagem Bíblica - De Adão a Cristo

## Status Atual (Atualizado em [Data: 01/10/2025])

- **Fase**: Planejamento/Setup Inicial (Memory Bank completo; Astro projetado).

## O Que Já Funciona (✅)

- Documentação: Todos os MDs do Memory Bank (brief, context, tech, patterns, rules).
- Dados: `genealogia-completa-nvt.json` validado (62 entradas; blocos testados via console.log).
- Setup: Pasta projeto criada; `npm create astro@latest` rodado com Vue integration.
- Testes Básicos: JSON importado em Astro (ex.: {{ JSON.parse(data).blocks[0] }} renderiza).

## O Que Falta (Prioridades - Backlog)

| Prioridade | Tarefa                                                                       | Estimativa | Dependências             |
| ---------- | ---------------------------------------------------------------------------- | ---------- | ------------------------ |
| **Alta**   | Implementar componente Vue para árvore (usar Vue Flow ou D3 para hierarquia) | 2-3h       | JSON + tech_context.md   |
| **Alta**   | Menu dropdown Vue (selects para versão/livro/idioma; emit para re-render)    | 1-2h       | product_context.md       |
| **Média**  | Integrar timeline (CSS flex/grid com datas do JSON)                          | 1h         | system_patterns.md       |
| **Média**  | Responsividade (media queries para mobile)                                   | 30min      | UX em product_context.md |
| **Baixa**  | Deploy teste no CF Pages (connect Git; run build)                            | 15min      | Nenhum                   |
| **Futuro** | JSON para Lucas; toggle variantes (LXX idades)                               | 4h         | Escopo em brief.md       |

## Bugs/Issues Conhecidos (🔴)

- Nenhum crítico (fase inicial).
- Potencial: Lag em hidratação Vue com 62 nodes – mitigar com virtual scrolling (monitorar pós-implementação).
- Rastreio: Use GitHub Issues (labels: bug, enhancement, good-first-issue). Adicione aqui para overview.

## Métricas de Avanço

- MVP Target: Fim da próxima semana (árvore + menu funcionais).
- Próximo Milestone: Deploy preview no CF Pages.
  Atualize após cada sessão de codificação.
