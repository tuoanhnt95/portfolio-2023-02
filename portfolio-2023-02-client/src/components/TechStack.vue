<template>
  <div class="font-mono flex flex-wrap">  
    <div class="flex m-2">
      Filter 
      <font-awesome-icon icon="fa-solid fa-filter" class="self-center ml-1" />
    </div>
    <div v-for="(status, i) in stackStatus" :key="i" class="flex">
      <div class="btn-stack hover-glow" :class="{ selected: status.select }" @click="filterStack(status)">
        {{ getStackNameByStatus(status) }}
      </div>
      <div v-if="[2,7].includes(i)" class="md:w-4"></div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, ref, defineEmits } from 'vue'
import stackData from '../stacks.json'

 const stackStatus = ref([
  //0 
  {id: 1, select: false}, 
  //1
  {id: 2, select: false}, 
  //2
  {id: 3, select: false},
  //3
  {id: 4, select: false},
  //4
  {id: 5, select: false},
  //5
  {id: 6, select: false},
  //6
  {id: 7, select: false},
  //7
  {id: 8, select: false},
  //8
  {id: 9, select: false},
  //9
  {id: 10, select: false},
  //10
  {id: 11, select: false}
 ])

const filteredStackIds = computed(() => {
  return stackStatus.value.filter(stack => stack.select).map(stack => stack.id)
})

const emit = defineEmits(['filter-stack'])

function filterStack (status: any) {
  toggleFilter(status)
  emit('filter-stack', filteredStackIds.value)
}

function toggleFilter(status: any) {
  status.select = !status.select
  console.log(status)
}

function getStackNameByStatus(status: any) {
  const stack = stackData.find(stack => stack.id === status.id)
  if (!stack) return ''
  return stack.displayName ? stack.displayName : stack.name
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