<template>
  <div class="footer bg-zinc-900">
    <div class="mb-2">
      <p class="copyright-text">Copyright &copy; 2023 All Rights Reserved by Oanh.
      </p>
    </div>
    <div class="footer-links">
      <ul>
        <li v-for="(link, i) in links" :key="i">
          <a :href="link.url" target="_blank" :class="{'border-bottom-red' : highlightStatus[i] }">
            <div class="flex justify-center text-2xl box-icon" :class="{'box-icon-hover' : highlightStatus[i] }" >
              <font-awesome-icon :icon="link.icon" class="icon" @mouseenter="highlight(i)" @mouseleave="dehighlight(i)"/>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

// track highlight status of 0 linkedin, 1 facebook, 2 youtube, 3 medium, 4 codepen, 5 email 
const highlightStatus = ref([false, false, false, false, false, false])
function highlight(i: number) {
  highlightStatus.value[i] = true
  console.log(highlightStatus.value[i])
}

function dehighlight(i: number) {
  highlightStatus.value[i] = false
}

const links = [
  {
    name: 'linkedin',
    url: 'https://jp.linkedin.com/in/oanhnguyenthitu',
    icon: 'fa-brands fa-linkedin'
  },
  {
    name: 'github',
    url: 'https://github.com/tuoanhnt95',
    icon: 'fa-brands fa-github'
  },
  {
    name: 'youtube',
    url: 'https://www.youtube.com/channel/UCQ0gULxXnyVPL4Vy1fptYww',
    icon: 'fa-brands fa-youtube'
  },
  {
    name: 'medium',
    url: '#',
    icon: 'fa-brands fa-medium'
  },
  {
    name: 'codepen',
    url: 'https://codepen.io/tuoanhnt95',
    icon: 'fa-brands fa-codepen'
  }
]
</script>
<style scoped>
@import '@/assets/main.css';

.footer {
  width: 100%;
  padding: .5rem;
  text-align: center;
}

ul {
  margin: 0;
  padding: 0;
}

li {
  display: inline;
  margin: 0;
  padding: 0;
}

a {
  display: inline-block;
  position: relative;
  width: 40px;
  height: 40px;
  margin: 0.5rem;
  /* padding: 20px; */
  /* border-bottom: 0px solid rgba(0,0,0,0.95);
  border-radius: 4px;
  box-shadow: inset 0 -3px 0 0 rgba(0,0,0,0), 0 6px 8px rgba(0,0,0,0), 0 24px 24px rgba(0,0,0,0), 0 36px 36px rgba(0,0,0,0), 0 64px 64px rgba(0,0,0,0), 0 64px 128px rgba(0,0,0,0), 0 120px 0 rgba(0,0,0,0), 0 86px 8px 6px rgba(0,0,0,0),;
  transition: .2s ease-in; */
}

.box-icon {
  width: 100%;
  height: 100%;
}

.box-icon-hover {
  filter: blur(.5px);
  fill: fadeout(var(--secondary-4), 40);
}

.border-bottom-red {
  transform: translateY(-4px);
	transition: .2s ease-in;
  /* box-shadow: inset 0 86px 8px 6px var(--primary); */
}
</style>
