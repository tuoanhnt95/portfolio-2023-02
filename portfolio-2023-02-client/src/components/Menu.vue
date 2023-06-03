<template>
  <div class="z-10 h-12 pr-2 md:pr-4 lg:pr-8 xs:text-lg bg-transparent-top-layer">
    <div class="flex justify-end pt-3">
      <div v-for="(item, i) in menuItems" :key="i" class="flex justify-center xs:w-24 md:w-28 px-2">
        <button class="hover-glow font-sans">
          {{ item.name }}
        </button>
      </div>
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
@import '../assets/main.css'


</style>
