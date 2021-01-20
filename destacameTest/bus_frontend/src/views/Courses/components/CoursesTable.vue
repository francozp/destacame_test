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

    <!-- Course Creation --> 
    <div class="float-left">
      <!-- Toggle Creation Modal --> 
      <b-button @click="show=true" variant="primary">Crear Trayecto</b-button>
      <b-modal v-model="show" hide-footer title="Crear Trayecto" header-text-variant="primary">
        <b-container fluid>
          <b-form v-on:submit.prevent="addCourse">
            <!-- Inputs -->
            <b-row class="mb-1">
                <b-col>Origen</b-col>
                <b-col>
                  <b-form-input 
                    v-model="origin"
                    :state="originState"
                    aria-describedby="invalid-origin" 
                    type="text" 
                    required
                    placeholder=Santiago>
                  </b-form-input>
                  <b-form-invalid-feedback id="invalid-origin">
                    Ingrese un origen con menos de 30 caracteres.
                  </b-form-invalid-feedback>
                </b-col>
            </b-row>
            <b-row class="mb-1">
                <b-col>Destino</b-col>
                <b-col>
                  <b-form-input 
                    v-model="destination" 
                    type="text" 
                    required
                    :state="destinationState"
                    aria-describedby="invalid-destination" 
                    placeholder="Arica">
                  </b-form-input>
                  <b-form-invalid-feedback id="invalid-destination">
                    Ingrese un destino con menos de 30 caracteres.
                  </b-form-invalid-feedback>
                </b-col>
            </b-row>
            <!-- Submit -->
            <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="float-right mt-3"
                  @click="checkModal"
              >
              Crear
              </b-button>
            </div>
          </b-form>
        </b-container>
      </b-modal>
    </div>
    <!-- End of Course Creation --> 

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
      <template #cell(course_id)="row">
        {{ row.item.course_id }}
      </template>
      <!-- Edit/Delete buttons -->
      <template #cell(actions)="row">
        <b-button variant="info" size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
          Editar
        </b-button>
        <b-button variant="danger" size="sm" @click="deleteCourse(row.item.course_id)">
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
          <b-row class="mb-1">
              <b-col>Origen</b-col>
              <b-col>
                <b-form-input 
                  v-model="infoModal.origin"
                  :state="originState"
                  aria-describedby="invalid-origin" 
                  type="text" 
                  required
                  placeholder=Santiago>
                </b-form-input>
                <b-form-invalid-feedback id="invalid-origin">
                  Ingrese un origen con menos de 30 caracteres.
                </b-form-invalid-feedback>
              </b-col>
          </b-row>
          <b-row class="mb-1">
              <b-col>Destino</b-col>
              <b-col>
                <b-form-input 
                  v-model="infoModal.destination" 
                  type="text" 
                  required
                  :state="destinationState"
                  aria-describedby="invalid-destination" 
                  placeholder="Arica">
                </b-form-input>
                <b-form-invalid-feedback id="invalid-destination">
                  Ingrese un destino con menos de 30 caracteres.
                </b-form-invalid-feedback>
              </b-col>
          </b-row>
          <!-- Submit and call updateCourse -->
          <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="float-right mt-3"
                  @click="updateCourse(infoModal.course_id, infoModal.origin, infoModal.destination)"
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
          origin: '',
          destination: '',
          // Fields of table
          fields: [
            { key: 'course_id', label: 'Id del trayecto', sortable: true, sortDirection: 'desc' },
            { key: 'origin', label: 'Origen', sortable: true, class: 'text-center' },
            { key: 'destination', label: 'Destino', sortable: true, class: 'text-center' },
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
      // Retrieve data for table
      this.getCourses()    
    },
    computed: {
      // Verify state of Origin Input
      originState() {
        if(this.origin.length > 0 & this.origin.length <= 30){
          return true
        }
        else if(this.origin.length == 0){
          return null
        }
        else{
          return false
        }
      },
      // Verify state of Destination Input
      destinationState() {
        if(this.destination.length > 0 & this.destination.length <= 30){
          return true
        }
        else if(this.destination.length == 0){
          return null
        }
        else{
          return false
        }
      }
    },
    methods: {
      checkModal(){
        // Check the state of the modal for hide it
        if(this.originState & this.destinationState){
         this.show = false
        }
      },
      getCourses() {
        // Obtain items from Courses Model using axios to connect to the backend
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/courses/',
            //Authentification
            auth: {
              username: 'admin',
              password: 'destacametest'
            }
        }).then((response) => {
          this.items = response.data // Assign retrieved items
          this.totalRows = this.items.length // Update rows qty from table
        })
      },

      addCourse() {
        // Create items from Courses Model using axios to connect to the backend
        axios({
          method: 'post',
          url: 'http://127.0.0.1:8000/courses/',
          data: {
              origin: this.origin,
              destination: this.destination
          },
          auth: {
              username: 'admin',
              password: 'destacametest'
          }
        }).then((response) => {
          this.getCourses() // Update Table
          this.origin = ''
          this.destination = ''
        }).catch((error) => {
          console.log(error) // Print error on console
        })
      },

      deleteCourse(course_id) {
        // Delete items from Courses Model using axios to connect to the backend
        axios({
          method: 'delete',
          url: 'http://127.0.0.1:8000/courses/' + course_id + '/',
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
        }).then(response => { // Delete the item from the table
            const index = this.items.findIndex(item => item.course_id === course_id) // find index on table
            this.totalRows -= 1
            if (~index) // check if the item exists
              this.items.splice(index, 1) // Delete 
        });
      },

      updateCourse(course_id, origin, destination) {
        // Update items from Courses Model using axios to connect to the backend
        axios({
          method: 'put',
          data: {
            origin: origin,
            destination: destination
          },
          url: 'http://127.0.0.1:8000/courses/' + course_id + '/',
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
        })
      },

      info(item, index, button) {
        // Opens the modal with item information
          this.infoModal.title = "Editar Trayecto " + item.course_id
          this.infoModal.course_id = item.course_id
          this.infoModal.origin = item.origin
          this.infoModal.destination = item.destination
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