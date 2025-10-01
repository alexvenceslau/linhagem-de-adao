# Tech Context: Linhagem Bíblica - De Adão a Cristo

## Tecnologias Usadas

- **Frontend**: Astro (framework estático com ilhas de hidratação para interatividade); Vue.js (para componentes reativos como menu/árvore).
- **Build/Dev**: Vite (bundler rápido); npm/yarn para pacotes.
- **Dados**: JSON puro (genealogia-completa-nvt.json); parsing via JS nativo/Vue.
- **Estilos**: CSS vanilla ou Tailwind (se expandir); minimalista.
- **Hospedagem**: Cloudflare Pages (deploys Git auto, CDN global).
- **Sem Backend/DB**: Aplicação estática; zero servidor (sem Node runtime além de build).

## Setup de Desenvolvimento

- **VS Code**: Extensões: GitHub Copilot, Astro, Vue, Vite.
- **Comandos Iniciais**:
  - `npm create astro@latest .` (escolha Vue integration).
  - `npm install` (dependências mínimas: @astrojs/vue, vue).
  - Dev: `npm run dev` (localhost:4321).
  - Build: `npm run build` (gera /dist para CF Pages).
- **Estrutura**: Raiz com docs/JSON; src/pages para Astro; src/components para Vue.

## Constraints Técnicas

- Estático-only: Sem SSR dinâmico; interatividade client-side (Vue islands hidrata ~10% da página).
- Tamanho: <1MB total (JSON ~5KB, assets leves).
- Compatibilidade: Browsers modernos (ES6+); mobile-first.
- Performance: Astro otimiza para <100ms TTI.

## Problemas Potenciais e Mitigações

- **Hidatação Vue em Árvores Grandes**: JSON com 62 nodes pode lagar; mitigar com lazy-loading blocos.
- **Build no CF Pages**: Dependências grandes falham; manter <50 pacotes.
- **Acessibilidade**: Tooltips precisam ARIA; testar com Lighthouse.
- **Expansão**: Adicionar variantes JSON; versionar com Git branches.

## Dependências

- Core: astro@^4.x, @astrojs/vue@^3.x, vue@^3.x.
- Opcionais: d3.js (árvore), date-fns (timeline).
- Dev: vite@^5.x, @vitejs/plugin-vue.
