<template>
<div class="font-mono">
    <div class="flex"> <!-- backend -->
      <div v-for="(stack, i) in backend" :key="i" class="rounded m-0.5 p-2 flex justify-center text-xs font-medium">
        {{ stack.name }}
      </div>
    </div>
    <div class="flex"> <!-- frontend -->
      <div v-for="(stack, i) in frontend" :key="i" class="rounded m-0.5 p-2 flex justify-center text-xs font-medium">
        {{ stack.name }}
      </div>
    </div>
    <div class="flex"> <!-- frontend -->
      <div v-for="(stack, i) in database" :key="i" class="rounded m-0.5 p-2 flex justify-center text-xs font-medium">
        {{ stack.name }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const backend = [
  {name: 'ruby on rails'},
  {name: 'python'},
  {name: 'c#'}
]
const frontend = [
  {name: 'javascript'},
  {name: 'typescript'},
  {name: 'vue.js'},
  {name: 'bootstrap'},
  {name: 'tailwind'},
]
const database = [
  {name: 'SQLServer'},
  {name: 'PostgreSQL'},
  {name: 'SQLite'},
]
</script>

<style scoped>

</style>