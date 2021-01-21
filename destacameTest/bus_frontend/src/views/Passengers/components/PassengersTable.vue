<template>
  <b-container fluid class="my-4">
    <b-alert v-model="showAlert" variant="success" dismissible>
      ¡El pasajero se ha creado exitosamente!
    </b-alert>
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

    <!-- Passenger Creation --> 
    <div class="float-left">
      <!-- Toggle Creation Modal --> 
      <b-button @click="show=true" variant="primary">Crear Pasajero</b-button>
      <b-modal v-model="show" hide-footer title="Crear Pasajero" header-text-variant="primary">
        <b-container fluid>
          <b-form v-on:submit.prevent="addPassenger" @submit="checkForm">
            <!-- Inputs -->
            <!-- Seats -->
            <b-row class="mb-1">
                <b-col>RUT</b-col>
                <b-col>
                  <b-form-input 
                    v-model="rut"
                    :state="rutState"
                    aria-describedby="invalid-rut" 
                    type="text" 
                    required
                    placeholder=11111111>
                  </b-form-input>
                  <b-form-invalid-feedback id="invalid-rut">
                    Ingrese RUT válido, sin puntos, guión, ni codigo verificador.
                  </b-form-invalid-feedback>
                </b-col>
            </b-row>
            <b-row class="mb-1">
                <b-col>Nombre</b-col>
                <b-col>
                  <b-form-input 
                    v-model="name" 
                    type="text" 
                    required
                    :state="nameState"
                    aria-describedby="invalid-name" 
                    placeholder="Juan">
                  </b-form-input>
                  <b-form-invalid-feedback id="invalid-name">
                    Ingrese un nombre con menos de 30 caracteres.
                  </b-form-invalid-feedback>
                </b-col>
            </b-row>
            <b-row class="mb-1">
                <b-col>Apellido</b-col>
                <b-col>
                <b-form-input 
                  v-model="lastname" 
                  type="text" 
                  :state="lastnameState"
                  required
                  aria-describedby="invalid-lastname" 
                  placeholder="Perez">
                </b-form-input>
                <b-form-invalid-feedback id="invalid-lastname">
                  Ingrese un apellido con menos de 30 caracteres.
                </b-form-invalid-feedback>
                </b-col>
            </b-row>
            <b-row class="mb-1">
                <b-col>Fecha de Nacimiento</b-col>
                <b-col>
                <b-form-input 
                  v-model="birthday"
                  min= '1900-01-01'
                  required
                  type="date">
                </b-form-input>
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
    <!-- End of Passenger Creation --> 

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
      <template #cell(rut)="row">
        {{ row.item.rut }}
      </template>
      <!-- Edit/Delete buttons -->
      <template #cell(actions)="row">
        <b-button variant="info" size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
          Editar
        </b-button>
        <b-button variant="danger" size="sm" @click="deletePassenger(row.item.rut)">
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
              <b-col>Nombre</b-col>
              <b-col>
                <b-form-input 
                  v-model="infoModal.name" 
                  type="text" 
                  required
                  :state="nameState"
                  aria-describedby="invalid-name" 
                  placeholder="Juan">
                </b-form-input>
                <b-form-invalid-feedback id="invalid-name">
                  Ingrese un nombre con menos de 30 caracteres.
                </b-form-invalid-feedback>
              </b-col>
          </b-row>
          <b-row class="mb-1">
              <b-col>Apellido</b-col>
              <b-col>
              <b-form-input 
                v-model="infoModal.lastname" 
                type="text" 
                :state="lastnameState"
                required
                aria-describedby="invalid-lastname" 
                placeholder="Perez">
              </b-form-input>
              <b-form-invalid-feedback id="invalid-lastname">
                Ingrese un apellido con menos de 30 caracteres.
              </b-form-invalid-feedback>
              </b-col>
          </b-row>
          <b-row class="mb-1">
              <b-col>Fecha de Nacimiento</b-col>
              <b-col>
              <b-form-input 
                v-model="infoModal.birthday"
                min= '1900-01-01'
                required
                type="date">
              </b-form-input>
              </b-col>
          </b-row>
          <!-- Submit and call updatePassenger -->
          <div class="w-100">
              <b-button
                  type="submit"
                  variant="primary"
                  size="md"
                  class="float-right mt-3"
                  @click="updatePassenger(infoModal.rut, infoModal.name, infoModal.lastname, infoModal.birthday)"
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
          rut: '',
          name: '',
          lastname: '',
          birthday: '1990-01-01',
          showAlert: false,
          errors: [],
          // Fields of table
          fields: [
            { key: 'rut', label: 'RUT', sortable: true, sortDirection: 'desc' },
            { key: 'name', label: 'Nombre', sortable: true, class: 'text-center' },
            { key: 'lastname', label: 'Apellido', sortable: true},
            { key: 'birthday', label: 'Fecha de Nacimiento', sortable: true },
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
        this.getPassengers() //Retrieve data for the table   
    },
    computed: {
      rutState() {
        // Verify state of Rut Input
        if(this.rut.length <= 8 & this.rut.length > 6 & !isNaN(this.rut)){
          this.errors["rut"] = ''
          return true
        }
        else if(this.rut.length == 0){
          return null
        }
        else{
          this.errors["rut"] = 'Rut Invalido'
          return false
        }
      },
      nameState() {
        // Verify state of Name Input
        if(this.name.length > 0 & this.name.length <= 30){
          return true
        }
        else if(this.name.length == 0){
          return null
        }
        else{
          return false
        }
      },
      lastnameState() {
        // Verify state of LastName Input
        if(this.lastname.length > 0 & this.lastname.length <= 30){
          return true
        }
        else if(this.lastname.length == 0){
          return null
        }
        else{
          return false
        }
      }
    },
    methods: {
      // Check the state of the modal for hide it
      checkModal(){
        if(this.rutState & this.nameState & this.lastnameState){
         this.show = false
        }
      },
      getPassengers() {
        // Obtain items from Passengers Model using axios to connect to the backend
        axios({
            method: 'get',
            url: 'http://127.0.0.1:8000/passengers/',
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

      addPassenger() {
        // Create items from Passengers Model using axios to connect to the backend
        // Check if seats value exists
        axios({
          method: 'post',
          url: 'http://127.0.0.1:8000/passengers/',
          data: {
              rut: parseInt(this.rut),
              name: this.name,
              lastname: this.lastname,
              birthday: this.birthday
          },
          auth: {
              username: 'admin',
              password: 'destacametest'
          }
        }).then((response) => {
          this.getPassengers() // Update Table
          this.rut = ''
          this.name = ''
          this.lastname = ''
          this.birthday = '1990-01-01'
          this.showAlert = true
        }).catch((error) => {
          console.log(error) // Print error on console
        })
      },

      deletePassenger(rut) {
        // Delete items from Passenger Model using axios to connect to the backend
        axios({
          method: 'delete',
          url: 'http://127.0.0.1:8000/passengers/' + rut + '/',
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
        }).then(response => { // Delete the item from the table
            const index = this.items.findIndex(item => item.rut === rut) // find index on table
            this.totalRows -= 1
            if (~index) // check if the item exists
              this.items.splice(index, 1) // Delete 
        });
      },

      updatePassenger(rut, name, lastname, birthday) {
        // Update items from Passenger Model using axios to connect to the backend
        axios({
          method: 'put',
          data: {
            rut: rut,
            name: name,
            lastname: lastname,
            birthday: birthday
          },
          url: 'http://127.0.0.1:8000/passengers/' + rut + '/',
          auth: {
            username: 'admin',
            password: 'destacametest'
          }
        })
      },

      info(item, index, button) {
        // Opens the modal with item information
          this.infoModal.title = "Editar Pasajero Rut: " + item.rut
          this.infoModal.rut = item.rut
          this.infoModal.name = item.name
          this.infoModal.lastname = item.lastname
          this.infoModal.birthday = item.birthday
          this.$root.$emit('bv::show::modal', this.infoModal.id, button)
      },
      checkForm(e){
        if(this.rutState & this.nameState & this.lastnameState){
          return true
        }
        else{
          e.preventDefault();
        }
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