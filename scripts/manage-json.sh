#!/bin/bash

# JSON Validation and Management Script for Biblical Genealogy Project
# This script helps validate and manage genealogy JSON files

set -e

PROJECT_DIR="/Users/alexvenceslau/dev/linhagem-de-adao"
JSON_FILE="$PROJECT_DIR/genealogia-completa-nvt.json"
EXAMPLE_FILE="$PROJECT_DIR/genealogia-example.json"

echo "📄 Biblical Genealogy JSON Manager"
echo "=================================="

# Function to validate JSON syntax
validate_json() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo "❌ File not found: $file"
        return 1
    fi
    
    if jq empty "$file" 2>/dev/null; then
        echo "✅ JSON syntax is valid: $(basename "$file")"
        return 0
    else
        echo "❌ JSON syntax error in: $(basename "$file")"
        return 1
    fi
}

# Function to show JSON structure
show_structure() {
    local file="$1"
    echo "📋 Structure of $(basename "$file"):"
    jq -r '
        "Metadata: " + .metadata.title + " (v" + .metadata.version + ")",
        "Blocks: " + (.blocks | length | tostring),
        "Total Generations: " + (.metadata.total_generations | tostring),
        "",
        "Available Blocks:",
        (.blocks[] | "  - " + .block_name + " (" + .description + ")")
    ' "$file" 2>/dev/null || echo "Could not parse JSON structure"
}

# Function to backup JSON file
backup_json() {
    local file="$1"
    local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$file" "$backup"
    echo "💾 Backup created: $(basename "$backup")"
}

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "❌ jq is not installed. Please install it first:"
    echo "   macOS: brew install jq"
    echo "   Ubuntu: sudo apt-get install jq"
    exit 1
fi

# Main execution
echo "🔍 Checking for genealogy JSON files..."

# Validate example file
if [ -f "$EXAMPLE_FILE" ]; then
    validate_json "$EXAMPLE_FILE"
    show_structure "$EXAMPLE_FILE"
else
    echo "⚠️  Example file not found: genealogia-example.json"
fi

echo ""

# Check main genealogy file
if [ -f "$JSON_FILE" ]; then
    echo "📁 Found main genealogy file"
    validate_json "$JSON_FILE"
    show_structure "$JSON_FILE"
    
    # Offer to create backup
    read -p "💾 Create backup of main file? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        backup_json "$JSON_FILE"
    fi
else
    echo "📝 Main genealogy file not found: genealogia-completa-nvt.json"
    echo "💡 You can use genealogia-example.json as a starting template"
    
    read -p "🚀 Create main file from example? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp "$EXAMPLE_FILE" "$JSON_FILE"
        echo "✅ Created $JSON_FILE from example template"
    fi
fi

echo ""
echo "🚀 Quick Commands:"
echo "   Validate: jq empty genealogia-completa-nvt.json"
echo "   View structure: jq '.metadata, .blocks[].block_name' genealogia-completa-nvt.json"
echo "   Count generations: jq '.metadata.total_generations' genealogia-completa-nvt.json"
echo ""
echo "🌐 Browser MCP Testing:"
echo "   'Navigate to localhost:4321 and test genealogy tree'"
echo "   'Take screenshot of localhost:4321 for documentation'"
echo "   'Test dropdown menu functionality on local dev server'"
echo ""
echo "� Context7 TypeScript Help:"
echo "   'Get Astro TypeScript configuration examples'"
echo "   'Show Vue 3 Composition API TypeScript patterns'"
echo "   'Create TypeScript interfaces for genealogy JSON data'"
echo ""
echo "�📚 Documentation:"
echo "   MCP Setup: MCP_SETUP.md"
echo "   Local Testing: LOCAL_TESTING.md"
echo "   Context7 Setup: CONTEXT7_SETUP.md"