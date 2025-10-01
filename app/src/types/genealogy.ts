// TypeScript interfaces for Biblical Genealogy Data
// Based on genealogia-completa-nvt.json structure

export interface GenealogyEntry {
  verse: string;
  father: string | null;
  name: string;
  age_at_son?: number;
  years_after?: number;
  total?: number;
  mother?: string | null;
  notes?: string;
}

// Extended interface for tree visualization
export interface Person extends GenealogyEntry {
  generation?: number;
  lifespan?: string;
  reference?: string;
  block?: string;
}

export interface GenealogyBlock {
  name: string;
  generations: number;
  entries: GenealogyEntry[];
  description?: string;
  color_theme?: string;
  biblical_period?: string;
}

export interface GenealogyData {
  title: string;
  version: string;
  language: string;
  source: string;
  description: string;
  totalGenerations: number;
  blocks: GenealogyBlock[];
}

// Helper types for UI components
export type BlockName =
  | "Bloco Pré-Dilúvio: De Adão a Noé"
  | "Bloco Pós-Dilúvio: De Noé a Abraão"
  | "Bloco 1: De Abraão a Davi"
  | "Bloco 2: De Davi ao Exílio na Babilônia"
  | "Bloco 3: Do Exílio na Babilônia a Cristo";

export type BiblicalVersion = "NVT" | "ARA" | "NVI";

export type TextualVariant = "MT" | "LXX";

// Color themes for each block (matching PRD)
export const BLOCK_THEMES = {
  "pre-flood": "#8B4513", // Brown - Pre-Diluvian
  "post-flood": "#4682B4", // Steel Blue - Post-Diluvian
  monarchy: "#DAA520", // Goldenrod - Patriarchal/Monarchical
  "exile-restoration": "#800080", // Purple - Exilic/Post-Exilic
} as const;

// Utility functions
export function getBlockThemeColor(blockName: string): string {
  if (blockName.includes("Pré-Dilúvio")) return BLOCK_THEMES["pre-flood"];
  if (blockName.includes("Pós-Dilúvio")) return BLOCK_THEMES["post-flood"];
  if (blockName.includes("Abraão a Davi")) return BLOCK_THEMES["monarchy"];
  if (blockName.includes("Davi") || blockName.includes("Cristo"))
    return BLOCK_THEMES["exile-restoration"];
  return "#666666"; // Default gray
}

export function getTotalPeople(data: GenealogyData): number {
  return data.blocks.reduce((total, block) => total + block.entries.length, 0);
}

export function getPersonByName(
  data: GenealogyData,
  name: string
): GenealogyEntry | undefined {
  for (const block of data.blocks) {
    const person = block.entries.find((entry) => entry.name === name);
    if (person) return person;
  }
  return undefined;
}

export function getBlockByName(
  data: GenealogyData,
  blockName: string
): GenealogyBlock | undefined {
  return data.blocks.find((block) => block.name === blockName);
}
