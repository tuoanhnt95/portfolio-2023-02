<template>
  <div class="w-screen bg-black text-yellow-500 overflow-x-hidden">
    <Menu class="fixed z-20 w-screen text-base font-lato tracking-wider"/>

    <header class="h-[55vh] overflow-hidden">
      <div :class="{ 'banner-opacity-out': contactFormIsShown, 'banner-opacity-in': !contactFormIsShown && isNotJustReloaded }" class="h-full">
        <img alt="Oanh's sideface photo with sparkly eyes" loading="lazy" src="/src/assets/images/sideface.jpg" :class="{ 'banner-zoom-out': contactFormIsShown, 'banner-zoom-in': !contactFormIsShown && isNotJustReloaded }" class="img-banner ml-[-25%] xs:ml-0 object-cover min-w-[125%] xs:min-w-full h-full opacity-50"/>
      </div>
      <div class="absolute top-1/4 left-1/4 xs:left-[45%] sm:left-1/2" :class="{ 'content-fade': contactFormIsShown, 'content-fade-in': !contactFormIsShown && isNotJustReloaded }
      ">
        <p class="text-8xl md:text-9xl tracking-wide font-playfair-bold">Oanh</p>
        <div class="mx-4 xs:mx-2 my-2 text-base xs:text-lg sm:text-xl drop-shadow-lg tracking-wide">
          <strong>Full-stack</strong> developer with an eye for new <strong>challenges</strong>
        </div>
        <button class="mx-4 xs:mx-2 my-3 border border-yellow-400 hover:bg-black btn-yellow-glow btn-8 btn-16" @click="toggleContactForm()">
          <span class="px-8 py-3 text-xl tracking-wider font-semibold">Contact me</span>
        </button>
      </div>

      <ContactForm v-if="contactFormIsShown" @toggle-form="toggleContactForm()"/>
    </header>
    <TechStack @filter-stack="(filteredStackIds: any) => stackIds = filteredStackIds" class="flex justify-center mt-1 mb-4"/>
    <Projects :filtered-ids="stackIds" class="flex justify-center mb-16"/>
    <Footer class="inset-x-0 bottom-0"/>
  </div>
</template>

<script setup lang="ts">
// import { RouterLink, RouterView } from 'vue-router'
import { computed, ref } from 'vue'
import Menu from './components/Menu.vue'
import TechStack from './components/TechStack.vue'
import ContactForm from './components/ContactForm.vue'
import Projects from './components/Projects.vue'
import Footer from './components/Footer.vue'

const stackIds = ref([])

let contactFormIsShown = ref(false);
let isNotJustReloaded = ref(false);
const toggleContactForm = () => {
  if (contactFormIsShown.value) {
    document.getElementById('container-contact')?.classList.add('content-fade-slow')
    contactFormIsShown.value = !contactFormIsShown.value;
  } else {
    isNotJustReloaded.value = true;
    contactFormIsShown.value = !contactFormIsShown.value;
  } 
}

</script>

<style scoped>
@import '@/assets/main.css';

/* Fonts */
@font-face {
  font-family: "Playfair";
  src: local('Playfair'), url('./assets/fonts/PlayfairDisplay/PlayfairDisplay-Medium.ttf') format('truetype');
}
@font-face {
  font-family: "PlayfairBold";
  src: local('Playfair'), url('./assets/fonts/PlayfairDisplay/PlayfairDisplay-Black.ttf') format('truetype');
}
.font-playfair-bold {
  font-family: 'PlayfairBold', serif;
}
@font-face {
  font-family: "Roboto";
  src: local('Roboto'), url('./assets/fonts/RobotoMono/RobotoMono-Medium.ttf') format('truetype');
}
@font-face {
  font-family: "OpenSans";
  src: local('OpenSans'), url('./assets/fonts/OpenSans/OpenSans-SemiBold.ttf') format('truetype');
}
.font-roboto {
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}
.font-lato {
  font-family: 'Lato', sans-serif;
}

/* Banner */
@media (min-width: 475px) {
  .img-banner {
    object-position: top 20% left 50%;
  }
}
@media (min-width: 1024px) {
  .img-banner {
    object-position: left 0;
  }
}

/* Button */
.btn-yellow-glow {
  cursor: pointer;
  overflow: hidden;
  text-shadow: #FC0 1px 0 10px;
}
.btn-8 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-8:before,
.btn-8:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: var(--primary);
  transition: all 0.3s ease;
}
.btn-8:before{
   height: 0%;
   width: 2px;
}
.btn-8:after {
  width: 0%;
  height: 2px;
}
.btn-8:hover:before {
  height: 100%;
}
.btn-8:hover:after {
  width: 100%;
}
.btn-8:hover{
  background: rgba(0,0,0,0.9);
}
.btn-8 span:hover{
  color: var(--primary);
}
.btn-8 span:before,
.btn-8 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: var(--primary);
  transition: all 0.3s ease;
}
.btn-8 span:before {
  width: 2px;
  height: 0%;
}
.btn-8 span:after {
  width: 0%;
  height: 2px;
}
.btn-8 span:hover:before {
  height: 100%;
}
.btn-8 span:hover:after {
  width: 100%;
}

/* Banner */
.banner-zoom-out {
  transition: all 2.5s ease-in-out;
  transform: perspective(500px) translateZ(450px) translateY(10%) translateX(16%);
}

.banner-zoom-in {
  transition: all 2.5s ease-in-out;
  transform: perspective(-500px) translateZ(-450px) translateY(-10%) translateX(-16%);
}

.banner-opacity-out {
  transition: opacity 2.5s;
  background-color: black;
  opacity: 0.1;
}

.banner-opacity-in {
  transition: opacity 2.5s;
  background-color: black;
  opacity: 1;
}
</style>
