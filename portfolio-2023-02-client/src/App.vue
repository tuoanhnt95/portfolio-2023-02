<template>
  <div class="bg-black text-yellow-500 w-screen">
    <Menu class="fixed z-20 w-screen text-base font-lato tracking-wider"/>

    <header class="h-[55vh] overfow-hidden">
      <div :class="{ 'banner-opacity': contactFormIsShown }" class="h-full">
        <img class="img-banner" alt="Oanh's sideface photo with sparkly eyes" loading="lazy" src="src/assets/images/sideface.JPG" :class="{ 'banner-zoom': contactFormIsShown }" />
      </div>
      <div class="absolute top-1/4 left-1/4 xs:left-[40%] sm:left-1/2" :class="{ 'content-fade': contactFormIsShown }">
        <p class="text-8xl md:text-9xl tracking-wide font-playfair-bold">Oanh</p>
        <div class="mx-2 my-2 text-base xs:text-lg sm:text-xl drop-shadow-lg font-sans tracking-wide">
          <strong>Full-stack</strong> developer with an eye for new <strong>challenges</strong>
        </div>
        <button class="mx-2 my-3 border border-yellow-400 hover:bg-black btn-custom btn-8 btn-16" @click="toggleContactForm()">
          <span class="px-8 py-3 text-xl font-sans tracking-wider font-semibold">Contact me</span>
        </button>
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
.img-banner {
  margin-left: -25%;
  object-fit: cover;
  min-width: calc(125%);
  height: 100%;
  opacity: 0.5;
  overflow: hidden;
}
@media (min-width: 475px) {
  .img-banner {
    margin-left: 0;
    object-position: top 20% left 100%;
    min-width: 100%;
  }
}
@media (min-width: 640px) {
  .img-banner {
    margin-left: 0;
    object-position: top 20% left 0;
    min-width: 100%;
  }
}

/* Button */
.btn-custom {
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
