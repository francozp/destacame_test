<template>
<b-container>
  <!-- Statistics table -->
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
    <template #cell(course_id)="row">
        {{ row.item.course_id }}
    </template>
    <template #cell(actions)="row">
      <div>
        <!-- Percentage Input by Row -->
        <b-form-input type="number" min=1 max=99 v-model="row.item.percentage" variant="info" size="sm" style="width: 20%;display:inline">
        </b-form-input>
        <b-button variant="info" size="sm" @click="info(row.item, row.index, $event.target)">
          Filtrar
        </b-button>
      </div>
    </template>
  </b-table>
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
  <!-- Modal that shows filtered buses by course -->
  <div class="float-left">
    <b-modal :id="infoModal.id" :title="infoModal.title" hide-footer ok-only header-text-variant="primary">
      <b-container fluid>
        <!-- If buses exists -->
        <template v-if="buses.length">
          <b-card-group deck v-for="item in buses" :key="item.bus_id">
           <b-card>
              <b-row class="d-flex align-items-center">
                <b-col cols=4> 
                  <img src="@/assets/images/navbar-logo.svg" style="height: 22px;margin: 5px;" class="d-inline-block align-top" alt="Destacame Buses">                  
                </b-col>
                <b-col cols=4>
                  <strong>Trayecto {{ course_id }}</strong>
                  </b-col>
                  <b-col cols=4|>
                          <strong>Bus {{ item.bus_id }}</strong>
                  </b-col>
              </b-row>
          </b-card>
        </b-card-group>
        
        </template>
        <template v-else>
          No hay buses que cumplan esta ocupación para este trayecto
        </template>
      </b-container>
    </b-modal>
  </div>
</b-container>
</template>

<script>
import axios from 'axios'

export default {
  name: 'TripsMean',
  data () {
    return {
      items: [],
      buses: [],
      fields: [
            { key: 'course_id', label: 'Trayecto', sortable: true, sortDirection: 'desc' },
            { key: 'seats_taken__avg', label: 'Promedio de pasajeros', sortable: true, class: 'text-center' },
            { key: 'actions', label: 'Filtrar Buses' },
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
        course_id: 0,
        infoModal: {
            id: 'info-modal',
            title: '',
            content: []
          }
    }
  },
  mounted () {
    //Retrieve data for the table
    this.get_trips_mean()
  },
  methods: {
    // Obtains the mean of passengers by trip
    get_trips_mean(){
      axios({
          method: 'get',
          url: 'http://127.0.0.1:8000/trips/get_trips_mean',
          //Authentification
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
      }).then((response) => {
        this.items = response.data // Assign retrieved items
        this.totalRows = this.items.length 
      })
    },
    // Get buses that have a passenger occupation greater than N for an specific course
    get_bus_capacity(course_id, percentage){
      axios({
          method: 'get',
          url: 'http://127.0.0.1:8000/trips/get_bus_capacity/?course_id=' + course_id + '&N=' + percentage/10,
          //Authentification
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
      }).then((response) => {
        this.buses = response.data // Assign retrieved items
      })
    },
    // Get the information for the modal and show it
    info(item, index, button) {
        this.get_bus_capacity(item.course_id, item.percentage)
        this.course_id = item.course_id
        this.infoModal.title = "Buses con más de " + item.percentage + "% de ocupación"
        this.$root.$emit('bv::show::modal', this.infoModal.id, button)
    },
      onFiltered(filteredItems) {
          // Trigger pagination to update the number of buttons/pages due to filtering
          this.totalRows = filteredItems.length
          this.currentPage = 1
      }
  }
}
</script>