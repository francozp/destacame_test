<template>
  <b-container fluid class="my-4">
    <!-- Search Bar --> 
    <div class="float-right">          
      <b-form-group
        label="Buscar"
        label-for="filter-input"
        label-cols-sm="3"
        label-align-sm="right"
        label-size="sm"
        class="mb-3"
      >

        <!-- The Filter -->
        <b-input-group size="sm">
          <b-form-input 
            id="filter-input"
            v-model="filter"
            type="search"
            placeholder="Ingrese su búsqueda"
          ></b-form-input>
          
          <!-- Empty filter button -->
          <b-input-group-append>
              <b-button :disabled="!filter" @click="filter = ''">Borrar</b-button>
          </b-input-group-append>
        </b-input-group>
      </b-form-group>
    </div>
    <!-- End Search Bar --> 

    <!-- Bus Creation --> 
    <div class="float-left">
      <!-- Toggle Creation Modal --> 
      <b-button @click="show=true" variant="primary">Crear Bus</b-button>
      <b-modal v-model="show" hide-footer title="Crear Bus" header-text-variant="primary">
        <b-container fluid>
          <b-form v-on:submit.prevent="addBus">
            <!-- Inputs -->
            <!-- Seats -->
            <b-row class="mb-1 text-center">
                <b-col cols=2>Asientos</b-col>
                <b-col><b-form-input v-model="seats" type="number" default=10></b-form-input></b-col>
            </b-row>
            <!-- Submit -->
            <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="float-right mt-3"
                  @click="show=false"
              >
              Crear
              </b-button>
            </div>
          </b-form>
        </b-container>
      </b-modal>
    </div>
    <!-- End of Bus Creation --> 

    <!-- Main table element -->
    <b-table
      :items="items"
      :fields="fields"
      :current-page="currentPage"
      :per-page="perPage"
      :filter="filter"
      stacked="md"
      show-empty
      small
      @filtered="onFiltered"
    >

      <!-- Row Data -->
      <template #cell(bus_id)="row">
        {{ row.item.bus_id }}
      </template>
      <!-- Edit/Delete buttons -->
      <template #cell(actions)="row">
        <b-button variant="info" size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
          Editar
        </b-button>
        <b-button variant="danger" size="sm" @click="deleteBus(row.item.bus_id)">
          Eliminar
        </b-button>
      </template>
    </b-table>
    <!-- End of Table -->

    <b-row>
      <!-- Pagination -->
     <b-col sm="5" md="6" class="my-1">
       <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          align="fill"
          size="md"
          class="my-0 float-left"
        ></b-pagination>
      </b-col>
      <!-- End of Pagination -->

      <!-- Per Page -->
      <b-col sm="7" md="6" class="my-1">
        <b-form-group
          label="Per page"
          label-for="per-page-select"
          label-cols-sm="6"
          label-cols-md="4"
          label-cols-lg="3"
          label-align-sm="right"
          label-size="sm"
          class="mb-0"
        >
          <b-form-select
            id="per-page-select"
            v-model="perPage"
            :options="pageOptions"
            size="sm"
          ></b-form-select>
        </b-form-group>
      </b-col>
      <!-- End of Per Page -->
    </b-row>

    <!-- Update Modal -->
    <div class="float-left">
      <b-modal :id="infoModal.id" :title="infoModal.title" hide-footer ok-only @hide="resetInfoModal" header-text-variant="primary">
        <b-container fluid>
          <b-form>
          <!-- Form -->
          <b-row class="mb-1 text-center">
              <b-col cols=2>Asientos</b-col>
              <b-col><b-form-input v-model="infoModal.seats" type="number"></b-form-input></b-col>
          </b-row>
          <!-- Submit and call updateBus -->
          <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="float-right mt-3"
                  @click="updateBus(infoModal.bus_id, infoModal.seats)"
              >
              Editar
              </b-button>
          </div>
          </b-form>
        </b-container>
      </b-modal>
    </div>
    <!-- End of Update Modal -->
  </b-container>
</template>

<script>
import axios from 'axios';
  export default {
    data() {
        return {
            items: [],
            show: false,
            seats: 10,
            fields: [
            { key: 'bus_id', label: 'Id del bus', sortable: true, sortDirection: 'desc' },
            { key: 'seats', label: 'Asientos por bus', sortable: true, class: 'text-center' },
            { key: 'actions', label: 'Actions' },
            ],
            
            totalRows: 15,
            currentPage: 1,
            perPage: 5,
            pageOptions: [5, 10, 15, 50],
            sortBy: '',
            sortDesc: false,
            sortDirection: 'asc',
            filter: null,
            filterOn: [],
            infoModal: {
              id: 'info-modal',
              title: '',
              content: []
            }
        }
        },
        mounted() {
            this.getBuses()    
        },
        methods: {
            getBuses() {
                axios({
                    method: 'get',
                    url: 'http://127.0.0.1:8000/buses/',
                    auth: {
                      username: 'admin',
                      password: 'destacametest'
                    }
                }).then((response) => {
                  this.items = response.data
                  this.totalRows = this.items.length
                  })
            },

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
                  this.getBuses() // Update Table
                  this.seats = 10
                  }).catch((error) => {
                  console.log(error)
                  })
              }
            },

            deleteBus(bus_id) {
              axios({
                method: 'delete',
                url: 'http://127.0.0.1:8000/buses/' + bus_id + '/',
                auth: {
                  username: 'admin',
                  password: 'destacametest'
                }
              }).then(response => { // Delete the item from the table
                  const index = this.items.findIndex(item => item.bus_id === bus_id) // find index on table
                  this.totalRows -= 1
                  console.log("Eliminado")
                  if (~index) // check if the item exists
                    this.items.splice(index, 1) // Delete
              });
            },

            updateBus(bus_id, seats) {
              axios({
                method: 'put',
                data: {
                  seats: seats
                },
                url: 'http://127.0.0.1:8000/buses/' + bus_id + '/',
                auth: {
                  username: 'admin',
                  password: 'destacametest'
                }
              })
            },

            info(item, index, button) {
                this.infoModal.title = "Editar Bus: " + item.bus_id
                this.infoModal.seats = item.seats
                this.infoModal.bus_id = item.bus_id
                this.$root.$emit('bv::show::modal', this.infoModal.id, button)
            },

            resetInfoModal() {
                this.infoModal.title = ''
                this.infoModal.content = []
            },
            onFiltered(filteredItems) {
                // Trigger pagination to update the number of buttons/pages due to filtering
                this.totalRows = filteredItems.length
                this.currentPage = 1
            }
        }
  }
</script>