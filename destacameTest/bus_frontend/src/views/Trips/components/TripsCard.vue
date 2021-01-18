<template>
<b-form v-on:submit.prevent="addTrip" class="w-100 h-100">
<div class="row">
        <b-col cols="12" md="8">
          <b-card class="w-100 shadow-lg rounded" bg-variant="destacame" text-variant="white">
            <b-container class="pl-4 pr-4 pt-4 pb-4">
              <b-row>
              <b-card-title>Creación del Viaje</b-card-title>
              </b-row>
              <b-row class="pb-3">
                <b-col class="my-1">
                  <label class="float-left" for="date">Fecha</label>
                  <b-form-input 
                    min= '1900-01-01'
                    id= "date"
                    required
                    v-model='date'
                    size="md"
                    type="date">
                  </b-form-input>
                </b-col>
                <b-col class="my-1">
                  <label class="float-left" for="time">Hora de salida</label>
                  <b-form-input 
                    required
                    id= "time"
                    size="md"
                    v-model="time"
                    type="time">
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
                    :options="items" 
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
                    @change = "updateDestination()"
                    v-model="course_selected" 
                    :options="destinations" 
                    value-field='course_id' 
                    text-field='destination' 
                    size="sm" 
                    >
                  </b-form-select>
                </b-col>
              </b-row>

              <b-row>
                <b-col class="my-1">
                  <label class="float-left" for="bus_id">Bus</label>
                  <b-form-select 
                    id="bus_id" 
                    required
                    v-model="bus" 
                    :options="buses" 
                    value-field='bus_id' 
                    text-field='bus_id' 
                    size="sm" 
                    >
                  </b-form-select>
                </b-col>
                <b-col class="my-1">
                  <label class="float-left" for="rut">RUT Chofer</label>
                  <b-form-select 
                    id="rut" 
                    required
                    v-model="driver" 
                    :options="drivers" 
                    value-field='rut' 
                    text-field='rut' 
                    size="sm" 
                    >
                  </b-form-select>
                </b-col>
              </b-row>
              </b-container>
            </b-card>
        </b-col>

        <b-col cols="12" md="4">
          <b-card class="w-100 shadow-lg rounded">
            <b-container class="pl-4 pr-4 pt-2 ">
              <b-row>
                <b-card-title>Detalles del Viaje</b-card-title>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Horario</b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ time }} | {{ date }}</b-card-text>
                </b-col>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Origen</b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ origin_selected }}</b-card-text>
                </b-col>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Destino</b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ destination }}</b-card-text>
                </b-col>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Trayecto </b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ course }}</b-card-text>
                </b-col>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Bus </b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ bus }}</b-card-text>
                </b-col>
              </b-row>
              <b-row class="pb-2">
                <b-col>
                  <b-card-text class="float-left">Chofer</b-card-text>
                </b-col>
                <b-col cols= 8>
                  <b-card-text>{{ driver }}</b-card-text>
                </b-col>
              </b-row>
              <hr>
              <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="mt-3">
              Crear Viaje
              </b-button>
              </div>
            </b-container>
          </b-card>
        </b-col>
        
</div>
</b-form>
</template>

<script>
import axios from 'axios';
  export default {
    data() {
      return {
        items: [],
        buses: [],
        drivers: [],
        destinations: [],
        datetime: new Date(),
        date: '',
        time: '',
        destination: '-',
        driver: '-',
        course: '-',
        bus: '-',
        origin_selected: '-',
        course_selected: '-',
      }
    },
    mounted() {
      this.getCourses(),
      this.getBuses(),
      this.getDrivers() 
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
          this.items = response.data // Assign retrieved items
        })
      },
      getBuses() {
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/buses',
            //Authentification
            auth: {
              username: 'admin',
              password: 'destacametest'
            }
        }).then((response) => {
          this.buses = response.data // Assign retrieved items
        })
      },
      getDrivers() {
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/drivers',
            //Authentification
            auth: {
              username: 'admin',
              password: 'destacametest'
            }
        }).then((response) => {
          this.drivers = response.data // Assign retrieved items
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
      updateDestination(){
        this.destination = this.destinations.find(course => course.course_id === this.course_selected).destination
        this.course = "Trayecto " + this.course_selected
      },
      addTrip(){
        axios({
          method: 'post',
          url: 'http://127.0.0.1:8000/trips/',
          data: {
              driver: parseInt(this.driver),
              course: parseInt(this.course_selected),
              bus: parseInt(this.bus),
              departure_date: this.date,
              departure_time: this.time,
              seats_taken: 0
          },
          auth: {
              username: 'admin',
              password: 'destacametest'
          }
        }).then((response) => {
          console.log(course_selected)
            this.date = ''
            this.time = ''
            this.destination = '-'
            this.driver = '-'
            this.course = '-'
            this.bus = '-'
            this.origin_selected = '-'
            this.course_selected = '-'
        }).catch((error) => {
          console.log(error.response) // Print error on console
        })
      }
  }
}

</script>
<style lang="scss">
.bg-destacame {
    background-color: #126fe9!important;
}

</style>