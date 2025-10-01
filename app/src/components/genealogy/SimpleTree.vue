<template>
  <div class="simple-genealogy-tree">
    <!-- Tree Controls -->
    <div class="tree-controls">
      <h3 class="tree-title">
        <i class="fas fa-sitemap"></i>
        Árvore Genealógica Simplificada
      </h3>

      <!-- Block Filter Buttons -->
      <div class="block-filters">
        <button
          v-for="(block, index) in genealogyData.blocks"
          :key="index"
          @click="toggleBlock(block.name)"
          :class="{
            'filter-btn': true,
            'filter-btn--active': visibleBlocks.includes(block.name),
            [`filter-btn--${getBlockColorClass(block.name)}`]: true,
          }"
        >
          <i :class="getBlockIcon(block.name)"></i>
          {{ block.name.split(":")[0] }}
          <span class="block-count">({{ block.entries.length }})</span>
        </button>
      </div>
    </div>

    <!-- Tree Content -->
    <div class="tree-content">
      <div
        v-for="(block, blockIndex) in filteredBlocks"
        :key="blockIndex"
        class="genealogy-block"
        :class="`genealogy-block--${getBlockColorClass(block.name)}`"
      >
        <div class="block-header">
          <h4 class="block-title">
            <i :class="getBlockIcon(block.name)"></i>
            {{ block.name }}
          </h4>
          <span class="block-stats">
            {{ block.generations }} gerações •
            {{ block.entries.length }} pessoas
          </span>
        </div>

        <div class="persons-grid">
          <div
            v-for="(person, personIndex) in block.entries.slice(
              0,
              showAllPeople[block.name] ? block.entries.length : 8
            )"
            :key="personIndex"
            class="person-card"
            @click="selectPerson(person, block.name)"
            :class="{
              'person-card--selected': selectedPerson?.name === person.name,
            }"
          >
            <div class="person-avatar">
              <i class="fas fa-user"></i>
            </div>
            <div class="person-info">
              <h5 class="person-name">{{ person.name }}</h5>
              <div class="person-details">
                <span v-if="person.father" class="person-father">
                  <i class="fas fa-male"></i>
                  Pai: {{ person.father }}
                </span>
                <span v-if="person.verse" class="person-verse">
                  <i class="fas fa-book-open"></i>
                  {{ person.verse }}
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Show More Button -->
        <button
          v-if="block.entries.length > 8"
          @click="toggleShowAll(block.name)"
          class="show-more-btn"
        >
          <i
            :class="
              showAllPeople[block.name]
                ? 'fas fa-chevron-up'
                : 'fas fa-chevron-down'
            "
          ></i>
          {{
            showAllPeople[block.name]
              ? "Mostrar Menos"
              : `Mostrar Todas (${block.entries.length})`
          }}
        </button>
      </div>
    </div>

    <!-- Person Details Modal -->
    <div v-if="selectedPerson" class="person-modal-overlay" @click="closeModal">
      <div class="person-modal" @click.stop>
        <div class="modal-header">
          <h4>
            <i class="fas fa-user"></i>
            {{ selectedPerson.name }}
          </h4>
          <button @click="closeModal" class="close-btn">
            <i class="fas fa-times"></i>
          </button>
        </div>

        <div class="modal-content">
          <div class="detail-row">
            <i class="fas fa-bookmark"></i>
            <span>Período: {{ selectedBlock }}</span>
          </div>

          <div v-if="selectedPerson.father" class="detail-row">
            <i class="fas fa-male"></i>
            <span>Pai: {{ selectedPerson.father }}</span>
          </div>

          <div v-if="selectedPerson.mother" class="detail-row">
            <i class="fas fa-female"></i>
            <span>Mãe: {{ selectedPerson.mother }}</span>
          </div>

          <div v-if="selectedPerson.verse" class="detail-row">
            <i class="fas fa-book-open"></i>
            <span>Referência: {{ selectedPerson.verse }}</span>
          </div>

          <div v-if="selectedPerson.age_at_son" class="detail-row">
            <i class="fas fa-calendar-alt"></i>
            <span
              >Idade ao gerar filho: {{ selectedPerson.age_at_son }} anos</span
            >
          </div>

          <div v-if="selectedPerson.years_after" class="detail-row">
            <i class="fas fa-clock"></i>
            <span
              >Anos vividos depois: {{ selectedPerson.years_after }} anos</span
            >
          </div>

          <div v-if="selectedPerson.total" class="detail-row">
            <i class="fas fa-hourglass-end"></i>
            <span>Total de vida: {{ selectedPerson.total }} anos</span>
          </div>

          <div v-if="selectedPerson.notes" class="detail-row notes">
            <i class="fas fa-sticky-note"></i>
            <span>{{ selectedPerson.notes }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";

const props = defineProps(["genealogyData"]);

// Reactive state
const selectedPerson = ref(null);
const selectedBlock = ref("");
const visibleBlocks = ref([]);
const showAllPeople = ref({});

// Initialize visible blocks and show all states
onMounted(() => {
  if (props.genealogyData?.blocks) {
    visibleBlocks.value = props.genealogyData.blocks.map((block) => block.name);

    // Initialize showAllPeople state
    props.genealogyData.blocks.forEach((block) => {
      showAllPeople.value[block.name] = false;
    });
  }
});

// Computed filtered blocks
const filteredBlocks = computed(() => {
  if (!props.genealogyData?.blocks) return [];
  return props.genealogyData.blocks.filter((block) =>
    visibleBlocks.value.includes(block.name)
  );
});

// Methods
function toggleBlock(blockName) {
  const index = visibleBlocks.value.indexOf(blockName);
  if (index > -1) {
    visibleBlocks.value.splice(index, 1);
  } else {
    visibleBlocks.value.push(blockName);
  }
}

function toggleShowAll(blockName) {
  showAllPeople.value[blockName] = !showAllPeople.value[blockName];
}

function selectPerson(person, blockName) {
  selectedPerson.value = person;
  selectedBlock.value = blockName;
}

function closeModal() {
  selectedPerson.value = null;
  selectedBlock.value = "";
}

function getBlockIcon(blockName) {
  const iconMap = {
    "Pré-Dilúvio (Adão a Noé)": "fas fa-seedling",
    "Pós-Dilúvio (Noé a Abraão)": "fas fa-ship",
    "Patriarcas (Abraão a Davi)": "fas fa-crown",
    "Reis (Davi ao Exílio)": "fas fa-chess-king",
    "Pós-Exílio (até Cristo)": "fas fa-star",
  };

  for (const key in iconMap) {
    if (blockName.includes(key.split(" ")[0]) || blockName.includes(key)) {
      return iconMap[key];
    }
  }
  return "fas fa-users";
}

function getBlockColorClass(blockName) {
  if (blockName.includes("Pré-Dilúvio")) return "pre-flood";
  if (blockName.includes("Pós-Dilúvio")) return "post-flood";
  if (blockName.includes("Abraão")) return "patriarchs";
  if (blockName.includes("Davi")) return "kings";
  if (blockName.includes("Exílio") || blockName.includes("Cristo"))
    return "post-exile";
  return "default";
}
</script>

<style scoped>
.simple-genealogy-tree {
  width: 100%;
  background: #f8fafc;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.tree-controls {
  padding: 1.5rem;
  background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
  color: white;
}

.tree-title {
  font-size: 1.5rem;
  font-weight: 600;
  margin: 0 0 1rem 0;
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.block-filters {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.filter-btn {
  padding: 0.5rem 1rem;
  border: 2px solid rgba(255, 255, 255, 0.3);
  background: rgba(255, 255, 255, 0.1);
  color: white;
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
  background: rgba(255, 255, 255, 0.2);
}

.filter-btn--active {
  background: white;
  color: #1e293b;
  border-color: white;
}

.block-count {
  font-size: 0.75rem;
  opacity: 0.8;
}

.tree-content {
  padding: 2rem;
  display: flex;
  flex-direction: column;
  gap: 3rem;
}

.genealogy-block {
  background: white;
  border-radius: 12px;
  padding: 1.5rem;
  border-left: 4px solid #e2e8f0;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.genealogy-block--pre-flood {
  border-left-color: #22c55e;
}

.genealogy-block--post-flood {
  border-left-color: #3b82f6;
}

.genealogy-block--patriarchs {
  border-left-color: #f59e0b;
}

.genealogy-block--kings {
  border-left-color: #8b5cf6;
}

.genealogy-block--post-exile {
  border-left-color: #ef4444;
}

.block-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
  flex-wrap: wrap;
  gap: 1rem;
}

.block-title {
  font-size: 1.3rem;
  font-weight: 600;
  margin: 0;
  color: #1e293b;
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.block-stats {
  color: #64748b;
  font-size: 0.9rem;
}

.persons-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 1rem;
  margin-bottom: 1rem;
}

.person-card {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  padding: 1rem;
  cursor: pointer;
  transition: all 0.2s ease;
  display: flex;
  align-items: flex-start;
  gap: 1rem;
}

.person-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  border-color: #cbd5e1;
}

.person-card--selected {
  background: #eff6ff;
  border-color: #3b82f6;
}

.person-avatar {
  width: 40px;
  height: 40px;
  background: #e2e8f0;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.person-avatar i {
  color: #64748b;
  font-size: 1.2rem;
}

.person-info {
  flex: 1;
  min-width: 0;
}

.person-name {
  font-size: 1rem;
  font-weight: 600;
  margin: 0 0 0.5rem 0;
  color: #1e293b;
}

.person-details {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.person-father,
.person-verse {
  font-size: 0.8rem;
  color: #64748b;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.show-more-btn {
  width: 100%;
  padding: 0.75rem;
  background: #f1f5f9;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  cursor: pointer;
  font-size: 0.9rem;
  color: #64748b;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  transition: all 0.2s ease;
}

.show-more-btn:hover {
  background: #e2e8f0;
  color: #475569;
}

/* Modal styles */
.person-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 1rem;
}

.person-modal {
  background: white;
  border-radius: 12px;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
  max-width: 500px;
  width: 100%;
  max-height: 90vh;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.modal-header {
  padding: 1.5rem;
  background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.modal-header h4 {
  margin: 0;
  font-size: 1.2rem;
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  cursor: pointer;
  padding: 0.5rem;
  border-radius: 4px;
  transition: background 0.2s ease;
  font-size: 1.1rem;
}

.close-btn:hover {
  background: rgba(255, 255, 255, 0.2);
}

.modal-content {
  padding: 1.5rem;
  overflow-y: auto;
  flex: 1;
}

.detail-row {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
  margin-bottom: 1rem;
  font-size: 0.95rem;
  line-height: 1.5;
}

.detail-row i {
  color: #64748b;
  width: 20px;
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
  padding-left: 2rem;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
  .tree-controls {
    padding: 1rem;
  }

  .tree-title {
    font-size: 1.2rem;
  }

  .tree-content {
    padding: 1rem;
  }

  .persons-grid {
    grid-template-columns: 1fr;
  }

  .block-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }

  .person-modal {
    margin: 0;
    border-radius: 12px 12px 0 0;
    max-height: 80vh;
  }

  .person-modal-overlay {
    align-items: flex-end;
    padding: 0;
  }
}
</style>
