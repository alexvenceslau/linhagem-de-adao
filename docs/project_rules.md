# Project Rules: Linhagem Bíblica - De Adão a Cristo (Guard Rails)

## Introdução

Essas regras definem padrões para desenvolvimento consistente, especialmente para IA como Copilot. Adaptado de repositórios como Awesome Cursor Rules: Enfatize minimalismo, clareza e alinhamento com o Memory Bank (ex.: referencie brief.md em prompts). Violações: Pare e pergunte por aprovação.

## Regras Gerais para Geração de Código (para IA)

- **Chain of Thought (CoT)**: Sempre use: 1) Resuma tarefa; 2) Liste passos lógicos; 3) Gere pseudocódigo; 4) Implemente código; 5) Valide contra escopo (ex.: "Isso fits in-scope do project_brief.md?").
- **Minimalismo**: Mude só o essencial; adicione <50 linhas por iteração. Não refatore código existente sem prompt explícito.
- **Contexto**: Inclua referências (ex.: "Baseado em tech_context.md: Use Vue Composition API"). Limite prompts a 1 feature por vez.

## Padrões de Código Específicos

- **Estilo e Formatação**:
  - **Naming**: camelCase para variáveis/funções JS/Vue (ex.: `currentBlock`); kebab-case para CSS/Astro classes (ex.: `tree-node`).
  - **Indentação**: 2 espaços; chaves na mesma linha: `{ key: value }`.
  - **Linhas**: Máx 80 chars; quebre funções longas (>15 linhas) em sub-funções.
- **Comentários e Docs**:
  - JSDoc obrigatório para funções Vue/Astro (ex.: `/** Filtra blocos por variante. @param {string} variant - 'MT' ou 'LXX' */`).
  - Use `// TODO:` para pendências; evite comments inline (só para lógica complexa).
  - Em .astro: Markdown para seções (ex.: `---\nTitle: Linhagem\n---`).
- **Estrutura de Código**:
  - **Vue Components**: Use Composition API (`<script setup>`); reactive para estado (ex.: `const genealogy = ref([])`).
  - **Astro Pages**: Frontmatter para props; slots para layouts.
  - **Ordem**: Imports > Setup > Template > Styles.

## Restrições e Bibliotecas

- **Tamanho de Arquivos**: Máx 200 linhas por .vue/.astro (divida em sub-components se exceder).
- **Bibliotecas**:
  - **Permitidas (Mantenha Leve)**: Astro (^4.x), @astrojs/vue, Vue (^3.x), Vite (^5.x), D3.js (para árvore hierárquica), date-fns (manipulação de datas).
  - **Proibidas**: Qualquer coisa fora da pilha (ex.: React, Svelte, Angular); libs pesadas (Lodash – use nativo como `Array.filter`; Moment.js – use date-fns).
  - **Nativo Primeiro**: Prefira JS vanilla para parsing JSON; evite polyfills (browsers modernos).
- **Performance e Acessibilidade**:
  - Evite loops ineficientes (use `forEach` ou `map`); lazy-load blocos da árvore.
  - ARIA sempre: `aria-label` em selects/buttons; role="tree" para árvore.
  - Teste: Rode Lighthouse no dev server (alvo: Performance 95+, Accessibility 100%).

## Validação e Testes

- **Alinhamento**: Toda geração deve checar: "Isso resolve um problema do product_context.md sem expandir out-of-scope?"
- **Testes**: Gere testes unitários simples para Vue (Vitest: ex.: `expect(renderTree(data)).toBeVisible()`); manuais para interações.
- **Commits**: Mensagens claras: "feat: Adiciona menu dropdown (ref #1)".

## Estrutura de Diretórios (Referência Fixa para IA)

linhagem-biblica/
├── public/ # Assets estáticos (ex.: icons/adam.png)
├── src/
│ ├── components/ # Vue islands: MenuDropdown.vue, TreeViz.vue
│ ├── layouts/ # Astro: MainLayout.astro (header, footer)
│ └── pages/ # Astro: index.astro (principal)
├── astro.config.mjs # Configurações (integrations: [vue()])
├── package.json # Dependências e scripts
├── genealogia-completa-nvt.json # Dados da linhagem
├── project_brief.md # Escopo e objetivos
├── product_context.md # UX e personas
├── tech_context.md # Stack técnica
├── system_patterns.md # Arquitetura (este arquivo referenciado)
├── progress.md # Rastreio de avanço
├── project_rules.md # Regras (este arquivo)
└── README.md # Instruções de setup e demo

Use para navegação: "Edite src/components/TreeViz.vue seguindo naming rules."
