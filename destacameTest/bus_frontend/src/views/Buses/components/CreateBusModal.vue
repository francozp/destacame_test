<template>
<div>
    <b-button @click="show=true" variant="primary">Crear Bus</b-button>
    <b-modal v-model="show" hide-footer title="Crear Bus" header-text-variant="primary">
    <b-container fluid>
        <b-form v-on:submit.prevent="addBus">
        <b-row class="mb-1 text-center">
            <b-col cols=2>Asientos</b-col>
            <b-col><b-form-input v-model="seats" type="number" default=10></b-form-input></b-col>
        </b-row>
        <div class="w-100">
            <b-button
                type="submit"
                variant="primary"
                size="sm"
                class="float-right"
                @click="show=false"
            >
            Crear
            </b-button>
        </div>
        </b-form>
    </b-container>
    </b-modal>

</div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'CreateBusModal',
    data() {
        return {
        show: false,
        seats: 10,
        }
    },
    methods: {
        addBus() {
            if (this.seats) {
                axios({
                method: 'post',
                url: 'http://127.0.0.1:8000/buses/',
                data: {
                    seats: this.seats
                },
                auth: {
                    username: 'admin',
                    password: 'destacametest'
                }
                }).then((response) => {
                let newBus = {
                    "id": response.data.id,
                    "seats": this.seats
                }
                this.buses.push(newBus)
                this.seats = 0
                }).catch((error) => {
                console.log(error)
                })
            }
        }
    }
  }
</script>