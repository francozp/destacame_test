<template>
    <div class="seatReservation">
     <b-card class="w-100 shadow-lg rounded mb-1"  bg-variant="destacame" text-variant="white">
        <b-card-body style="padding:0.5rem">
            <b-row class="pb-1 pt-1">
                <b-col>
                <b-card-text style="font-size:1.3rem"> Servicio: {{ origin }} a {{ destination }}</b-card-text> 
                </b-col>
                <b-col>
                <b-card-text style="font-size:1.3rem">Fecha: {{ date }}</b-card-text>
                </b-col>
            </b-row>
        </b-card-body>
     </b-card>

    <b-card-group deck v-for="item in items" :key="item.trip_id">
        <b-card>
            <b-row class="d-flex align-items-center">
                <b-col cols=4 md=2> 
                     <img src="@/assets/images/navbar-logo.svg" style="height: 22px;margin: 5px;" class="d-inline-block align-top" alt="Destacame Buses">                  
                </b-col>
                <b-col cols=4 md=2 >
                        <strong>Origen</strong><br>
                        {{ origin }}
                </b-col>
                <b-col cols=4 md=2>
                    <font-awesome-icon icon="bus"/>
                </b-col>
                <b-col cols=4 md=2>
                        <strong>Destino</strong><br>
                        {{ destination }}
                </b-col>
                <b-col cols=4 md=2>
                    <strong>Horario</strong>
                    <b-card-text>{{ item.departure_date }}</b-card-text>
                    <b-card-text>{{ item.departure_time }}</b-card-text>
                </b-col>
                <b-col cols=4 md=2>
                   <b-button variant="primary" size="sm" @click="info(item, $event.target)" class="mr-1">
                    Ver Asientos
                   </b-button>
                </b-col>
            </b-row>
        </b-card>
    </b-card-group>
    <!-- Update Modal -->
    <div class="float-left">
      <b-modal :id="infoModal.id" :title="infoModal.title" hide-footer ok-only header-text-variant="primary">
        <b-form v-on:submit.prevent="addSeatToTrip">
        <b-container class="px-5" fluid>
            <b-row>
            <b-col cols=4>
            <template v-for="(row,key,index) in seats">
              <b-row>
              <b-col v-for="(place) in row" :key="place.seat">
                  <div class="seat">
                    <div v-if="place.state === 0">  
                      <input type="radio" :id="place.seat" :value="place.seat" v-model="seats_input" />
                      <label :for="place.seat" class="px-2 py-1">{{ place.seat }}</label>
                    </div>
                    <div v-else>
                      <input type="radio" v-model="seats_input" disabled :id="place.seat" :value="place.seat" />
                      <label :for="place.seat" class="px-2 py-1">{{ place.seat }}</label>
                    </div>
                  </div>
              </b-col>
              </b-row>
            </template>
            </b-col>
            <b-col cols=8 >
                <div class="container ml-5">
                  <b-card-text class="d-flex align-items-center"><label class="mr-2 leyend"></label>Reservado </b-card-text>
                  <b-card-text class="d-flex align-items-center"><label class="mr-2 leyend" style="background: #83b8ff;"></label>Libre</b-card-text>
                  <b-card-text class="d-flex align-items-center"><label class="mr-2 leyend" style="background: #126fe9;"></label>Seleccionado</b-card-text>
                </div>
              </b-col>
            </b-row>
        </b-container>
        <!-- Submit and call updateBus -->
            <div class="w-100 pr-2">  
                <b-button
                    type="submit"
                    variant="primary"
                    size="md"
                    class="float-right mt-3"
                    @click="makeReservation"
                >
                Reservar Asientos
                </b-button>
            </div>
        </b-form>
      </b-modal>
    </div>
    <!-- End of Update Modal -->
  </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return{
            rut: this.$route.query.rut,
            course_id: this.$route.query.course,
            date: this.$route.query.date,
            items: [],
            seats: [],
            seats_input: '',
            destination: '',
            origin: '',
            infoModal: {
                id: 'info-modal',
                title: '',
                content: []
            }
          }
    },
    mounted(){
        this.searchTrips(),
        this.searchCourse()
    },
    methods: {
        searchCourse(){
            axios({
                method: 'get',
                url: 'http://127.0.0.1:8000/courses/'+this.course_id+'/',
                auth: {
                    username: 'admin',
                    password: 'destacametest'
                }
            }).then((response) => {
                this.origin = response.data.origin
                this.destination = response.data.destination // Assign retrieved items
            })
        },
        searchTrips(){
            axios({
                method: 'get',
                url: 'http://127.0.0.1:8000/trips/get_trips/?course='+this.course_id+'&date='+this.date,
                auth: {
                    username: 'admin',
                    password: 'destacametest'
                }
            }).then((response) => {
                this.items = response.data // Assign retrieved items
            })
        },
        info(item, button) {
            this.trip = item.trip_id
            this.getTripSeats(),
            this.infoModal.title = 'Ver Asientos'
            this.infoModal.content = item,
            this.$root.$emit('bv::show::modal', this.infoModal.id, button)
        },
        resetInfoModal() {
          this.infoModal.title = ''
          this.infoModal.content = []
      },
      getTripSeats(){
        axios({
                method: 'get',
                url: 'http://127.0.0.1:8000/passenger_seats/get_seats/?trip_id=' + this.trip,
                auth: {
                    username: 'admin',
                    password: 'destacametest'
                }
            }).then((response) => {
                this.seats = response.data // Assign retrieved items
            })
      },
      makeReservation(){
        axios({
                method: 'post',
                url: 'http://127.0.0.1:8000/passenger_seats/',
                data: {
                  passenger_rut: parseInt(this.rut),
                  trip: this.trip,
                  seat: parseInt(this.seats_input)
                },
                auth: {
                    username: 'admin',
                    password: 'destacametest'
                }
            }).then((response) => {
              this.$router.push({ name: 'Home' })
        }).catch((error) => {
          console.log(error) // Print error on console
        })        
      },
      addSeatToTrip(){
        axios({
          method: 'get',
          url: 'http://127.0.0.1:8000/trips/add_seat/?trip_id=' + this.trip,
          auth: {
                    username: 'admin',
                    password: 'destacametest'
          }
        })
      }
    }
}
</script>

<style lang="scss">
.card-text {
    margin-top: 0;
    margin-bottom: 0;
}

.seat {
  display: flex;
  flex: 0 0 14.28571428571429%;
  padding: 1px;
  position: relative;  
  &:nth-child(3) {
    margin-right: 14.28571428571429%;
  }
  input[type=radio] {
    position: absolute;
    opacity: 0;
    + label {
      color:white;
      border-top-left-radius: 25%;
      border-top-right-radius: 25%;
      background: #83b8ff;
    }
  }
  input[type=radio]:checked {
    + label {
      background: #126fe9;      
    }
  }
  input[type=radio]:disabled {
    + label {
      background: rgb(210, 210, 210);
      overflow: hidden;
    }
    }
}

.leyend{
  color:white;
  border-top-left-radius: 25%;
  border-top-right-radius: 25%;
  background: rgb(210, 210, 210);
  padding-top: 1.8rem;
  padding-left: 1.3rem;
}

</style>