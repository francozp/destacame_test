import Vue from 'vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faBus } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faBus)

Vue.component('font-awesome-icon', FontAwesomeIcon)