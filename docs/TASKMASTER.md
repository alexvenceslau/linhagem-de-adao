# Taskmaster - Plano de Desenvolvimento

## Projeto: Linhagem Bíblica - De Adão a Cristo

### Status Geral: 🚀 Iniciando Desenvolvimento

**Data de Início**: 01/10/2025  
**Prazo MVP**: ~5 semanas  
**Metodologia**: Desenvolvimento incremental com entregas semanais

---

## 📋 BACKLOG ORGANIZADO

### 🏗️ **FASE 1: Fundação (Semana 1-2)**

Prioridade: **CRÍTICA** ⭐⭐⭐

#### Task 1.1: Setup Técnico

- [ ] Inicializar projeto Astro com Vue integration
- [ ] Configurar TypeScript (seguir project_rules.md)
- [ ] Setup Vite + dev environment
- [ ] Verificar MCP servers funcionando
- **Estimativa**: 2-3h | **Dependência**: Nenhuma

#### Task 1.2: Estrutura de Dados

- [ ] Criar genealogia-completa-nvt.json (62 gerações)
- [ ] Definir interfaces TypeScript para dados
- [ ] Validar JSON schema no VS Code
- [ ] Testar import nos componentes Astro
- **Estimativa**: 3-4h | **Dependência**: Task 1.1

#### Task 1.3: Layout Base

- [ ] Criar MainLayout.astro (header/footer)
- [ ] Implementar navegação básica
- [ ] Configurar CSS base e variáveis de cor
- [ ] Testar responsividade inicial
- **Estimativa**: 2-3h | **Dependência**: Task 1.1

### 🎨 **FASE 2: Core Features (Semana 3-4)**

Prioridade: **ALTA** ⭐⭐

#### Task 2.1: Árvore Genealógica

- [ ] Implementar TreeViz.vue component
- [ ] Integrar Vue Flow ou D3.js para visualização
- [ ] Aplicar 4 temas de cores por bloco
- [ ] Lazy loading para performance
- **Estimativa**: 6-8h | **Dependência**: Task 1.2, 1.3

#### Task 2.2: Menu Interativo

- [ ] Criar MenuDropdown.vue component
- [ ] Implementar seleção Mateus vs Lucas
- [ ] Adicionar toggle MT vs LXX
- [ ] Event handling para re-render
- **Estimativa**: 3-4h | **Dependência**: Task 2.1

#### Task 2.3: Sistema de Tooltips

- [ ] Componente Tooltip.vue reutilizável
- [ ] Integrar referências bíblicas
- [ ] Hover states e animations
- [ ] Acessibilidade (ARIA)
- **Estimativa**: 2-3h | **Dependência**: Task 2.1

### ✨ **FASE 3: Polish & Deploy (Semana 5)**

Prioridade: **MÉDIA** ⭐

#### Task 3.1: Responsividade

- [ ] Mobile-first CSS refinements
- [ ] Touch interactions para mobile
- [ ] Testes em múltiplos devices
- [ ] Performance mobile optimization
- **Estimativa**: 2-3h | **Dependência**: Tasks 2.x

#### Task 3.2: Performance & SEO

- [ ] Otimização de bundle size (<1MB)
- [ ] Meta tags e SEO básico
- [ ] Lighthouse score >90
- [ ] Progressive enhancement
- **Estimativa**: 1-2h | **Dependência**: Tasks 2.x

#### Task 3.3: Deploy Production

- [ ] Setup Cloudflare Pages
- [ ] Configurar CI/CD com GitHub
- [ ] Testes de produção
- [ ] Monitoramento básico
- **Estimativa**: 1h | **Dependência**: Task 3.2

---

## 🎯 PRÓXIMOS PASSOS IMEDIATOS

### ✅ **Passo 1: Começar Task 1.1**

```bash
# Comando para executar agora:
npm create astro@latest . --template minimal --typescript
```

### ⏭️ **Passo 2: Ativar Taskmaster**

1. Marcar Task 1.1 como "in-progress"
2. Executar setup do Astro
3. Testar MCP servers com novo projeto
4. Marcar como "completed" quando terminar

### 📊 **Tracking de Progress**

- Use o todo list do VS Code/MCP para acompanhar
- Update progress.md após cada task completada
- Browser MCP para testar localhost durante desenvolvimento

---

## 🔧 FERRAMENTAS DO TASKMASTER

### Comandos MCP Úteis:

```
# Gestão de tarefas
"Mark task 1.1 as in-progress and begin Astro setup"
"Complete current task and move to next priority item"
"Show current sprint progress and blockers"

# Desenvolvimento
"Navigate to localhost:4321 and test current implementation"
"Get TypeScript examples for Astro Vue integration"
"Create GitHub issue for current task documentation"

# Validação
"Run tests on genealogy JSON data structure"
"Check project compliance with PRD requirements"
"Verify mobile responsiveness on localhost"
```

### Arquivos de Referência:

- **PRD**: Requisitos e critérios de sucesso
- **project_rules.md**: Padrões de código
- **tech_context.md**: Stack e dependências
- **progress.md**: Status atual (atualizar frequentemente)

---

## 🚨 CRITÉRIOS DE DEFINIÇÃO DE PRONTO

Cada task só está "completed" quando:

- ✅ Código segue project_rules.md
- ✅ Funciona no Browser MCP (localhost test)
- ✅ TypeScript sem erros
- ✅ Responsivo (mobile + desktop)
- ✅ Documentado em progress.md

**🎯 Foco atual: Task 1.1 - Setup Astro + Vue + TypeScript**

Marque como "in-progress" e comece o desenvolvimento! 🚀
