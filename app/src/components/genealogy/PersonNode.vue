<template>
  <div class="person-node" :class="`person-node--${blockColor}`">
    <Handle type="target" :position="Position.Top" class="person-handle" />

    <!-- Person Icon -->
    <div class="person-avatar">
      <i class="fas fa-user" aria-hidden="true"></i>
    </div>

    <!-- Person Info -->
    <div class="person-info">
      <h4 class="person-name">{{ data.name }}</h4>
      <div class="person-details">
        <span v-if="data.lifespan" class="person-lifespan">
          <i class="fas fa-calendar-alt"></i>
          {{ data.lifespan }}
        </span>
        <span v-if="data.generation" class="person-generation">
          <i class="fas fa-layer-group"></i>
          Gen. {{ data.generation }}
        </span>
      </div>
    </div>

    <Handle type="source" :position="Position.Bottom" class="person-handle" />
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { Handle, Position } from "@vue-flow/core";
import type { NodeProps } from "@vue-flow/core";

interface PersonData {
  name: string;
  lifespan?: string;
  generation?: number;
  block: string;
  father?: string;
  mother?: string;
  reference?: string;
  notes?: string;
}

const props = defineProps<NodeProps<PersonData>>();

// Map block names to color themes
const blockColors = {
  "Pré-Dilúvio (Adão a Noé)": "pre-flood",
  "Pós-Dilúvio (Noé a Abraão)": "post-flood",
  "Patriarcas (Abraão a Davi)": "patriarchs",
  "Reis (Davi ao Exílio)": "kings",
  "Pós-Exílio (até Cristo)": "post-exile",
};

const blockColor = computed(() => {
  return blockColors[props.data.block as keyof typeof blockColors] || "default";
});
</script>

<style scoped>
.person-node {
  background: white;
  border: 2px solid #e2e8f0;
  border-radius: 12px;
  padding: 12px;
  min-width: 160px;
  max-width: 200px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.2s ease;
  position: relative;
}

.person-node:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.person-handle {
  width: 8px;
  height: 8px;
  border: 2px solid #64748b;
  background: white;
}

/* Block color themes */
.person-node--pre-flood {
  border-color: #22c55e;
  background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
}

.person-node--pre-flood .person-handle {
  border-color: #22c55e;
}

.person-node--post-flood {
  border-color: #3b82f6;
  background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
}

.person-node--post-flood .person-handle {
  border-color: #3b82f6;
}

.person-node--patriarchs {
  border-color: #f59e0b;
  background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
}

.person-node--patriarchs .person-handle {
  border-color: #f59e0b;
}

.person-node--kings {
  border-color: #8b5cf6;
  background: linear-gradient(135deg, #faf5ff 0%, #f3e8ff 100%);
}

.person-node--kings .person-handle {
  border-color: #8b5cf6;
}

.person-node--post-exile {
  border-color: #ef4444;
  background: linear-gradient(135deg, #fef2f2 0%, #fecaca 100%);
}

.person-node--post-exile .person-handle {
  border-color: #ef4444;
}

.person-avatar {
  text-align: center;
  margin-bottom: 8px;
}

.person-avatar i {
  font-size: 1.5rem;
  color: #64748b;
}

.person-info {
  text-align: center;
}

.person-name {
  font-size: 0.9rem;
  font-weight: 600;
  color: #1e293b;
  margin: 0 0 6px 0;
  line-height: 1.2;
}

.person-details {
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.person-lifespan,
.person-generation {
  font-size: 0.7rem;
  color: #64748b;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
}

.person-lifespan i,
.person-generation i {
  font-size: 0.6rem;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .person-node {
    min-width: 120px;
    max-width: 150px;
    padding: 8px;
  }

  .person-name {
    font-size: 0.8rem;
  }

  .person-lifespan,
  .person-generation {
    font-size: 0.65rem;
  }
}
</style>
