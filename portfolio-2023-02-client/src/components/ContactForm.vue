<template>
  <div class="w-full">
    <div id="container-contact" class="left-1/2 md:left-2/3 w-72 xs:w-80 lg:w-96 bg-transparent-top-layer border-blur">
      <div class="flex justify-center px-2 py-4">
        <div>
          <div class="flex space-x-4 mb-2 ml-1 text-3xl font-bold text-center">
            <a href="mailto:oanhheckofastory@gmail.com?subject=Contact request&body=Hi Oanh! This is ... Would love to chat with you about ... Are you available on ...? Looking forwards to hearing from you.">
              <font-awesome-icon icon="fa-regular fa-envelope" />
            </a>
            <a href="https://www.linkedin.com/in/oanhnguyenthitu/" target="_blank">
              <font-awesome-icon icon="fa-brands fa-linkedin" />
            </a>
          </div>
          <p class="mb-2">or</p>
          <div class="w-full">
            <form v-if="inputIsShown" action="#">
              <input v-model="name" type="text" id="name" name="name" placeholder="Name *" class="box-input" required>
              <input v-model="email" type="email" id="email" name="email" placeholder="E-mail *" class="box-input" required>
              <input v-model="subject" type="text" id="subject" name="subject" placeholder="Subject" class="box-input">
              <textarea v-model="message" id="message" name="message" placeholder="Message *" class="box-input" required>
              </textarea>
              <input type="submit" value="SEND !" id="btn-send" class="flex items-stretch justify-center box-input -mt-2 cursor-pointer hover-glow" @click.stop=" canSubmit ? submitContact : ''">
            </form>
            <div v-if="successSubmit">
              <p>Thank you for reaching out! I will be in touch within three business days.</p>
            </div>
            <div v-if="failSubmit">
              <p>I am sorry, the email did not go through. Please email me: oanhheckofastory@gmail.com</p>
            </div>
          </div>
          <div class="absolute top-0 right-1 cursor-pointer" @click="closeForm">
            <font-awesome-icon icon="fa-solid fa-xmark fa-2xl" size="lg"/>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import type { Ref } from 'vue';
import axios from 'axios';

const emit = defineEmits<{
  (e: 'toggleForm'): void
}>()

const canSubmit = computed(() => {
  const badValues = [null, undefined, '']
  return !badValues.includes(name.value) && !badValues.includes(email.value) && !badValues.includes(message.value)
})

function closeForm() {
  emit('toggleForm')
}

function submitContact() {
  console.log(name.value, email.value, subject.value, message.value)

  // Show confirmation message

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
  opacity: 0.5 !important;
}
::-webkit-input-placeholder::placeholder {
  color: var(--primary) !important;
  opacity: 0.5 !important;
}
::-moz-placeholder {
  color: var(--primary) !important;
  opacity: 0.5 !important;
}

input:focus, textarea:focus, .hover-glow:hover {
  z-index: 1;
  outline: 3px solid var(--primary);
  border-radius: 1px;
  -webkit-transition: 0.2s;
  transition: 0.2s;
}

/* Container */
#container-contact {
  position: fixed;
  z-index: 10;
  top: 9rem;
  padding-left: 0.5rem; /* 8px */
  padding-right: 0.5rem; /* 8px */
  padding-top: 0.75rem; /* 12px */
  padding-bottom: 0.75rem;
  border-radius: 0.25rem;
  transform: translateX(-50%);
  transition-duration: 700ms;
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

#btn-send:hover > p {
  font-weight: 700;
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
