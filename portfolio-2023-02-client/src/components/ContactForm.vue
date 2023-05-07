<template>
    <div class="bg-neutral-50 bg-opacity-80 fixed z-10 top-40 left-10 border border-indigo-500 p-2">
        <h1 class="text-xl font-bold text-center mb-2">Contact me</h1>
        <div class="wrapper-form-info">
            <form action="#">
                <label for="name">Your name:</label>
                <input v-model="name" type="text" id="name" name="name"><br><br>
                <label for="email">Email:</label>
                <input v-model="email" type="email" id="email" name="email"><br><br>
                <label for="subject">Subject:</label>
                <input v-model="subject" type="text" id="subject" name="subject"><br><br>
                <label for="message">Message:</label>
                <input v-model="message" type="text" id="message" name="message"><br><br>
                <div class="bg-indigo-500" @click="submitContact">
                  Submit
                </div>
            </form>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import type { Ref } from 'vue';
import axios from 'axios';

function submitContact() {
  console.log(name.value, email.value, subject.value, message.value)
  // when click submit, send a post request to backend
  // fetch('http://localhost:3000/contacts', {
  //   method: "POST",
  //   body: JSON.stringify({
  //     name: name.value,
  //     email: email.value,
  //     subject: subject.value,
  //     message: message.value
  //   }),
  //   headers: {
  //     "Content-type": "application/json; charset=UTF-8"
  //   }
  // })
  // .then((res) => res.json())

  axios.post('http://localhost:3000/contacts', {
    name: name.value,
    email: email.value,
    subject: subject.value,
    message: message.value
  })
  .then((res) => console.log(res))
  .catch((error) => console.log(error));
}

let name: Ref<string | null> = ref(null);
let email: Ref<string | null> = ref(null);
let subject: Ref<string | null> = ref(null);
let message: Ref<string | null> = ref(null);
</script>

<style scoped>
</style>
