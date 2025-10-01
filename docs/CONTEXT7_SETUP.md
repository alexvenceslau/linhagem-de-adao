# Guia de Configuração Context7 MCP

## Configuração Completa do Context7

O Context7 fornece documentação e exemplos TypeScript diretamente no VS Code via MCP.

### 1. Verificação da Extensão

Certifique-se de que a extensão Context7 está instalada:

- Abra VS Code Extensions (Cmd+Shift+X)
- Procure por "Context7"
- Verifique se está instalada e ativada

### 2. Configuração do Servidor

A configuração já foi adicionada ao `.vscode/settings.json`:

```json
"context7": {
  "command": "npx",
  "args": ["-y", "@context7/mcp-server"],
  "env": {
    "CONTEXT7_LANGUAGE": "typescript",
    "CONTEXT7_PORT": "8080"
  }
}
```

### 3. Inicialização

Para usar o Context7, você precisa:

1. **Reiniciar VS Code** após a configuração
2. O servidor MCP será iniciado automaticamente
3. Verificar se está funcionando via comandos de teste

### 4. Configuração de Environment

No arquivo `.env.local` (copie de `.env.example`):

```bash
# Context7 MCP Server configuration
CONTEXT7_LANGUAGE=typescript
CONTEXT7_PORT=8080
CONTEXT7_URL=http://localhost:8080
```

### 5. Testes de Verificação

Use estes comandos para verificar se o Context7 está funcionando:

```
"Get TypeScript documentation for Astro framework"
"Show Vue 3 Composition API TypeScript examples"
"Find TypeScript interfaces for handling JSON data"
```

## Uso Específico para o Projeto Genealógico

### Astro + TypeScript

```
"Get Astro TypeScript configuration best practices"
"Show how to type Astro component props with TypeScript"
"Find TypeScript examples for Astro page components"
```

### Vue + TypeScript

```
"Get Vue 3 Composition API TypeScript patterns"
"Show TypeScript interfaces for Vue reactive data"
"Find examples of typed Vue components with props"
```

### Manipulação de JSON

```
"Get TypeScript interfaces for JSON schema validation"
"Show TypeScript types for genealogy data structures"
"Find examples of type-safe JSON parsing in TypeScript"
```

### Visualização de Dados

```
"Get D3.js TypeScript examples for tree visualization"
"Show TypeScript types for hierarchical data structures"
"Find examples of typed component libraries for trees"
```

## Benefícios para o Projeto

1. **Documentação Instantânea**: Acesso direto à docs TypeScript
2. **Exemplos Contextuais**: Código específico para Astro + Vue
3. **Type Safety**: Interfaces e tipos corretos para genealogy data
4. **Padrões Atuais**: Best practices mais recentes do TypeScript
5. **Integração Nativa**: Funciona diretamente no VS Code

## Troubleshooting

### Servidor Não Inicia

1. Verifique se a extensão Context7 está instalada
2. Reinicie VS Code completamente
3. Verifique logs do VS Code (Help > Toggle Developer Tools)

### Porta em Uso

Se a porta 8080 estiver ocupada:

1. Altere `CONTEXT7_PORT` no `.env.local`
2. Atualize a configuração em `.vscode/settings.json`
3. Reinicie VS Code

### Sem Resposta

1. Verifique conexão com internet (para download inicial)
2. Confirme que npx está funcionando: `npx --version`
3. Teste com comando simples: "Get TypeScript basics"

## Comandos Úteis Prontos

```
# Setup inicial
"Help me configure TypeScript for Astro with Vue integration"

# Tipagem de dados
"Create TypeScript interfaces for biblical genealogy JSON data"

# Componentes Vue
"Show TypeScript patterns for Vue 3 tree components"

# Performance
"Get TypeScript best practices for large dataset visualization"

# Testing
"Find TypeScript examples for testing Astro applications"
```

O Context7 vai acelerar muito seu desenvolvimento TypeScript fornecendo documentação e exemplos contextuais diretamente no editor! 🚀
