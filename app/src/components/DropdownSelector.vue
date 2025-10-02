<template>
  <div class="dropdown-container">
    <!-- Version Selector -->
    <div class="dropdown-group">
      <label for="version-select">
        <i class="fas fa-bible"></i>
        Versão Bíblica
      </label>
      <div class="custom-select" :class="{ 'is-open': isVersionOpen }">
        <button
          class="select-trigger"
          @click="toggleVersion"
          type="button"
          aria-haspopup="listbox"
          :aria-expanded="isVersionOpen"
        >
          <span class="selected-value">{{ selectedVersion.label }}</span>
          <i
            class="fas fa-chevron-down"
            :class="{ rotated: isVersionOpen }"
          ></i>
        </button>

        <div class="select-options" v-show="isVersionOpen">
          <button
            v-for="version in versions"
            :key="version.value"
            @click="selectVersion(version)"
            class="select-option"
            :class="{ selected: selectedVersion.value === version.value }"
            type="button"
          >
            <span class="option-label">{{ version.label }}</span>
            <span class="option-description">{{ version.description }}</span>
          </button>
        </div>
      </div>
    </div>

    <!-- Language Selector -->
    <div class="dropdown-group">
      <label for="language-select">
        <i class="fas fa-globe"></i>
        Idioma
      </label>
      <div class="custom-select" :class="{ 'is-open': isLanguageOpen }">
        <button
          class="select-trigger"
          @click="toggleLanguage"
          type="button"
          aria-haspopup="listbox"
          :aria-expanded="isLanguageOpen"
        >
          <span class="selected-value">{{ selectedLanguage.label }}</span>
          <i
            class="fas fa-chevron-down"
            :class="{ rotated: isLanguageOpen }"
          ></i>
        </button>

        <div class="select-options" v-show="isLanguageOpen">
          <button
            v-for="language in languages"
            :key="language.value"
            @click="selectLanguage(language)"
            class="select-option"
            :class="{ selected: selectedLanguage.value === language.value }"
            type="button"
          >
            <span class="option-flag">{{ language.flag }}</span>
            <span class="option-label">{{ language.label }}</span>
          </button>
        </div>
      </div>
    </div>

    <!-- Block Selector -->
    <div class="dropdown-group">
      <label for="block-select">
        <i class="fas fa-layer-group"></i>
        Bloco Genealógico
      </label>
      <div class="custom-select" :class="{ 'is-open': isBlockOpen }">
        <button
          class="select-trigger"
          @click="toggleBlock"
          type="button"
          aria-haspopup="listbox"
          :aria-expanded="isBlockOpen"
        >
          <span class="selected-value">{{ selectedBlock.label }}</span>
          <i class="fas fa-chevron-down" :class="{ rotated: isBlockOpen }"></i>
        </button>

        <div class="select-options" v-show="isBlockOpen">
          <button
            v-for="block in blocks"
            :key="block.value"
            @click="selectBlock(block)"
            class="select-option"
            :class="{ selected: selectedBlock.value === block.value }"
            type="button"
          >
            <span class="option-icon">{{ block.icon }}</span>
            <div class="option-content">
              <span class="option-label">{{ block.label }}</span>
              <span class="option-description"
                >{{ block.generations }} gerações</span
              >
            </div>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref, onMounted, onUnmounted } from "vue";

export default defineComponent({
  name: "DropdownSelector",
  emits: ["version-change", "language-change", "block-change"],
  setup(_, { emit }) {
    // Reactive state
    const isVersionOpen = ref(false);
    const isLanguageOpen = ref(false);
    const isBlockOpen = ref(false);

    // Selected values
    const selectedVersion = ref({
      value: "nvt",
      label: "NVT",
      description: "Nova Versão Transformadora",
    });
    const selectedLanguage = ref({
      value: "pt-BR",
      label: "Português (Brasil)",
      flag: "🇧🇷",
    });
    const selectedBlock = ref({
      value: "all",
      label: "Todos os Blocos",
      icon: "📖",
      generations: 62,
    });

    // Options data
    const versions = ref([
      {
        value: "nvt",
        label: "NVT",
        description: "Nova Versão Transformadora",
      },
      {
        value: "arc",
        label: "ARC",
        description: "Almeida Revista e Corrigida",
      },
      {
        value: "nvi",
        label: "NVI",
        description: "Nova Versão Internacional",
      },
      {
        value: "acf",
        label: "ACF",
        description: "Almeida Corrigida Fiel",
      },
    ]);

    const languages = ref([
      { value: "pt-BR", label: "Português (Brasil)", flag: "🇧🇷" },
      { value: "en-US", label: "English (US)", flag: "🇺🇸" },
      { value: "es-ES", label: "Español", flag: "🇪🇸" },
      { value: "he-IL", label: "עברית (Hebrew)", flag: "🇮🇱" },
    ]);

    const blocks = ref([
      {
        value: "all",
        label: "Todos os Blocos",
        icon: "📖",
        generations: 62,
      },
      {
        value: "pre-flood",
        label: "Pré-Dilúvio",
        icon: "🌱",
        generations: 10,
      },
      {
        value: "post-flood",
        label: "Pós-Dilúvio",
        icon: "🕊️",
        generations: 10,
      },
      {
        value: "patriarchs",
        label: "Patriarcas",
        icon: "👑",
        generations: 21,
      },
      {
        value: "royal",
        label: "Linhagem Real",
        icon: "👑",
        generations: 21,
      },
    ]);

    // Toggle functions
    const toggleVersion = () => {
      isVersionOpen.value = !isVersionOpen.value;
      isLanguageOpen.value = false;
      isBlockOpen.value = false;
    };

    const toggleLanguage = () => {
      isLanguageOpen.value = !isLanguageOpen.value;
      isVersionOpen.value = false;
      isBlockOpen.value = false;
    };

    const toggleBlock = () => {
      isBlockOpen.value = !isBlockOpen.value;
      isVersionOpen.value = false;
      isLanguageOpen.value = false;
    };

    // Selection functions
    const selectVersion = (version) => {
      selectedVersion.value = version;
      isVersionOpen.value = false;
      emit("version-change", version);
    };

    const selectLanguage = (language) => {
      selectedLanguage.value = language;
      isLanguageOpen.value = false;
      emit("language-change", language);
    };

    const selectBlock = (block) => {
      selectedBlock.value = block;
      isBlockOpen.value = false;
      emit("block-change", block);
    };

    // Close dropdowns when clicking outside
    const closeDropdowns = () => {
      isVersionOpen.value = false;
      isLanguageOpen.value = false;
      isBlockOpen.value = false;
    };

    const handleClickOutside = (event) => {
      if (!event.target.closest(".dropdown-container")) {
        closeDropdowns();
      }
    };

    onMounted(() => {
      document.addEventListener("click", handleClickOutside);
    });

    onUnmounted(() => {
      document.removeEventListener("click", handleClickOutside);
    });

    return {
      // State
      isVersionOpen,
      isLanguageOpen,
      isBlockOpen,
      selectedVersion,
      selectedLanguage,
      selectedBlock,
      // Data
      versions,
      languages,
      blocks,
      // Methods
      toggleVersion,
      toggleLanguage,
      toggleBlock,
      selectVersion,
      selectLanguage,
      selectBlock,
    };
  },
});
</script>

<style scoped>
.dropdown-container {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
  align-items: flex-end;
  margin-bottom: 1.5rem;
  padding: 1rem;
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  border-radius: 12px;
  border: 1px solid #dee2e6;
}

.dropdown-group {
  min-width: 200px;
  flex: 1;
}

.dropdown-group label {
  display: block;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: #495057;
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.dropdown-group label i {
  margin-right: 0.5rem;
  color: #8b4513;
}

.custom-select {
  position: relative;
  width: 100%;
}

.select-trigger {
  width: 100%;
  padding: 0.75rem 1rem;
  background: white;
  border: 2px solid #e9ecef;
  border-radius: 8px;
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  align-items: center;
  transition: all 0.3s ease;
  font-size: 0.9rem;
  font-weight: 500;
}

.select-trigger:hover {
  border-color: #8b4513;
  box-shadow: 0 2px 8px rgba(139, 69, 19, 0.1);
}

.custom-select.is-open .select-trigger {
  border-color: #8b4513;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  box-shadow: 0 2px 8px rgba(139, 69, 19, 0.15);
}

.selected-value {
  flex: 1;
  text-align: left;
}

.select-trigger i {
  transition: transform 0.3s ease;
  color: #8b4513;
}

.select-trigger i.rotated {
  transform: rotate(180deg);
}

.select-options {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: white;
  border: 2px solid #8b4513;
  border-top: none;
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
  z-index: 1000;
  max-height: 300px;
  overflow-y: auto;
  box-shadow: 0 4px 16px rgba(139, 69, 19, 0.2);
}

.select-option {
  width: 100%;
  padding: 0.75rem 1rem;
  border: none;
  background: white;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  transition: all 0.2s ease;
  font-size: 0.9rem;
}

.select-option:hover {
  background: #f8f9fa;
  color: #8b4513;
}

.select-option.selected {
  background: #8b4513;
  color: white;
}

.select-option.selected:hover {
  background: #7a3f12;
}

.option-content {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  flex: 1;
}

.option-label {
  font-weight: 600;
}

.option-description {
  font-size: 0.8rem;
  opacity: 0.8;
}

.option-flag {
  font-size: 1.2rem;
}

.option-icon {
  font-size: 1.1rem;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
  .dropdown-container {
    flex-direction: column;
    gap: 1rem;
  }

  .dropdown-group {
    min-width: auto;
    width: 100%;
  }
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
  .dropdown-container {
    background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
    border-color: #4a5568;
  }

  .dropdown-group label {
    color: #e2e8f0;
  }

  .select-trigger {
    background: #2d3748;
    border-color: #4a5568;
    color: #e2e8f0;
  }

  .select-options {
    background: #2d3748;
    border-color: #8b4513;
  }

  .select-option {
    background: #2d3748;
    color: #e2e8f0;
  }

  .select-option:hover {
    background: #4a5568;
  }
}
</style>
