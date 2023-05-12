<template>
  <div class="bg-black text-yellow-500 w-screen border border-indigo-500">
    <Menu class="fixed z-20 w-screen"/>

    <header id="banner">
      <div class="banner-gradient" :class="{ 'banner-opacity': contactFormIsShown }">
        <img id="img-banner" alt="Oanh's sideface photo with sparkly eyes" loading="lazy" src="src/assets/images/sideface.JPG" :class="{ 'banner-zoom': contactFormIsShown }"/>
      </div>
      <div class="absolute h-full top-1/4 left-1/2 border border-indigo-500" :class="{ 'content-fade': contactFormIsShown }">
        <p class="text-2xl font-black">Oanh</p>
        <p class="tablet-potrt-up:text-slate-200">Full-stack developer with an insatiable eye for new projects</p>
        <button class="border border-yellow-400 mt-2" @click="toggleContactForm()">Contact me!</button>
      </div>

      <ContactForm v-if="contactFormIsShown" @toggle-form="toggleContactForm()"/>
    </header>
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
#banner {
  height: 50vh;
  overflow: hidden;

  /* margin-top: -82px; */
  /* @media screen {

  } */

}

.banner-gradient {
  display: inline-block;
  background-color: black;
}

#img-banner {
  top: 0px;
  left: 0px;
  opacity: 0.55;
}

.wrapper {
  padding-top: 104px;
  margin: 0 auto;
  width: 100%;
  max-width: 64rem;
  text-align: right;
  position: relative;
}

/* h1 {
  text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
  font-size: 7.5em;
  font-weight: bold;
}

h2 {
  font-size: 1.5em;
  opacity: .9;
  text-shadow: 1px 1px 3px rgba(0,0,0,0.9);
  margin-top: 8px;
} */

.banner-zoom {
  transition: all 2.5s ease-in-out;
  transform: perspective(500px) translateZ(450px) translateY(10%) translateX(16%);
}

.banner-opacity {
  transition: opacity 2.5s;
  background-color: black;
  opacity: 0.1;
}

.content-fade h1, h2{
  transition: opacity 1s ease-in-out;
  opacity: 0;
}
</style>
