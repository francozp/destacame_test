<template>
<div class="row justify-content-center align-self-center h-100">
        <b-card class="shadow-lg rounded" bg-variant="destacame" text-variant="white">
          <b-row>
          <b-card-title>Detalles del Viaje</b-card-title>
          </b-row>
          <b-row class="pb-3">
            <b-col class="my-1">
              <label for="date">Fecha</label>
              <b-form-input 
                min= '1900-01-01'
                id= "date"
                required
                size="md"
                type="date">
              </b-form-input>
            </b-col>
            <b-col class="my-1">
              <label for="time">Hora de salida</label>
              <b-form-input 
                required
                id= "time"
                size="md"
                type="time">
              </b-form-input>
            </b-col>
          </b-row>
          <b-row>
            <b-col>
              <label for="origin">Origen</label>
              <b-form-select 
                id="origin" 
                @change = "getDestination()"
                v-model="origin_selected" 
                :options="items" 
                value-field='origin' 
                text-field='origin' 
                size="sm" 
                class="mt-3">
              </b-form-select>
            </b-col>
            <b-col>
              <label for="destination">Destino</label>
              <b-form-select 
                id="course_id" 
                @change = "getBusesAndDrivers()"
                v-model="course_selected" 
                :options="destinations" 
                value-field='course_id' 
                text-field='destination' 
                size="sm" 
                class="mt-3">
              </b-form-select>
            </b-col>
          </b-row>
        </b-card>
</div>
</template>

<script>
import axios from 'axios';
  export default {
    data() {
      return {
        items: [],
        destinations: [],
        origin_selected: '',
        course_selected: '',
      }
    },
    mounted() {
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
          this.items = response.data // Assign retrieved items
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
          this.destinations = response.data // Assign retrieved items
          console.log(this.origin_selected)
        })
      },
      getBusesAndDrivers(){
        console.log(this.course_selected)
      }
  }
}
</script>
<style lang="scss">
.bg-destacame {
    background-color: #126fe9!important;
}
.btn-secondary{
    color: #495057 !important;
    background-color:  #fff !important;
    border-color:  #fff !important;
}
</style>