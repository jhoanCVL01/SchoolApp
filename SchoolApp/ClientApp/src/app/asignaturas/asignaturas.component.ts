import { Component, OnInit, AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { AsignaturaService, Asignatura } from '../asignaturas/asignaturas.service';
import { ProfesorService, Profesor } from '../profesores/profesores.service';
import Swal from 'sweetalert2';
import { ProgramaAcademicoService,ProgramaAcademico } from '../programa/programa.service';
import { GlobalDataService } from '../auth/global-data.service';

@Component({
  selector: 'app-asignaturas',
  templateUrl: './asignaturas.component.html',
  styleUrls: ['./asignaturas.component.css']
})
export class AsignaturaComponent implements OnInit, AfterViewInit {
  @ViewChild('staticBackdrop', { static: false }) staticBackdrop?: ElementRef
  entidades: Asignatura[] = [];
  profesores: Profesor[] = []; // Array para almacenar las entidades
  programas: ProgramaAcademico[] = []; // Array para almacenar las entidades
  mensajesError: string[] = [];
  entidadSeleccionada: Asignatura = this.inicializarEntidad();
  isEditing: boolean = false;
  filtro: string = '';
  page: number = 1;
  constructor(private Service: AsignaturaService, private ProfesorService: ProfesorService, private ServicePrograma: ProgramaAcademicoService,private globalData: GlobalDataService) { }
  rolAdmin: boolean = false;
  rolStudent: boolean = false;
  rolTeacher: boolean = false;
  entidadesFiltradas(): Asignatura[] {
    // Filtra las entidades en función del valor de `filtro`
    if (!this.filtro) {
      return this.entidades;
    }
    const filtroLowerCase = this.filtro.toLowerCase();
    return this.entidades.filter(entidad =>
      entidad.nombre.toLowerCase().includes(filtroLowerCase) ||
      entidad.descripcion.toLowerCase().includes(filtroLowerCase) ||
      entidad.profesor?.nombres.toLowerCase().includes(filtroLowerCase) ||
      entidad.programaAcademico?.nombre.toLowerCase().includes(filtroLowerCase) ||
      entidad.cantidadCreditos.toString().includes(filtroLowerCase)
    );
  }
  ngOnInit(): void {

    this.obtenerEntidades();
    this.obtenerProfesores();
    this.obtenerProgramas();


    //administrador
    if (this.globalData.IdTipoUsuario == 1)
      this.rolAdmin = true;
    //Estudiante
    if (this.globalData.IdTipoUsuario == 3)
      this.rolStudent = true;
    //Profesor
    if (this.globalData.IdTipoUsuario == 4)
      this.rolTeacher = true;
  }
  ngAfterViewInit(): void {
    // Selecciona todos los formularios con la clase .needs-validation
    const forms = document.querySelectorAll('.needs-validation');

    // Aplica validación personalizada en cada formulario
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', (event: Event) => {
        // Si el formulario no es válido, previene el envío
        if (!(form as HTMLFormElement).checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      });
    });
  }
  obtenerProfesores(): void {
    this.ProfesorService.getAll().subscribe(Profesor => {
      Profesor.forEach(element => {
        if (element.estado)
          this.profesores.push(element)
      });
      console.log(Profesor)
    }
    );
  }

  obtenerProgramas(): void {
    this.ServicePrograma.getAll().subscribe(Porgrama => {
      Porgrama.forEach(element => {
        if (element.estado)
          this.programas.push(element)
      });
      console.log(Porgrama)
    }
    );
  }
  obtenerEntidades(): void {
    this.Service.getAll().subscribe(entidades => {
      this.entidades = entidades
      console.log(entidades)
    });
  }

  seleccionarEntidad(entidad: Asignatura): void {
    this.entidadSeleccionada = { ...entidad };
    this.entidadSeleccionada.idProfesor = entidad.profesor?.id
    this.entidadSeleccionada.idProgramaAcademico = entidad.programaAcademico?.id
    this.isEditing = true;
  }

  datosrequeridos(): boolean {
    this.mensajesError = []
    let continuar = true
    let contadorprofesores = 0
    this.entidades.forEach(element => {
      if (element.profesor?.id == this.entidadSeleccionada.idProfesor && element.id != this.entidadSeleccionada.id) {
        contadorprofesores++
      }
      
    });
    if (contadorprofesores >= 2) {
      continuar = false
      this.mensajesError.push('El profesor dseleccionado ya se encuentra asignado a dos asignaturas, por favor seleccione uno diferente')
    }
    return continuar
  }
  crearEntidad(): void {
    if (this.datosrequeridos())
      this.Service.create(this.entidadSeleccionada).subscribe({
        next: (entidad) => {
          // Si la creación es exitosa
          this.obtenerEntidades();
          this.entidadSeleccionada = this.inicializarEntidad();
          Swal.fire({
            title: '¡Éxito!',
            text: 'El registro se guardó correctamente.',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          });
          this.closemodal()

        },
        error: (err) => {
          // Si ocurre un error
          console.error('Error al crear la entidad:', err); // Esto es útil para depuración
          Swal.fire({
            title: 'Error',
            text: 'Ocurrió un problema al guardar el registro. Por favor, inténtalo de nuevo.',
            icon: 'error',
            confirmButtonText: 'Aceptar'
          });
        }
      });
  }
  closemodal() {
    const modalBackdrop = document.querySelector('#btnclosemodal') as HTMLElement;
    if (modalBackdrop) {
      modalBackdrop.click();
    }
  }
  actualizarEntidad(): void {
    if (this.datosrequeridos())
      this.Service.update(this.entidadSeleccionada.id, this.entidadSeleccionada).subscribe({
        next: () => {
          this.obtenerEntidades();
          this.limpiarSeleccion();
          Swal.fire({
            title: '¡Éxito!',
            text: 'El registro se actualizó correctamente.',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          });
          this.closemodal()
        },
        error: (err) => {
          console.error('Error al actualizar la entidad:', err);

          let mensaje = 'Ocurrió un problema al actualizar el registro. Por favor, inténtalo de nuevo.';
          if (err.status === 404) {
            mensaje = 'La entidad no fue encontrada. Verifica que existe antes de actualizar.';
          } else if (err.status === 500) {
            mensaje = 'Error en el servidor. Por favor, inténtalo más tarde.';
          }

          Swal.fire({
            title: 'Error',
            text: mensaje,
            icon: 'error',
            confirmButtonText: 'Aceptar'
          });
        }
      });
  }


  eliminarEntidad(id: number): void {
    // Mostrar alerta de confirmación antes de eliminar
    Swal.fire({
      title: '¿Estás seguro?',
      text: 'Esta acción no se puede deshacer.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        // Si el usuario confirma, procede con la eliminación
        this.Service.delete(id).subscribe({
          next: () => {
            // Eliminar la entidad del array si la solicitud fue exitosa
            this.entidades = this.entidades.filter(entidad => entidad.id !== id);
            Swal.fire({
              title: '¡Eliminado!',
              text: 'El registro ha sido eliminado correctamente.',
              icon: 'success',
              confirmButtonText: 'Aceptar'
            });
          },
          error: (err) => {
            console.error('Error al eliminar la entidad:', err); // Para depuración en consola

            let mensaje = 'Ocurrió un problema al intentar eliminar el registro. Por favor, inténtalo de nuevo.';
            if (err.status === 404) {
              mensaje = 'La entidad no fue encontrada. Es posible que ya haya sido eliminada.';
            } else if (err.status === 500) {
              mensaje = 'Error en el servidor. Por favor, inténtalo más tarde.';
            }

            Swal.fire({
              title: 'Error',
              text: mensaje,
              icon: 'error',
              confirmButtonText: 'Aceptar'
            });
          }
        });
      }
    });
  }

  limpiarSeleccion(): void {
    this.entidadSeleccionada = this.inicializarEntidad();
    this.isEditing = false;
  }

  private inicializarEntidad(): Asignatura {
    return {
      id: 0,
      nombre: '',
      descripcion: '',
      cantidadCreditos: 3,
      idProfesor: 0,
      estado: true
    };
  }
}
