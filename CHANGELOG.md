# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Não Lançado]

### Planejado

- [ ] Árvore genealógica interativa com Vue Flow
- [ ] Menu dropdown para seleção de versões bíblicas
- [ ] Sistema de tooltips com referências bíblicas
- [ ] Otimização mobile avançada
- [ ] Deploy automatizado para Cloudflare Pages

## [0.1.0-dev] - 2025-10-01

### Adicionado

- ✅ **Estrutura base do projeto** com Astro v5.14.1 + Vue 3.5.22 + TypeScript
- ✅ **Dados genealógicos completos** em JSON com 62 gerações organizadas em 5 blocos bíblicos
- ✅ **Layout responsivo** com design temático bíblico e paleta de cores inspirada nas Escrituras
- ✅ **Sistema de ícones Font Awesome v7** substituindo emojis por ícones profissionais
- ✅ **Navegação principal** com header responsivo e menu hamburger
- ✅ **Página inicial** com estatísticas da genealogia e call-to-action
- ✅ **Página da árvore** (`/tree`) com estrutura para visualização interativa
- ✅ **TypeScript interfaces** para type safety dos dados genealógicos
- ✅ **Documentação completa** organizada no diretório `/docs`
- ✅ **README abrangente** com guias de instalação e desenvolvimento

### Técnico

- Configuração Astro com integração Vue 3
- TypeScript strict mode habilitado
- CSS moderno com variáveis customizadas
- Font Awesome v7.1.0 integrado via arquivos estáticos
- Estrutura de componentes Vue modulares
- Sistema de cores temáticas bíblicas:
  - Terra: `#8B4513` (tons terrosos)
  - Água: `#4682B4` (azul sereno)
  - Ouro: `#DAA520` (dourado divino)
  - Púrpura: `#800080` (realeza)

### Dados

- **Genealogia completa** de Adão a Cristo (62 gerações)
- **5 blocos históricos**:
  1. Pré-Dilúvio (Adão a Noé)
  2. Pós-Dilúvio (Noé a Abraão)
  3. Patriarcas (Abraão a Davi)
  4. Reis (Davi ao Exílio)
  5. Pós-Exílio (até Cristo)
- Baseado na Nova Tradução Viva (NVT)
- Estrutura JSON validada e tipada

### Documentação

- Product Requirements Document (PRD) completo
- Especificações técnicas detalhadas
- Guias de setup para MCP, Context7 e testes locais
- Sistema Taskmaster para gerenciamento de projeto
- Padrões de código e diretrizes de desenvolvimento

### Infraestrutura

- Git configurado com .gitignore adequado
- VS Code configurado com extensões recomendadas
- Scripts de desenvolvimento e build
- Estrutura de pastas organizada e escalável

## Formato das Entradas

### Tipos de Mudanças

- `Adicionado` para novas funcionalidades
- `Modificado` para mudanças em funcionalidades existentes
- `Depreciado` para funcionalidades que serão removidas em breve
- `Removido` para funcionalidades removidas
- `Corrigido` para correções de bugs
- `Segurança` para melhorias de segurança

### Status

- ✅ **Implementado**: Funcionalidade completa e testada
- 🔄 **Em Desenvolvimento**: Funcionalidade parcialmente implementada
- 📋 **Planejado**: Funcionalidade definida mas não iniciada
- 🐛 **Correção**: Bug fix implementado
- 🔧 **Técnico**: Mudança técnica/infraestrutura

---

**Legenda de Versões:**

- **Major** (X.0.0): Mudanças incompatíveis na API
- **Minor** (0.X.0): Adição de funcionalidades compatíveis
- **Patch** (0.0.X): Correções de bugs compatíveis
- **Dev** (X.X.X-dev): Versões de desenvolvimento
