<template>
  <div class="bg-black text-yellow-500">
    <Menu />
    <header class="border border-indigo-500 h-64">
      <!-- <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" /> -->
      <div id="img-banner" class="bg-[url('src/assets/images/sideface.JPG')] bg-cover bg-center flex justify-end m-0 pr-2">
        <div class="absolute mt-16 border border-indigo-500">
          <p class="text-2xl font-black">Oanh</p>
          <p>Full-stack developer</p>
          <button class="border border-yellow-400" @click="toggleContactForm()">Hire me!</button>
        </div>
      </div>
    </header>
    <ContactForm v-if="contactFormIsShown" @toggle-form="toggleContactForm()"/>
    <TechStack />
    <Projects />
    <Footer />
  </div>
</template>

<script setup lang="ts">
// import { RouterLink, RouterView } from 'vue-router'
import { ref } from 'vue'
import Menu from './components/Menu.vue'
import TechStack from './components/TechStack.vue'
import ContactForm from './components/ContactForm.vue'
import Projects from './components/Projects.vue'
import Footer from './components/Footer.vue'

let contactFormIsShown = ref(false);
const toggleContactForm = () => {
  contactFormIsShown.value = !contactFormIsShown.value;
  console.log(contactFormIsShown.value);
}

</script>

<style scoped>


#img-banner {
  height: 100%;
  background-size: cover;
  background-position: center;
}
</style>
