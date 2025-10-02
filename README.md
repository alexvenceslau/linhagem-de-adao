# Linhagem de Adão

Uma aplicação web interativa para explorar a genealogia bíblica de Adão a Cristo, desenvolvida com Astro, Vue.js e TypeScript.

## 🌟 Visão Geral

Este projeto apresenta as 62 gerações bíblicas de forma visual e interativa, organizadas em 5 blocos temáticos históricos, baseado nas Escrituras Sagradas (versão NVT - Nova Tradução Viva).

## 🚀 Tecnologias

- **Frontend**: [Astro v5.14.1](https://astro.build/) + [Vue 3.5.22](https://vuejs.org/)
- **Linguagem**: TypeScript
- **Estilo**: CSS moderno + Font Awesome v7
- **Dados**: JSON estruturado com genealogia bíblica
- **Deploy**: Cloudflare Pages (planejado)

## 📂 Estrutura do Projeto

```
linhagem-de-adao/
├── app/                    # Aplicação Astro principal
│   ├── src/
│   │   ├── components/     # Componentes Vue/Astro
│   │   ├── layouts/        # Layouts base
│   │   ├── pages/          # Páginas da aplicação
│   │   └── types/          # Definições TypeScript
│   ├── public/             # Arquivos estáticos
│   └── package.json
├── docs/                   # Documentação do projeto
├── data/                   # Dados genealógicos
├── scripts/                # Scripts auxiliares
└── genealogia-completa-nvt.json  # Dados principais
```

## 🎯 Funcionalidades

### ✅ Implementado

- [x] Layout responsivo com design bíblico
- [x] Sistema de ícones Font Awesome v7
- [x] Dados genealógicos estruturados (62 gerações)
- [x] Navegação principal com breadcrumbs
- [x] Página inicial com estatísticas

### 🔄 Em Desenvolvimento

- [ ] Árvore genealógica interativa
- [ ] Menu dropdown para versões bíblicas
- [ ] Sistema de tooltips com referências
- [ ] Otimização mobile avançada
- [ ] Deploy automatizado

## 🏛️ Períodos Históricos

1. **Pré-Dilúvio** (Adão a Noé) - 🌱 Verde
2. **Pós-Dilúvio** (Noé a Abraão) - 🚢 Azul
3. **Patriarcas** (Abraão a Davi) - 👑 Dourado
4. **Reis** (Davi ao Exílio) - ♕ Roxo
5. **Pós-Exílio** (até Cristo) - ⭐ Vermelho

## 🛠️ Desenvolvimento

### Pré-requisitos

- Node.js 20.3.0+
- npm 9.6.4+

### Instalação

```bash
# Clonar o repositório
git clone https://github.com/alexvenceslau/linhagem-de-adao.git
cd linhagem-de-adao

# Instalar dependências
cd app
npm install

# Iniciar servidor de desenvolvimento
npm run dev
```

### Scripts Disponíveis

```bash
npm run dev      # Servidor de desenvolvimento
npm run build    # Build para produção
npm run preview  # Preview do build
```

## 📖 Documentação

A documentação completa está disponível no diretório [`/docs`](./docs/):

- [**PRD**](./docs/prd.txt) - Product Requirements Document
- [**Contexto Técnico**](./docs/tech_context.md) - Especificações técnicas
- [**Regras do Projeto**](./docs/project_rules.md) - Diretrizes e padrões
- [**Setup MCP**](./docs/MCP_SETUP.md) - Configuração de servidores MCP
- [**Taskmaster**](./docs/TASKMASTER.md) - Gerenciamento de tarefas

## 🎨 Design System

### Cores Principais

- **Terra**: `#8B4513` - Tons terrosos bíblicos
- **Água**: `#4682B4` - Azul sereno das águas
- **Ouro**: `#DAA520` - Dourado divino
- **Púrpura**: `#800080` - Realeza e reverência

### Tipografia

- **Títulos**: Crimson Text (serif bíblico)
- **Texto**: Inter (sans-serif moderno)

## 🔗 Links Úteis

- **Aplicação**: http://localhost:4322 (desenvolvimento)
- **Árvore Interativa**: http://localhost:4322/tree
- **Repositório**: https://github.com/alexvenceslau/linhagem-de-adao

## 📝 Versioning

Este projeto segue o [Semantic Versioning](https://semver.org/).

**Versão Atual**: `v0.1.0-dev`

## 👥 Contribuição

Contribuições são bem-vindas! Por favor:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🙏 Agradecimentos

- **Fonte Bíblica**: Nova Tradução Viva (NVT)
- **Inspiração**: A importância das genealogias nas Escrituras Sagradas
- **Comunidade**: Desenvolvedores que contribuem para tecnologias open source

---

_"Este é o livro da genealogia de Adão..."_ - Gênesis 5:1 (NVT)
