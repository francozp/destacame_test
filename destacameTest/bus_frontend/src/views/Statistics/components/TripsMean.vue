<template>
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
    <template #cell(course_id)="row">
    {{ row.item.course_id }}
    </template>
</b-table>
<!-- End of Table -->
</template>

<script>
import axios from 'axios'

export default {
  name: 'TripsMean',
  data () {
    return {
      items: [],
      fields: [
            { key: 'course_id', label: 'Trayecto', sortable: true, sortDirection: 'desc' },
            { key: 'seats_taken__avg', label: 'Promedio de pasajeros', sortable: true, class: 'text-center' },
        ],
        totalRows: 15,
        currentPage: 1,
        perPage: 5,
        pageOptions: [5, 10, 15, 50],
        sortBy: '',
        sortDesc: false,
        sortDirection: 'asc'
    }
  },
  mounted () {
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
        console.log(items)
      })
    },
  }
}
</script>