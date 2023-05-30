<template>
  <!-- <div class="bg-neutral-50 bg-opacity-80 fixed z-10 top-40 left-10 border border-indigo-500 p-2"> -->
  <div class="fixed z-10 top-36 left-10 w-72 px-2 py-3 bg-transparent-top-layer border-blur rounded">
    <div class="flex justify-center px-2 py-4">
      <div>
        <div class="flex space-x-4 mb-2 ml-1 text-3xl font-bold text-center">
          <font-awesome-icon icon="fa-regular fa-envelope" />
          <font-awesome-icon icon="fa-brands fa-linkedin" />
        </div>
        <div class="w-full">
          <form v-if="inputIsShown" action="#">
            <input v-model="name" type="text" id="name" name="name" placeholder="Name" class="box-input">
            <input v-model="email" type="email" id="email" name="email" placeholder="E-mail" class="box-input">
            <input v-model="subject" type="text" id="subject" name="subject" placeholder="Subject" class="box-input">
            <textarea v-model="message" id="message" name="message" placeholder="Message" class="box-input">
            </textarea>
            <div id="btn-send" class="flex items-stretch justify-center box-input -mt-2 cursor-pointer" @click="submitContact">
              <p class="self-center">SEND !</p>
            </div>
          </form>
          <div v-if="successSubmit">
            <p>Thank you for reaching out! I will be in touch within three business days.</p>
          </div>
          <div v-if="failSubmit">
            <p>I am sorry, the email did not go through. Please email me: tuoanhnt95@gmail.com</p>
          </div>
        </div>
        <div class="absolute top-0 right-1 cursor-pointer" @click="$emit('toggleForm')">
          <font-awesome-icon icon="fa-solid fa-xmark fa-2xl" size="lg"/>
        </div>
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
  color: var(--primary) !important;
}

.box-input {
  width: 100%;
  height: 2.5rem;
  padding: 0.5rem;
  background-color: rgba(0,0,0,0.7);
  color: var(--primary);
  box-shadow: 0px 0px 2px 2px rgba(255,204,0,0.4),
        inset 0px 0px 1px 1px rgba(255,204,0,0.6);
}

#message {
  height: 7rem;
}

#btn-send {
  height: 3.5rem;
}

.border-blur {
  box-shadow: 0px 0px 4px 3px rgba(255,204,0,0.4),
        inset 0px 0px 4px 3px rgba(255,204,0,0.4);
}

.bg-transparent-dark {
  /* background-color: rgba(0,0,0,0.1); */
  filter: drop-shadow(2px 2px 4px 4px rgba(0,204,0,1));
}
</style>
