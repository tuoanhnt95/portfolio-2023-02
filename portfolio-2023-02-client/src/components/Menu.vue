<template>
  <div class="flex fixed top-1 right-2 border border-indigo-500 z-40">
    <div v-for="(item, i) in menuItems" :key="i" class="m-2">
      {{ item.name }}
    </div>
  </div>
</template>

<script setup lang="ts">
const menuItems = [
  { name: "About me", link: "link" },
  { name: "Projects", link: "link" },
  { name: "Contact", link: "link" },
]
</script>

<style scoped>
</style>
