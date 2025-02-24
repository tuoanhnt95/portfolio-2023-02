<template>
  <div class="w-screen bg-black text-yellow-500 overflow-x-hidden">
    <Menu class="fixed z-20 w-screen text-base font-lato tracking-wider"/>

    <!-- <header class="overflow-hidden h-[55vh]" > -->
    <header class="overflow-hidden" style="height: 500px;" >
      <div :class="{ 'banner opacity-out': contactFormIsShown, 'banner opacity-in': !contactFormIsShown && isNotJustReloaded }" class="h-full">
        <img alt="Oanh's sideface photo with sparkly eyes" loading="lazy" src="/src/assets/images/sideface.jpg" :class="{ 'banner-zoom-out': contactFormIsShown, 'banner-zoom-in': !contactFormIsShown && isNotJustReloaded }" class="img-banner ml-[-25%] xs:ml-0 object-cover min-w-[125%] xs:min-w-full h-full opacity-50"/>
      </div>
      <div class="absolute top-1/4 left-1/3 xs:left-1/2 md:left-[70%]" :class="{ 'content-fade': contactFormIsShown, 'content-fade-in': !contactFormIsShown && isNotJustReloaded }
      ">
        <p class="text-8xl md:text-9xl tracking-wide font-playfair-bold text-right">Oanh</p>
        <div class="mx-4 xs:mx-2 mt-6 text-base xs:text-lg sm:text-xl tracking-wide text-right">
          <strong>Writer</strong> & <strong>Software Developer</strong>
        </div>
        <div class="flex justify-end mt-3">
          <a href="https://forms.gle/2q1zfuv4gibfzxYw9"
            target="_blank"
          >
            <button class="mx-4 xs:mx-2 my-3 btn-yellow-glow btn-8">
            <!-- <button class="mx-4 xs:mx-2 my-3 btn-yellow-glow btn-8" @click="toggleContactForm()"> -->
              <span class="px-8 text-xl">Subscribe</span>
            </button>
          </a>
        </div>
      </div>

      <div class="invisible md:visible absolute top-[15%] left-[50%]"
        :class="{ 'opacity-out': contactFormIsShown, 'opacity-in': !contactFormIsShown && isNotJustReloaded }"
      >
        <div class="text-release">New Release!</div>
        <img alt="Oanh in Tibet book cover" loading="lazy" src="/src/assets/images/oanhInTibet-front.png" class="h-80 mt-2"/>
      </div>

      <!-- <div class="invisible md:visible absolute top-[85%] left-[50%]">
        <div class="flex justify-end">
          <input type="email" placeholder="Email address" class="input-email-download"/>
          <button class="btn-yellow-black" @click="downloadChapter">
            <span class="px-3">Download free chapter</span>
          </button>
        </div>
      </div> -->

      <ContactForm v-if="contactFormIsShown" @toggle-form="toggleContactForm()"/>
    </header>

    <div class="container-writing p-8" >
      <div class="text-release large">
        Writer
      </div>
      <div class="md:grid md:grid-cols-2 container-book">
        <div class="container-book-info">
          <div style="width: 440px; height: fit-content;">
            <div class="text-release mb-4">New Release!</div>
            <div class="text-release large">Oanh in Tibet</div>
            <p>In New Year 2020, Oanh embarks on a backpacking trip to Tibet to fulfill her 'To-Do Before 25' list, befriending fellow travellers Wise Man, Hiro, and White Prince. What begins as an innocent exploration of breathtaking landscapes and rich Himalayan cultures takes a dark turn when the four become entangled in an ancient Buddhist myth and must confront their deepest fears. Will they emerge unchanged?</p>
            <br><p>A mix of <i>The Alchemist</i>, <i>Eat, Pray, Love</i>, <i>The Adventure of Tintin</i> and observational, witty humour in this adult coming-of-age travel adventure story. Enjoy!</p>
            <div class="flex gap-4 mt-4">
              <a href="https://www.amazon.com/dp/B0DY6LBCTF" target="_blank">
                <button class="btn-7 buy-now">
                  Buy now
                  <font-awesome-icon icon="fa-brands fa-amazon" class="h-6"/>
                </button>
              </a>
              <a href="https://www.goodreads.com/book/show/228077892-oanh-in-tibet" target="_blank">
                <button class="btn-7 check-review">
                  Check out reviews
                  <font-awesome-icon icon="fa-brands fa-goodreads" class="h-6"/>
                </button>
              </a>
            </div>
          </div>
        </div>
        <div class="flex justify-center min-h-0">
          <img alt="Oanh in Tibet book cover" loading="lazy" src="/src/assets/images/oanhInTibet-front.png" class="h-full"/>
        </div>
      </div>
    </div>

    <div class="container-programming p-8">
      <div class="text-release large">
        Developer
      </div>
      <div class="container-book">
        <TechStack @filter-stack="(filteredStackIds: any) => stackIds = filteredStackIds" class="flex justify-center mt-1 mb-4"/>
        <Projects :filtered-ids="stackIds" class="flex justify-center mb-16"/>
      </div>
    </div>
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
  border: 1px solid #FC0;
}
.btn-yellow-glow span,
.btn-yellow-black span {
  padding-top: 0.75rem;
  padding-bottom: 0.75rem;
  letter-spacing: 0.1em;
  font-weight: 600;
}
.btn-yellow-glow:hover {
  background: black;
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
.btn-yellow-black {
  cursor: pointer;
  overflow: hidden;
  text-shadow: #FC0 1px 0 10px;
  background: #FC0;
  color: black;
  width: 420px;
}
.btn-yellow-black:hover {
  background: rgb(228, 198, 77);
  color: rgb(25, 24, 24);
  box-shadow:
    4px 4px 4px rgb(0 0 0 / 0.15),
    -4px -4px 4px rgb(0 0 0 / 0.15);
}
.input-email-download {
  height: 38pt;
  width: 100%;
  font-weight:700;
  border: 1px solid rgba(255, 204, 0, 0.165);
  border-radius:1px;
  background-color: rgba(19,19,19,.55);
  backdrop-filter: blur(6px);
  opacity: 1;
  padding-left: 12px;
}
.text-release {
  font-size: 1.25rem;
  line-height: calc(7 / 5);
  align-self: center;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-shadow: 0 4px 4px rgb(0 0 0 / 0.45);
}
.text-release.large {
  font-size: 2rem;
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

.opacity-out {
  transition: opacity 2.5s;
  opacity: 0.1;
}

.opacity-in {
  transition: opacity 2.5s;
  opacity: 1;
}
.banner {
  background-color: black;
}

.container-writing {
  height: 600px;
  width: 100%;
  margin-bottom: 64px;
}
.container-book {
  height: 100%;
  border: 1px solid #FC0;
}
.container-book-info {
  display: flex;
  justify-content: center;
  align-items: center;
  /* font-size: 16pt; */
}
.btn-7 {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  color: black;
  font-size: 11pt;
  letter-spacing: wider;
  font-weight: 600;
  transition: all 0.2sease-in-out;
}
.buy-now {
  background-color: #ffa41c;
}
.check-review {
  font-family: Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #1e1915;
  background-color: #e9e5cd;
  /* border: 0.2rem solid #1e1915; */
  /* height: 4.4rem; */
  padding: 0.75rem 2rem;
  /* font-size: 1.6rem; */
  border-radius: 3rem;
}
</style>
