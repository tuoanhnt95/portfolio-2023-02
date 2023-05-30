<template>
  <!-- <div class="bg-neutral-50 bg-opacity-80 fixed z-10 top-40 left-10 border border-indigo-500 p-2"> -->
  <div class="fixed w-64 m-auto top-40 z-10 left-10 bg-transparent-top-layer border-yellow border-blur">
    <div class="flex justify-center px-2 py-4">
      <div>
        <h1 class="flex space-x-4 mb-2 ml-1 text-xl font-bold text-center">
          <font-awesome-icon icon="fa-regular fa-envelope" />
          <font-awesome-icon icon="fa-brands fa-linkedin" />
        </h1>
        <div class="w-full">
          <form v-if="inputIsShown" action="#">
            <input v-model="name" type="text" id="name" name="name" placeholder="Name" class="w-full h-8 p-1 border-yellow">
            <input v-model="email" type="email" id="email" name="email" placeholder="E-mail" class="w-full h-8 p-1 border-yellow">
            <input v-model="subject" type="text" id="subject" name="subject" placeholder="Subject" class="w-full h-8 p-1 border-yellow">
            <textarea v-model="message" id="message" name="message" placeholder="Message" class="w-full h-28 p-1 border-yellow">
            </textarea>
            <div class="w-full h-10 border-yellow" @click="submitContact">
              <p class="text-center">SEND!</p>
            </div>
          </form>
          <div v-if="successSubmit">
            <p>Thank you for reaching out! I will be in touch within three business days.</p>
          </div>
          <div v-if="failSubmit">
            <p>I am sorry, the email did not go through. Please email me: tuoanhnt95@gmail.com</p>
          </div>
        </div>
        <div class="absolute top-0 right-1" @click="$emit('toggleForm')">X</div>
      </div>
    </div>
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
let message: Ref<string> = ref('');
</script>

<style scoped>
@import '../assets/main.css';

/* Input */
input, textarea {
  background-color: black;
  color: var(--primary);
}
::placeholder {
  color: var(--primary) !important;
}
::-webkit-input-placeholder::placeholder {
  color: var(--primary) !important;
}
::-moz-placeholder {
  color: var(--primary);
}
.text-start-top {
  /* display: flex;
  align-items: top; */
  border: 1px solid red;
}

.border-yellow {
  border: 1px solid var(--primary);
}

.align-center {
  align-self: center;
}
</style>
