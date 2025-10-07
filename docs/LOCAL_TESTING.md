# Guia de Testes Locais com Browser MCP

## Configuração para Testes Locais

O Browser MCP está configurado para testar sua aplicação Astro localmente durante o desenvolvimento.

### Comandos Úteis para Testes

#### 1. Iniciar e Testar o Servidor de Desenvolvimento

```bash
# Terminal 1: Iniciar Astro dev server
cd /Users/alexvenceslau/dev/linhagem-de-adao/app && npm run dev

# Depois use MCP para testar:
"Navigate to http://localhost:4321 and verify the page loads correctly"
```

#### 2. Testes de Funcionalidade

```
"Open localhost:4321, find the genealogy tree component and test click interactions"
"Navigate to the dev server and test the dropdown menu functionality"
"Load the local app and verify all JSON data is rendering correctly"
```

#### 3. Testes de UI/UX

```
"Take a screenshot of localhost:4321 showing the complete genealogy tree"
"Test the responsive design by resizing browser window on localhost:4321"
"Verify color themes and accessibility on the local development site"
```

#### 4. Testes de Performance

```
"Load localhost:4321 and measure page load times"
"Test scroll performance on the genealogy tree component"
"Check if all 62 genealogy entries load correctly"
```

## Cenários de Teste Específicos

### Teste do Menu Dropdown

- Abrir menu de seleção de versão/livro
- Verificar se todas as opções estão funcionando
- Testar mudança de idioma (quando implementado)

### Teste da Árvore Genealógica

- Verificar se todos os blocos aparecem corretamente
- Testar tooltips com informações bíblicas
- Confirmar navegação entre gerações

### Teste de Dados JSON

- Verificar se genealogia-completa-nvt.json carrega
- Testar se todas as 62 gerações aparecem
- Confirmar referências bíblicas corretas

## Automação de Testes

### Testes de Regressão

```
"Run a complete test suite on localhost:4321: verify tree loads, menu works, and all data displays"
```

### Testes de Build

```bash
# Terminal: Build da aplicação
npm run build
npm run preview

# MCP: Testar build de produção
"Navigate to localhost:4322 and verify the production build works correctly"
```

### Documentação Visual

```
"Take screenshots of key features on localhost:4321 for project documentation"
"Create a visual test report showing before/after of UI changes"
```

## Debugging com Browser MCP

### Console Errors

```
"Open localhost:4321, check browser console for any JavaScript errors"
```

### Performance Issues

```
"Load the local app and identify any slow-loading components"
```

### Mobile Testing

```
"Test localhost:4321 on mobile viewport and verify responsive design"
```

## Comandos de Exemplo Prontos

```
# Teste básico
"Navigate to http://localhost:4321 and verify the Biblical genealogy app loads"

# Teste de componentes
"Open localhost:4321, interact with the Vue tree component and verify it responds correctly"

# Screenshot para documentação
"Take a screenshot of localhost:4321 showing the complete genealogy from Adam to Christ"

# Teste de dados
"Load localhost:4321 and verify that genealogy data from JSON displays all 4 blocks correctly"

# Teste responsivo
"Open localhost:4321 in mobile view and test genealogy tree usability"
```

## Benefícios para o Desenvolvimento

1. **Testes Automatizados**: Verifica funcionalidades sem interação manual
2. **Documentação Visual**: Screenshots automáticos das features
3. **Debugging Assistido**: Identifica problemas rapidamente
4. **Validação Contínua**: Testa depois de cada mudança no código
5. **Feedback Imediato**: Resultados de teste instantâneos

O Browser MCP transforma o teste local em um processo automatizado e inteligente! 🚀
