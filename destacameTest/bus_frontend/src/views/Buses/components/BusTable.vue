<template>
  <b-container fluid class="my-4">

    <div class="float-right">
            <!-- Search -->
            
            <b-form-group
            label="Buscar"
            label-for="filter-input"
            label-cols-sm="3"
            label-align-sm="right"
            label-size="sm"
            class="mb-3"
            >
            <b-input-group size="sm">
                <b-form-input
                id="filter-input"
                v-model="filter"
                type="search"
                placeholder="Ingrese su búsqueda"
                ></b-form-input>

                <b-input-group-append>
                <b-button :disabled="!filter" @click="filter = ''">Borrar</b-button>
                </b-input-group-append>
            </b-input-group>
            </b-form-group>
    </div>
    <div class="float-left">
        <create-bus-modal></create-bus-modal>
    </div>
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
      <template #cell(bus_id)="row">
        {{ row.item.bus_id }}
      </template>

    <template #cell(actions)="row">
        <b-button variant="info" size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
          Editar
        </b-button>
        <b-button variant="danger" size="sm" @click="row.toggleDetails">
          Eliminar
        </b-button>
      </template>
    </b-table>
    <b-row>
     <b-col sm="5" md="6" class="my-1">
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

      <b-col sm="7" md="6" class="my-1">
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          align="fill"
          size="sm"
          class="my-0"
        ></b-pagination>
      </b-col>
    </b-row>
    <!-- Info modal -->
    <b-modal :id="infoModal.id" :title="infoModal.title" ok-only @hide="resetInfoModal">
      <pre>{{ infoModal.content }}</pre>
    </b-modal>
  </b-container>
</template>

<script>
import axios from 'axios';
import CreateBusModal from './CreateBusModal.vue';
  export default {
  components: { CreateBusModal },
    data() {
        components: {
            CreateBusModal
        }
        return {
            items: [],
            fields: [
            { key: 'bus_id', label: 'Id del bus', sortable: true, sortDirection: 'desc' },
            { key: 'seats', label: 'Asientos por bus', sortable: true, class: 'text-center' },
            { key: 'actions', label: 'Actions' },
            ],
            
            totalRows: 1,
            currentPage: 1,
            perPage: 5,
            pageOptions: [5, 10, 15, { value: 100, text: "Show a lot" }],
            sortBy: '',
            sortDesc: false,
            sortDirection: 'asc',
            filter: null,
            filterOn: [],
            infoModal: {
            id: 'info-modal',
            title: '',
            content: ''
            }
        }
        },
        mounted() {
            this.getBuses(),
            // Set the initial number of items
            this.totalRows = this.items.length
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
                }).then(response => this.items = response.data)
            },

            info(item, index, button) {
                this.infoModal.title = `Row index: ${index}`
                this.infoModal.content = JSON.stringify(item, null, 2)
                this.$root.$emit('bv::show::modal', this.infoModal.id, button)
            },
            resetInfoModal() {
                this.infoModal.title = ''
                this.infoModal.content = ''
            },
            onFiltered(filteredItems) {
                // Trigger pagination to update the number of buttons/pages due to filtering
                this.totalRows = filteredItems.length
                this.currentPage = 1
            }
        }
  }
</script>

<style lang="scss">

</style>