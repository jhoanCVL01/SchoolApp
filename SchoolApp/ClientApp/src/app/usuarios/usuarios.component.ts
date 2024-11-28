import { Component, OnInit, AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { UsuarioService, Usuario, TipoUsuario } from '../usuarios/usuarios.service';
import { ProfesorService, Profesor } from '../profesores/profesores.service';
import { EstudianteService, Estudiante } from '../estudiantes/estudiantes.service';
import { Observable, OperatorFunction } from 'rxjs';
import { debounceTime, map, } from 'rxjs/operators';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuarioComponent implements OnInit, AfterViewInit {
  @ViewChild('staticBackdrop', { static: false }) staticBackdrop?: ElementRef

  search: OperatorFunction<string, readonly { nombres: string }[]> = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(200),
      map((term) =>
        term === '' ? [] : this.profesores.filter((v) => v.nombres.toLowerCase().indexOf(term.toLowerCase()) > -1).slice(0, 10),
      ),
    );
  formatter = (x: { nombres: string }) => x.nombres;

  searchst: OperatorFunction<string, readonly { nombres: string }[]> = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(200),
      map((term) =>
        term === '' ? [] : this.estudiantes.filter((v) => v.nombres.toLowerCase().indexOf(term.toLowerCase()) > -1).slice(0, 10),
      ),
    );
  formatterst = (x: { nombres: string }) => x.nombres;

  entidades: Usuario[] = [];
  profesores: Profesor[] = []; // Array para almacenar las entidades
  estudiantes: Estudiante[] = []; // Array para almacenar las entidades
  tiposusuario: TipoUsuario[] = []; // Array para almacenar las entidades
  mensajesError: string[] = [];
  entidadSeleccionada: Usuario = this.inicializarEntidad();
  isEditing: boolean = false;
  filtro: string = '';
  page: number = 1;
  constructor(private Service: UsuarioService, private ProfesorService: ProfesorService, private EstudianteService: EstudianteService) { }
  entidadesFiltradas(): Usuario[] {
    // Filtra las entidades en función del valor de `filtro`
    if (!this.filtro) {
      return this.entidades;
    }
    const filtroLowerCase = this.filtro.toLowerCase();
    return this.entidades.filter(entidad =>
      entidad.username.toLowerCase().includes(filtroLowerCase)
    );
  }
  ngOnInit(): void {

    this.obtenerEntidades();
    this.obtenerProfesores();
    this.obtenerEstudiantes();
    this.obtenerTipoUsuarios();
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
  obtenerEstudiantes(): void {
    this.EstudianteService.getAll().subscribe(Estudiante => {
      Estudiante.forEach(element => {
        if (element.estado)
          this.estudiantes.push(element)
      });
      console.log(Estudiante)
    }
    );
  }
  obtenerTipoUsuarios(): void {
    this.Service.getTipoUsuario().subscribe(TipoUsuarios => {
      this.tiposusuario = TipoUsuarios
      console.log(TipoUsuarios)
    }
    );
  }

  obtenerEntidades(): void {
    this.Service.getAll().subscribe(entidades => {
      this.entidades = entidades
      console.log(entidades)
    });
  }

  seleccionarEntidad(entidad: Usuario): void {
    this.entidadSeleccionada = { ...entidad };
    this.entidadSeleccionada.idTipoUsuario = entidad.tipoUsuario?.id
    this.entidadSeleccionada.idEstudiante = entidad.estudiante?.id;
    this.entidadSeleccionada.idProfesor = entidad.profesor?.id;
    this.isEditing = true;
  }

  datosrequeridos(): boolean {
    this.mensajesError = []
    let continuar = true
    let contadorprofesores = 0
    if (this.entidadSeleccionada.idTipoUsuario == 3) {
      if (this.entidadSeleccionada.estudiante?.id == null || this.entidadSeleccionada.estudiante?.id == 0) {
        continuar = false; this.mensajesError.push('Por favor seleccione un estudiante valido')
      }
      else {
        this.entidadSeleccionada.idEstudiante = this.entidadSeleccionada.estudiante?.id
      }
    }
    if (this.entidadSeleccionada.idTipoUsuario == 4) {
      if (this.entidadSeleccionada.profesor?.id == null || this.entidadSeleccionada.profesor?.id == 0) {
        continuar = false; this.mensajesError.push('Por favor seleccione un profesor valido')
      }
      else {
        this.entidadSeleccionada.idProfesor = this.entidadSeleccionada.profesor?.id
      }
    }
    this.entidades.forEach(element => {
      if (element.username == this.entidadSeleccionada.username && element.id != this.entidadSeleccionada.id) {
        continuar = false
        this.mensajesError.push('El usuario ya existe')
      }
      if (element.profesor?.id == this.entidadSeleccionada.profesor?.id && element.profesor != null && element.id != this.entidadSeleccionada.id) {
        continuar = false
        this.mensajesError.push('Ya esxiste un usuario con el profesor seleccionado')
      }
      if (element.estudiante?.id == this.entidadSeleccionada.idEstudiante && element.estudiante != null && element.id != this.entidadSeleccionada.id) {
        continuar = false
        this.mensajesError.push('Ya esxiste un usuario con el estudiante seleccionado')
      }
    });


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

  private inicializarEntidad(): Usuario {
    return {
      id: 0,
      username: '',
      password: '',
      idEstudiante: 0,
      idProfesor: 0,
      idTipoUsuario: 0
    };
  }
  ValA(param: any): any {
    if (param.id !== null && param.id !== undefined && param.id !== 0)
      return param
    else
      return undefined
  }

}
