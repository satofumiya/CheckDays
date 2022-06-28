// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Vue from 'vue'
import Vuetify from 'vuetify'
import "vuetify/dist/vuetify.min.css"
import App from '../app.vue'
import TurbolinksAdapter from 'vue-turbolinks';

Vue.use(TurbolinksAdapter);
Vue.use(Vuetify)

const vuetify = new Vuetify();

document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('vue-app')) {
        const app = new Vue({
            vuetify,
            render: h => h(App)
        }).$mount()
        document.body.appendChild(app.$el)

        console.log(app)
    }
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()
