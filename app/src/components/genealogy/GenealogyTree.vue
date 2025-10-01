<template>
  <div class="genealogy-tree-container">
    <!-- Tree Header -->
    <div class="tree-header">
      <h3 class="tree-title">
        <i class="fas fa-sitemap"></i>
        Árvore Genealógica Interativa
      </h3>
      <p class="tree-description">
        Explore as conexões familiares através dos tempos bíblicos
      </p>
    </div>

    <!-- Block Filter Buttons -->
    <div class="block-filters">
      <button
        v-for="(block, index) in availableBlocks"
        :key="index"
        @click="toggleBlock(block.name)"
        :class="{
          'filter-btn': true,
          'filter-btn--active': visibleBlocks.includes(block.name),
          [`filter-btn--${getBlockColorClass(block.name)}`]: true,
        }"
      >
        <i :class="getBlockIcon(block.name)"></i>
        {{ block.name }}
        <span class="block-count">({{ block.count }})</span>
      </button>
    </div>

    <!-- Vue Flow Tree -->
    <div class="vue-flow-wrapper">
      <VueFlow
        :nodes="displayNodes"
        :edges="displayEdges"
        :zoom-on-scroll="true"
        :zoom-on-pinch="true"
        :pan-on-scroll="false"
        :pan-on-drag="true"
        :fit-view-on-init="true"
        :max-zoom="2"
        :min-zoom="0.1"
        class="genealogy-flow"
        @node-click="onNodeClick"
      >
        <template #node-person="nodeProps">
          <PersonNode v-bind="nodeProps" />
        </template>

        <Background :pattern-color="#f1f5f9" pattern="dots" :gap="20" />

        <Controls
          :show-zoom="true"
          :show-fit-view="true"
          :show-interactive="true"
        />
      </VueFlow>
    </div>

    <!-- Person Details Panel -->
    <div v-if="selectedPerson" class="person-details-panel">
      <div class="panel-header">
        <h4>
          <i class="fas fa-user"></i>
          {{ selectedPerson.name }}
        </h4>
        <button @click="selectedPerson = null" class="close-btn">
          <i class="fas fa-times"></i>
        </button>
      </div>

      <div class="panel-content">
        <div v-if="selectedPerson.lifespan" class="detail-row">
          <i class="fas fa-calendar-alt"></i>
          <span>Período: {{ selectedPerson.lifespan }}</span>
        </div>

        <div v-if="selectedPerson.generation" class="detail-row">
          <i class="fas fa-layer-group"></i>
          <span>Geração: {{ selectedPerson.generation }}</span>
        </div>

        <div class="detail-row">
          <i class="fas fa-bookmark"></i>
          <span>Período: {{ selectedPerson.block }}</span>
        </div>

        <div v-if="selectedPerson.father" class="detail-row">
          <i class="fas fa-male"></i>
          <span>Pai: {{ selectedPerson.father }}</span>
        </div>

        <div v-if="selectedPerson.reference" class="detail-row">
          <i class="fas fa-book-open"></i>
          <span>Referência: {{ selectedPerson.reference }}</span>
        </div>

        <div v-if="selectedPerson.notes" class="detail-row notes">
          <i class="fas fa-sticky-note"></i>
          <span>{{ selectedPerson.notes }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from "vue";
import { VueFlow, Background, Controls, Position } from "@vue-flow/core";
import type { Node, Edge } from "@vue-flow/core";
import PersonNode from "./PersonNode.vue";
import type { GenealogyData, Person } from "../../types/genealogy";

interface Props {
  genealogyData: GenealogyData;
}

const props = defineProps<Props>();

// Reactive state
const selectedPerson = ref<Person | null>(null);
const visibleBlocks = ref<string[]>([]);

// Compute available blocks
const availableBlocks = computed(() => {
  return props.genealogyData.blocks.map((block) => ({
    name: block.name,
    count: block.entries.length,
  }));
});

// Initially show all blocks
onMounted(() => {
  visibleBlocks.value = availableBlocks.value.map((block) => block.name);
});

// Generate nodes from genealogy data
const displayNodes = computed<Node[]>(() => {
  const nodes: Node[] = [];
  let yPosition = 0;

  props.genealogyData.blocks.forEach((block, blockIndex) => {
    // Skip if block is not visible
    if (!visibleBlocks.value.includes(block.name)) {
      return;
    }

    let xPosition = 0;
    const nodeWidth = 180;
    const nodeSpacing = 50;

    block.entries.forEach((person, personIndex) => {
      // Calculate position - layout in generations/rows
      const generation = person.generation || blockIndex + 1;
      const yOffset = generation * 120;
      const xOffset = personIndex * (nodeWidth + nodeSpacing);

      nodes.push({
        id: `${block.name}-${person.name}`.replace(/\s+/g, "-"),
        type: "person",
        position: {
          x: xOffset - (block.entries.length * (nodeWidth + nodeSpacing)) / 2,
          y: yPosition + yOffset,
        },
        data: {
          ...person,
          block: block.name,
        },
      });
    });

    yPosition +=
      (Math.max(...block.entries.map((p) => p.generation || 1)) + 1) * 120;
  });

  return nodes;
});

// Generate edges (connections between family members)
const displayEdges = computed<Edge[]>(() => {
  const edges: Edge[] = [];

  // Create a map of person names to node IDs for quick lookup
  const personToNodeId = new Map<string, string>();
  displayNodes.value.forEach((node) => {
    personToNodeId.set(node.data.name, node.id);
  });

  // Create edges based on father-child relationships
  displayNodes.value.forEach((node) => {
    const person = node.data;
    if (person.father) {
      const fatherNodeId = personToNodeId.get(person.father);
      if (fatherNodeId) {
        edges.push({
          id: `${fatherNodeId}->${node.id}`,
          source: fatherNodeId,
          target: node.id,
          type: "smoothstep",
          style: {
            stroke: getBlockColor(person.block),
            strokeWidth: 2,
          },
          animated: false,
        });
      }
    }
  });

  return edges;
});

// Block management functions
function toggleBlock(blockName: string) {
  const index = visibleBlocks.value.indexOf(blockName);
  if (index > -1) {
    visibleBlocks.value.splice(index, 1);
  } else {
    visibleBlocks.value.push(blockName);
  }
}

function getBlockIcon(blockName: string): string {
  const iconMap: Record<string, string> = {
    "Pré-Dilúvio (Adão a Noé)": "fas fa-seedling",
    "Pós-Dilúvio (Noé a Abraão)": "fas fa-ship",
    "Patriarcas (Abraão a Davi)": "fas fa-crown",
    "Reis (Davi ao Exílio)": "fas fa-chess-king",
    "Pós-Exílio (até Cristo)": "fas fa-star",
  };
  return iconMap[blockName] || "fas fa-users";
}

function getBlockColorClass(blockName: string): string {
  const colorMap: Record<string, string> = {
    "Pré-Dilúvio (Adão a Noé)": "pre-flood",
    "Pós-Dilúvio (Noé a Abraão)": "post-flood",
    "Patriarcas (Abraão a Davi)": "patriarchs",
    "Reis (Davi ao Exílio)": "kings",
    "Pós-Exílio (até Cristo)": "post-exile",
  };
  return colorMap[blockName] || "default";
}

function getBlockColor(blockName: string): string {
  const colorMap: Record<string, string> = {
    "Pré-Dilúvio (Adão a Noé)": "#22c55e",
    "Pós-Dilúvio (Noé a Abraão)": "#3b82f6",
    "Patriarcas (Abraão a Davi)": "#f59e0b",
    "Reis (Davi ao Exílio)": "#8b5cf6",
    "Pós-Exílio (até Cristo)": "#ef4444",
  };
  return colorMap[blockName] || "#64748b";
}

// Event handlers
function onNodeClick({ node }: { node: Node }) {
  selectedPerson.value = node.data as Person;
}
</script>

<style scoped>
.genealogy-tree-container {
  width: 100%;
  height: 800px;
  display: flex;
  flex-direction: column;
  background: #f8fafc;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.tree-header {
  padding: 1.5rem;
  background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
  color: white;
  text-align: center;
}

.tree-title {
  font-size: 1.5rem;
  font-weight: 600;
  margin: 0 0 0.5rem 0;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.tree-description {
  margin: 0;
  opacity: 0.9;
  font-size: 0.9rem;
}

.block-filters {
  padding: 1rem;
  background: white;
  border-bottom: 1px solid #e2e8f0;
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
  justify-content: center;
}

.filter-btn {
  padding: 0.5rem 1rem;
  border: 2px solid #e2e8f0;
  background: white;
  border-radius: 8px;
  cursor: pointer;
  font-size: 0.85rem;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  transition: all 0.2s ease;
}

.filter-btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.filter-btn--active {
  color: white;
}

.filter-btn--pre-flood.filter-btn--active {
  background: #22c55e;
  border-color: #22c55e;
}

.filter-btn--post-flood.filter-btn--active {
  background: #3b82f6;
  border-color: #3b82f6;
}

.filter-btn--patriarchs.filter-btn--active {
  background: #f59e0b;
  border-color: #f59e0b;
}

.filter-btn--kings.filter-btn--active {
  background: #8b5cf6;
  border-color: #8b5cf6;
}

.filter-btn--post-exile.filter-btn--active {
  background: #ef4444;
  border-color: #ef4444;
}

.block-count {
  font-size: 0.75rem;
  opacity: 0.8;
}

.vue-flow-wrapper {
  flex: 1;
  position: relative;
}

.genealogy-flow {
  width: 100%;
  height: 100%;
}

.person-details-panel {
  position: absolute;
  top: 100px;
  right: 20px;
  width: 300px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
  border: 1px solid #e2e8f0;
  z-index: 10;
}

.panel-header {
  padding: 1rem;
  background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
  color: white;
  border-radius: 12px 12px 0 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.panel-header h4 {
  margin: 0;
  font-size: 1.1rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  cursor: pointer;
  padding: 0.25rem;
  border-radius: 4px;
  transition: background 0.2s ease;
}

.close-btn:hover {
  background: rgba(255, 255, 255, 0.2);
}

.panel-content {
  padding: 1rem;
  max-height: 400px;
  overflow-y: auto;
}

.detail-row {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  margin-bottom: 0.75rem;
  font-size: 0.9rem;
  line-height: 1.4;
}

.detail-row i {
  color: #64748b;
  width: 16px;
  flex-shrink: 0;
  margin-top: 1px;
}

.detail-row.notes {
  flex-direction: column;
  gap: 0.5rem;
}

.detail-row.notes span {
  font-style: italic;
  color: #64748b;
  padding-left: 1.5rem;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
  .genealogy-tree-container {
    height: 600px;
  }

  .tree-header {
    padding: 1rem;
  }

  .tree-title {
    font-size: 1.2rem;
  }

  .block-filters {
    padding: 0.75rem;
  }

  .filter-btn {
    padding: 0.4rem 0.8rem;
    font-size: 0.8rem;
  }

  .person-details-panel {
    position: fixed;
    top: auto;
    bottom: 0;
    left: 0;
    right: 0;
    width: auto;
    border-radius: 12px 12px 0 0;
    max-height: 50vh;
  }
}
</style>
