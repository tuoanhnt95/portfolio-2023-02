<template>
  <div>
    <div>
      <div class="flex flex-start xs:mt-6 mb-8 text-2xl lg:text-3xl xl:text-4xl font-playfair-bold">
        My Projects ({{ filteredProjects.length  }})
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-12">
        <div v-for="(project, i) in filteredProjects" :key="i" @mouseenter="highlightBackground(i)" @mouseleave="unhighlightBackground(i)">
          <a :href="project.url" target="_blank" rel="noopener noreferrer" :class="{ 'pointer-events-none' : project.url.length === 0 }">
            <div class="card-background bg-zinc-900" :class="{'background-expand' : highlightedProject === i}"></div>

            <div class="img-project card-category" :class="{'card-category-hover': highlightedProject === i}" :style="{ backgroundImage: `url(${project.image})`}">
              <div class="card-content" :class="{'card-content-hover': highlightedProject === i}">
                <p>
                  Team: {{ project.members }}
                </p>
                <p>
                  {{ project.description }}
                </p>
              </div>
            </div>

            <div class="mt-1 flex">
              <IconRole :role='getRoleNameByProject(project)'/>
              <div class="ml-2">
                <div class="font-bold">
                  {{ project.name }}
                </div>
                <div class="text-xs" >
                  {{ getStacksByProject(project) }}
                </div>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import IconRole from './IconRole.vue'
import stackData from '../stacks.json'
import projectData from '../projects.json'
import roleData from '../roles.json'

const props = defineProps({
  filteredIds: {
    type: Array,
    required: true
  }
})

function getStacksByProject(project: any) {
  return stackData
    .filter((stack: any) => project.stack.includes(stack.id))
    .map((stack: any) => getDisplayName(stack))
    .join(', ')
}

function getDisplayName(object: any) {
  return object.displayName ? capitalizeFirstLetter(object.displayName) : capitalizeFirstLetter(object.name)
}

function getRoleNameByProject(project: any) {
  const result = roleData.find((role: any) => role.id === project.role)
  if (!result) return ''
  return getDisplayName(result)
}

function capitalizeFirstLetter(string: string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

const filteredProjects = computed(() => {
  if (props.filteredIds.length === 0) {
    return projectData
  }
  return projectData.filter((project: any) => {
    let result = project.stack.filter((stackId: number) => props.filteredIds.includes(stackId))
    return result.length > 0
  })
})

// highlight
const highlightedProject = ref(-1)
function highlightBackground(i: number) {
  highlightedProject.value = i
  // const card = document.getElementById(`card-project${i}`)
  // card?.classList.add('background-expand')
}

function unhighlightBackground(i: number) {
  highlightedProject.value = -1
  // const card = document.getElementById(`card-project${i}`)
  // card?.classList.remove('background-expand')
}
</script>

<style scoped>
@import '../assets/main.css';

* {
  --d: 700ms;
  --e: cubic-bezier(0.19, 1, 0.22, 1);
  --bp-md: 600px;
  --bp-lg: 800px;
}

/* Fonts */
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

/* description */
.card-category {
  display: flex;
  justify-content: center;
  align-items: flex-end;
}

.card-category:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 110%;
  background-position: 0 0;
  pointer-events: none;
}

.card-category:after {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 200%;
  pointer-events: none;
  transform: translateY(-50%);
}

.card-category-hover:after {
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.009) 11.7%, rgba(0, 0, 0, 0.034) 22.1%, rgba(0, 0, 0, 0.072) 31.2%, rgba(0, 0, 0, 0.123) 39.4%, rgba(0, 0, 0, 0.182) 46.6%, rgba(0, 0, 0, 0.249) 53.1%, rgba(0, 0, 0, 0.32) 58.9%, rgba(0, 0, 0, 0.394) 64.3%, rgba(0, 0, 0, 0.468) 69.3%, rgba(0, 0, 0, 0.54) 74.1%, rgba(0, 0, 0, 0.607) 78.8%, rgba(0, 0, 0, 0.668) 83.6%, rgba(0, 0, 0, 0.721) 88.7%, rgba(0, 0, 0, 0.762) 94.1%, rgba(0, 0, 0, 0.79) 100%);
}

.card-content {
  position: relative;
  z-index: 1;
  width: 100%;
  padding: 1rem;
  opacity: 0;
  text-shadow: 1px 1px 3px rgba(0,0,0,1);
  transition: transform var(--d) var(--e);
}

.card-content-hover {
  opacity: 1;
  transform: translateY(-1rem);
  transition: transform var(--d) var(--e), opacity var(--d) var(--e);
}

.card-category-hover,
.card-category-hover:before,
.card-category-hover:after,
.card-content-hover {
  transition-duration: var(--d);
  transition-delay: calc(var(--d) / 8);
}
</style>
