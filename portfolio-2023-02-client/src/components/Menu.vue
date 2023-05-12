<template>
  <div class="flex z-20 justify-end" id="bg-menu">
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
#bg-menu {
  background-color: rgba(19,19,19,.15);
  backdrop-filter: blur(6px);
  opacity: 1;
}
</style>
