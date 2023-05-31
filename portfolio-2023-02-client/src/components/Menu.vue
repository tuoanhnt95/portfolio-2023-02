<template>
  <div class="flex justify-end z-10 xs:text-lg bg-transparent-top-layer">
    <div class="mr-3">
      <button v-for="(item, i) in menuItems" :key="i" class="mx-3 xs:mx-4 lg:mx-5 my-2 xs:my-3 lg:my-4 hover-glow">
        {{ item.name }}
      </button>
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
