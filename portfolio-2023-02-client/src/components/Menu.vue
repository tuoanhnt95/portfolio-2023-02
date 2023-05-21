<template>
  <div class="flex justify-end z-20 xs:text-lg bg-transparent-top-layer">
    <button v-for="(item, i) in menuItems" :key="i" class="mx-3 my-2">
      {{ item.name }}
    </button>
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
@import '../assets/main.css'


</style>
