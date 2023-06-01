<template>
  <div class="font-mono flex flex-wrap">  
    <div class="flex m-2">
      Filter 
      <font-awesome-icon icon="fa-solid fa-filter" class="self-center ml-1" />
    </div>
    <div v-for="(stack, i) in stacks" :key="i" class="flex">
      <div class="btn-stack hover-glow" :class="{ selected: stack.select }" @click="filterStack(stack)">
        {{ stack.name }}
      </div>
      <div v-if="[2,7].includes(i)" class="md:w-4"></div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { defineEmits } from 'vue'

 const stacks = ref([
  //0 
  {name: 'ruby on rails', select: false}, 
  //1
  {name: 'python', select: false}, 
  //2
  {name: 'c#', select: false},
  //3
  {name: 'javascript', select: false},
  //4
  {name: 'typescript', select: false},
  //5
  {name: 'vue.js', select: false},
  //6
  {name: 'bootstrap', select: false},
  //7
  {name: 'tailwind', select: false},
  //8
  {name: 'SQLServer', select: false},
  //9
  {name: 'PostgreSQL', select: false},
  //10
  {name: 'SQLite', select: false}
 ])

const filteredStackIndexes = computed(() => {
  return stacks.value.filter(stack => stack.select).map(stack => stacks.value.indexOf(stack))
})

const emit = defineEmits(['filter-stack'])

function filterStack (stack: any) {
  toggleFilter(stack)
  emit('filter-stack', filteredStackIndexes.value)
}

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