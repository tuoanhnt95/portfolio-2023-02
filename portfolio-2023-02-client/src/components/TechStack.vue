<template>
<div class="font-mono mx-2 flex flex-wrap">  
  <div class="flex m-2">
    Filter 
    <font-awesome-icon icon="fa-solid fa-filter" class="self-center ml-1" />
  </div>
  <!-- <div class="flex"> backend -->
    <div v-for="(stack, i) in backend" :key="i" class="btn-stack hover-glow" :class="{ selected: stack.select }" @click="toggleFilter(stack)">
      {{ stack.name }}
    </div>
    <div class="w-4"></div>
  <!-- </div> -->
  <!-- <div class="flex"> frontend -->
    <div v-for="(stack, i) in frontend" :key="i" class="btn-stack hover-glow" :class="{ selected: stack.select }" @click="toggleFilter(stack)">
      {{ stack.name }}
    </div>
    <div class="w-4"></div>
  <!-- </div> -->
  <!-- <div class="flex"> frontend -->
    <div v-for="(stack, i) in database" :key="i" class="btn-stack hover-glow" :class="{ selected: stack.select }" @click="toggleFilter(stack)">
      {{ stack.name }}
    </div>
  <!-- </div> -->
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const backend = ref([
  {name: 'ruby on rails', select: false},
  {name: 'python', select: false},
  {name: 'c#', select: false}
])

const frontend = ref([
  {name: 'javascript', select: false},
  {name: 'typescript', select: false},
  {name: 'vue.js', select: false},
  {name: 'bootstrap', select: false},
  {name: 'tailwind', select: false}
])

const database = ref([
  {name: 'SQLServer', select: false},
  {name: 'PostgreSQL', select: false},
  {name: 'SQLite', select: false}
])

function toggleFilter(stack: any) {
  stack.select = !stack.select
  console.log(stack)
}
</script>

<style scoped>
@import '../assets/main.css';

.btn-stack {
  display: flex;
  justify-content: center;
  margin: 0.125rem;
  padding: 0.5rem;
  font-size: 0.75rem; /* 12px */
  line-height: 1rem; /* 16px */
  border: 1px solid var(--primary);
  border-radius: 0.1rem;
}

.hover-glow:hover {
  outline: 1px solid var(--primary);
  border-radius: 1px;
  -webkit-transition: 0.2s;
  transition: 0.2s;
}

.selected {
  background-color: var(--primary-6);
  color: black;
}
</style>