import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faEnvelope } from '@fortawesome/free-regular-svg-icons'
import { faLinkedin, faGithub, faYoutube, faMedium, faCodepen } from '@fortawesome/free-brands-svg-icons'
import { faXmark, faFilter } from '@fortawesome/free-solid-svg-icons'

/* add icons to the library */
library.add(faEnvelope, faLinkedin, faGithub, faYoutube, faMedium, faCodepen, faXmark, faFilter)

const app = createApp(App)
app.component('font-awesome-icon', FontAwesomeIcon)
app.use(router)

app.mount('#app')
