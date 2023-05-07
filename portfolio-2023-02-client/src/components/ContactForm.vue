<template>
  <div class="bg-neutral-50 bg-opacity-80 fixed z-10 top-40 left-10 border border-indigo-500 p-2">
    <h1 class="text-xl font-bold text-center mb-2">Contact me</h1>
    <div class="wrapper-form-info">
      <form v-if="inputIsShown" action="#">
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
      <div v-if="successSubmit">
        <p>Thank you for reaching out! I will be in touch within three business days. Have a nice time.</p>
      </div>
      <div v-if="failSubmit">
        <p>I am sorry, the email did not go through. Please try again or email me: tuoanhnt95@gmail.com</p>
      </div>
    </div>
    <div class="absolute top-0 right-1" @click="$emit('toggleForm')">X</div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import type { Ref } from 'vue';
import axios from 'axios';

defineEmits<{
  (e: 'toggleForm', value: boolean): void
}>()

function submitContact() {
  console.log(name.value, email.value, subject.value, message.value)

  inputIsShown.value = true
  successSubmit.value = false
  failSubmit.value = false
  axios.post('http://localhost:3000/contacts', {
    name: name.value,
    email: email.value,
    subject: subject.value,
    message: message.value,
  })
  .then(function (res) {
    console.log(res)
    inputIsShown.value = false
    successSubmit.value = true
  })
  .catch(function (error) {
    inputIsShown.value = false
    failSubmit.value = true
    // if (error.response) {
    //   console.log(error.response)
    // } else if (error.request) {
    //   console.log(error.request);
    // } else {
    //   console.log('Error', error.message);
    // }
    // console.log(error.config);
  });
}

let inputIsShown = ref(true)
let successSubmit = ref(false)
let failSubmit = ref(false)

// if form is sucessfully submitted, show Success message
// else show error

let name: Ref<string | null> = ref(null);
let email: Ref<string | null> = ref(null);
let subject: Ref<string | null> = ref(null);
let message: Ref<string | null> = ref(null);
</script>

<style scoped>
</style>
