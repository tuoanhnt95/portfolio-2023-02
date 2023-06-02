<template>
  <div>
    <div>
      <div class="xs:mt-6 mb-8 text-2xl lg:text-3xl xl:text-4xl font-playfair-bold">
        My Projects
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-12">
        <div v-for="(project, i) in filteredProjects" :key="i" @mouseenter="highlightBackground(i)" @mouseleave="unhighlightBackground(i)">
          <div :id="`card-project${i}`" class="card-background bg-zinc-900"></div>
          <div class="img-project" :style="{ backgroundImage: `url(${ 'src/assets/images/' + project.image})`}"></div>
          <div class="mt-1 flex">
            <IconRole :role='roles[project.role]'/>
            <div class="ml-2">
              <div class="font-bold">
                {{ project.name }}
              </div>
              <div class="text-xs" >
                {{ getStacksByProjectIndex(i) }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, defineProps } from 'vue'
import IconRole from './IconRole.vue'
const props = defineProps({
  filteredIndexes: {
    type: Array,
    required: true
  }
})
const stacks = [
  //0 
  {name: 'ruby on rails', displayName: 'rails', select: false}, 
  //1
  {name: 'python', select: false}, 
  //2
  {name: 'c#', select: false},
  //3
  {name: 'javascript', select: false},
  //4
  {name: 'typescript', select: false},
  //5
  {name: 'vue.js', select: false},
  //6
  {name: 'bootstrap', select: false},
  //7
  {name: 'tailwind', select: false},
  //8
  {name: 'SQLServer', select: false},
  //9
  {name: 'PostgreSQL', select: false},
  //10
  {name: 'SQLite', select: false}
]

const roles = ['Tech lead', 'Pers.']

const projects = [
  {
    name: 'HealthWay',
    description: 'Decent description of the app',
    image: 'healthway.jpg',
    url: 'http://www.healthway.live/',
    stack: [0, 3, 6, 9],
    role: 0
  }, {
    name: 'PlayerWon',
    description: 'Decent description of the app',
    image: 'playerwon.jpg',
    url: 'https://player-won.herokuapp.com/',
    stack: [0, 3, 6, 10],
    role: 0
  }, {
    name: 'Movie Watch List',
    description: 'Decent description of the app',
    image: 'movie-watch-list.jpg',
    url: 'https://www.google.com',
    stack: [0, 3],
    role: 1
  }, {
    name: 'Line Chatbot',
    description: 'Decent description of the app',
    image: 'line-chat-bot.jpeg',
    url: 'https://www.google.com',
    stack: [0, 3],
    role: 1
  }
]

function getStacksByProjectIndex(i: number) {
  const project = projects[i]
  const stacksByProjectIndex = project.stack.map((stackIndex: number) => getStackDisplayName(stacks[stackIndex])).join(', ')
  return stacksByProjectIndex
}

function getStackDisplayName(stack: any) {
  return stack.displayName ? capitalizeFirstLetter(stack.displayName) : capitalizeFirstLetter(stack.name)
}

function capitalizeFirstLetter(string: string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

const filteredProjects = computed(() => {
  if (props.filteredIndexes.length === 0) {
    return projects
  } 
  return projects.filter((project: any) => {
  // get project.stack for the indexs
  // check if that index is in the filteredIndexes array
    let result = project.stack.filter((stackIndex: number) => props.filteredIndexes.includes(stackIndex))
    return result.length > 0
  })
}) 

function highlightBackground(i: number) {
  const card = document.getElementById(`card-project${i}`)
  card?.classList.add('background-expand')
}

function unhighlightBackground(i: number) {
  const card = document.getElementById(`card-project${i}`)
  card?.classList.remove('background-expand')
}
</script>

<style scoped>
@import '../assets/main.css';

@font-face {
  font-family: "PlayfairBold";
  src: local('Playfair'), url('./assets/fonts/PlayfairDisplay/PlayfairDisplay-Black.ttf') format('truetype');
}

.font-playfair-bold {
  font-family: 'PlayfairBold', serif;
} 

.img-project {
  background-size: cover;
  width: 320px;
  height: 200px;
  border-radius: 1px;
}

.card-background {
  --radius: 4px;
  --inset: 2rem;
  --inset-bottom: 1rem;
  --inset-right: 0;
  --offset: -1rem;
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: var(--offset);
  border-radius: var(--radius);
  overflow: hidden;
  /* background: hsl(232.5deg, 11.7647058824%, 13.3333333333%); */
  clip-path: inset(var(--inset-top,var(--inset)) var(--inset-right,var(--inset)) var(--inset-bottom,var(--inset)) var(--inset-left,var(--inset)) round var(--radius));
  contain: strict;
  transition: clip-path .3s ease .1s;
}

.background-expand {
  clip-path: none;
}
</style>
  