<template>
    <div class="box-yellow">  
        <div class="font-bold leading-tight text-center text-box">
            {{ role }}
        </div>
    </div>
</template>
<script setup lang="ts">
import { ref } from 'vue'

defineProps({
    role: {
        type: String,
        required: true
    }
})
</script>
<style scoped>
@import '../assets/main.css';

.box-yellow {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 2.5rem;
    height: 2.5rem;
    background-color: var(--primary);
    color: black;
    border-radius: 4%;
}
</style>