# MCP Server Setup and Configuration Guide

## Overview

This project uses Model Context Protocol (MCP) servers to enhance development capabilities with AI assistance. The configured servers provide:

- **GitHub Integration**: Repository management, issues, pull requests
- **Filesystem Operations**: File management and project structure
- **Browser Automation**: Local testing of Astro application
- **JSON Data Processing**: Genealogy data management from JSON files
- **Git Operations**: Version control integration
- **Memory**: Context preservation across sessions
- **Context7**: TypeScript documentation and code examples

## Quick Setup

### 1. Install Dependencies

```bash
# The MCP servers will be installed automatically via npx
# No manual installation required
```

### 2. Configure Environment Variables

```bash
# Copy the example environment file
cp .env.example .env.local

# Edit .env.local and add your API keys:
# - GITHUB_TOKEN (from https://github.com/settings/tokens)
# - Configure local development URLs if needed
```

### 3. Prepare JSON Data

```bash
# Ensure your genealogy JSON file exists
# Use genealogia-example.json as a template for structure
```

### 4. Restart VS Code

After setting up the environment variables, restart VS Code to activate the MCP servers.

## Available MCP Servers

### GitHub Server

- **Purpose**: Repository management, issues, pull requests
- **Commands**: Create issues, manage PRs, repository operations
- **Environment**: Requires `GITHUB_TOKEN`

### Filesystem Server

- **Purpose**: File operations and project structure management
- **Commands**: Read, write, move files; directory operations
- **Scope**: Limited to project directory for security

### Browser Server (Puppeteer)

- **Purpose**: Local application testing and UI automation
- **Commands**: Navigate localhost, test interactions, take screenshots
- **Capabilities**: Test Astro dev server, Vue components, user flows

### JSON Processing Server

- **Purpose**: Genealogy data management from JSON files
- **Commands**: Parse, validate, and manipulate JSON genealogy data
- **Data Files**: `genealogia-completa-nvt.json` and variants

### Git Server

- **Purpose**: Version control operations
- **Commands**: Git status, commits, branches, diffs
- **Scope**: Current repository only

### Memory Server

- **Purpose**: Maintain context across AI sessions
- **Commands**: Store and retrieve conversation context
- **Storage**: Local memory for session continuity

### Context7 Server

- **Purpose**: TypeScript documentation and code examples
- **Commands**: Get library docs, code snippets, best practices
- **Language**: TypeScript (configured for Astro + Vue project)
- **URL**: http://localhost:8080 (when server is running)

## Usage Examples

### Local Application Testing

```
"Navigate to localhost:4321 and test the genealogy tree component"
"Open the dev server, click through the menu options and verify functionality"
"Take screenshots of the genealogy visualization for documentation"
```

### JSON Data Operations

```
"Parse genealogia-completa-nvt.json and show all pre-flood patriarchs"
"Add new genealogy entry to JSON file with biblical references"
"Validate JSON structure against the genealogy schema"
```

### TypeScript Documentation (Context7)

```
"Get Astro TypeScript configuration examples"
"Show Vue 3 Composition API TypeScript patterns"
"Find TypeScript interface definitions for genealogy data"
"Get D3.js TypeScript examples for tree visualization"
```

### Project Management

```
"Create a GitHub issue for implementing the Vue tree component"
"Check git status and commit recent changes"
```

### File Operations

```
"Read the genealogia-completa-nvt.json file and analyze its structure"
"Create a new Vue component for the genealogy tree"
"Backup current JSON data before making changes"
```

## Configuration Files

- `.vscode/settings.json`: VS Code MCP server configuration with JSON schema
- `.env.example`: Template for environment variables
- `genealogia-example.json`: Example structure for genealogy data
- `.gitignore`: Excludes sensitive files and build artifacts

## Troubleshooting

### MCP Servers Not Loading

1. Check VS Code settings in `.vscode/settings.json`
2. Verify environment variables in `.env.local`
3. Restart VS Code completely
4. Check VS Code developer console for errors

### API Authentication Issues

1. Verify API keys are correctly set in `.env.local`
2. Check API key permissions (GitHub token needs repo access)
3. Test API keys independently before using with MCP

### JSON Data Issues

1. Validate JSON syntax with VS Code's built-in validator
2. Check against the schema defined in `.vscode/settings.json`
3. Use `genealogia-example.json` as structure reference
4. Ensure file permissions allow read/write access

## Security Notes

- Environment variables contain sensitive API keys
- Never commit `.env.local` to version control
- GitHub token should have minimal required permissions
- Database is local SQLite file - backup regularly

## Project Integration

These MCP servers are specifically configured for the Biblical genealogy project:

- **Local Testing**: Automated testing of Astro application during development
- **Data Management**: JSON-based genealogy data with schema validation
- **Development Workflow**: GitHub integration for issues and PRs
- **File Management**: Astro/Vue file operations with JSON processing
- **Version Control**: Git operations for project history

The configuration aligns with the project's tech stack (Astro + Vue) and development patterns outlined in `project_rules.md`.

## Next Steps

1. Set up API keys in `.env.local`
2. Create your `genealogia-completa-nvt.json` file using the example structure
3. Test MCP servers with simple commands
4. Begin using AI assistance for project development

For project-specific guidance, refer to:

- `project_brief.md`: Project scope and objectives
- `tech_context.md`: Technology stack details
- `project_rules.md`: Development guidelines
