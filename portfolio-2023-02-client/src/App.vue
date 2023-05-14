<template>
  <div class="bg-black text-yellow-500 w-screen">
    <Menu class="fixed z-20 w-screen text-base"/>

    <header class="h-[55vh] overfow-hidden">
      <div :class="{ 'banner-opacity': contactFormIsShown }" class="h-full border border-indigo-500">
        <img class="img-banner" alt="Oanh's sideface photo with sparkly eyes" loading="lazy" src="src/assets/images/sideface.JPG" :class="{ 'banner-zoom': contactFormIsShown }" />
      </div>
      <div class="absolute top-1/4 left-1/2" :class="{ 'content-fade': contactFormIsShown }">
        <p class="text-9xl tracking-wide">Oanh</p>
        <p class="m-1 font-sans text-xl tracking-wide">Full-stack developer with an eye for new <strong>challenges</strong></p>
        <button class="border border-yellow-400 p-2" @click="toggleContactForm()">Contact me!</button>
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
/* Fonts */
@font-face {
  font-family: "Playfair";
  src: local('Playfair'), url('./assets/fonts/PlayfairDisplay/PlayfairDisplay-Black.ttf') format('truetype');
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
/* Banner */
.img-banner {
  margin-left: -25%;
  object-fit: cover;
  min-width: calc(125%);
  height: 100%;
  opacity: 0.55;
  overflow: hidden;
}
@media (min-width: 480px) {
  .img-banner {
    margin-left: 0;
    object-position: top 20% left 0;
    min-width: 100%;
  }
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
