<template>
<!--v-on:submit.prevent="searchTrip"-->
<b-form  class="w-100 h-100">
    <b-row class= "pb-3 pt-3">
        <b-col></b-col>
        <b-col cols="12" md="8">
            <b-card class="w-100 shadow-lg rounded" bg-variant="destacame" text-variant="white">
                <b-container class="pl-4 pr-4 pt-4 pb-4">
                <b-row>
                    <b-card-title>Buscar Viajes</b-card-title>
                </b-row>
                <b-row class="pb-3">
                 <!-- RutInput -->
                <b-col class="my-1">
                    <label class="float-left" for="rut">Rut del Pasajero</label>
                    <b-form-input 
                        required
                        id= "rut"
                        size="md"
                        v-model="rut"
                        type="text">
                    </b-form-input>
                </b-col>   
                <!-- Date Input -->
                <b-col class="my-1">
                    <label class="float-left" for="date">Fecha</label>
                    <b-form-input 
                        :min= 'today' 
                        id= "date"
                        required
                        v-model='date'
                        size="md"
                        type="date">
                    </b-form-input>
                </b-col>
                </b-row>
                    <!-- Origin/Destination selects -->
                <b-row class="pb-3">
                <b-col class="my-1">
                    <label class="float-left" for="origin">Origen</label>
                    <b-form-select 
                    id="origin"
                    required 
                    @change = "getDestination()"
                    v-model="origin_selected" 
                    :options="origins" 
                    value-field='origin' 
                    text-field='origin' 
                    size="sm" 
                    >
                    </b-form-select>
                </b-col>
                <!-- Destination's based on origin -->
                <b-col class="my-1">
                    <label class="float-left" for="destination">Destino</label>
                    <b-form-select 
                    id="course_id" 
                    required
                    v-model="course_selected" 
                    :options="destinations" 
                    value-field='course_id' 
                    text-field='destination' 
                    size="sm" 
                    >
                    </b-form-select>
                </b-col>
                </b-row>
                <div class="w-100">
                    <!-- Submit Form Button -->
                    <b-button
                        type="submit"
                        variant="light"
                        size="md"
                        @click = "searchPassenger()"
                        class="mt-3">
                    Buscar Viajes
                    </b-button>
                </div>
                </b-container>
            </b-card>
        </b-col>
        <b-col></b-col>
    </b-row>
</b-form>
</template>

<script>
import axios from 'axios';
export default {
  name: 'SearchCard',
  data() {
      return {
        day: new Date(),
        today: '',
        date: '',
        origins: [],
        destinations: [],
        origin_selected: '',
        course_selected: '',
        rut: '',
        passenger: null,
      }
  },
  mounted() {
    this.today = this.day.getFullYear() + '-' + ('0' + (this.day.getMonth() + 1)).slice(-2) + '-' + (this.day.getDate()),
    this.getCourses()
  },
  methods: {
    getCourses() {
        // Obtain items from Courses Model using axios to connect to the backend
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/courses/get_origins',
            //Authentification
            auth: {
                username: 'admin',
                password: 'destacametest'
            }
        }).then((response) => {
            this.origins = response.data // Assign retrieved items
        })
    },
    getDestination(){
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/courses/get_destinations/?origin=' + this.origin_selected,
            //Authentification
            auth: {
              username: 'admin',
              password: 'destacametest'
            }
        }).then((response) => {
          this.destination = ''
          this.course = ''
          this.destinations = response.data // Assign retrieved items
        })
      },
    searchPassenger(){
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/passengers/' + this.rut,
            //Authentification
            auth: {
                username: 'admin',
                password: 'destacametest'
            }
        }).then((response) => {
          this.passenger = response.data // Assign retrieved items
          console.log(this.passenger)
        })
    }
  }
}
</script>