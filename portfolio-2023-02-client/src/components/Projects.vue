<template>
  <div>
    <div>
      <div class="flex flex-start xs:mt-6 mb-8 text-2xl lg:text-3xl xl:text-4xl font-playfair-bold">
        My Projects ({{ filteredProjects.length  }})
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-12">
        <div v-for="(project, i) in filteredProjects" :key="i" @mouseenter="highlightBackground(i)" @mouseleave="unhighlightBackground(i)">
          <a :href="project.url" target="_blank" rel="noopener noreferrer" :class="{ 'pointer-events-none' : project.url.length === 0 }">
            <div :id="`card-project${i}`" class="card-background bg-zinc-900"></div>
      
            <div class="img-project" :style="{ backgroundImage: `url(${ 'src/assets/images/' + project.image})`}"></div>
          
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
import { computed, defineProps } from 'vue'
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
  // get project.stack for the ids
  // check if that id is in the filteredIds array
    let result = project.stack.filter((stackId: number) => props.filteredIds.includes(stackId))
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
  