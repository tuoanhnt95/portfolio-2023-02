<template>
  <div class="flex justify-end z-20 xs:text-lg" id="bg-menu">
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
#bg-menu {
  background-color: rgba(19,19,19,.15);
  backdrop-filter: blur(6px);
  opacity: 1;
}
</style>
