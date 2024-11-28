import { Component, OnInit, AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { CicloEstudiantilService, CicloEstudiantil } from '../cicloestudiantil/cicloestudiantil.service';
import Swal from 'sweetalert2';
import { RegistroEstudiantilService, RegistroEstudiantil } from './registroestudiantil.service';
import { EstudianteService, Estudiante } from '../estudiantes/estudiantes.service';
import { AsignaturaService, Asignatura } from '../asignaturas/asignaturas.service';
import { Observable, OperatorFunction } from 'rxjs';
import { debounceTime, map, } from 'rxjs/operators';
import { GlobalDataService } from '../auth/global-data.service';

@Component({
  selector: 'app-registroestudiantil',
  templateUrl: './registroestudiantil.component.html',
  styleUrls: ['./registroestudiantil.component.css']
})
export class RegistroEstudiantilComponent implements OnInit, AfterViewInit {
  constructor(private Service: CicloEstudiantilService, private EstudianteService: EstudianteService, private AsignaturaService: AsignaturaService,
    private RegistroEstudiantilService: RegistroEstudiantilService, private globalData: GlobalDataService
  ) { }
  @ViewChild('staticBackdrop', { static: false }) staticBackdrop?: ElementRef

  searchst: OperatorFunction<string, readonly { nombres: string }[]> = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(200),
      map((term) =>
        term === '' ? [] : this.estudiantes.filter((v) => v.nombres.toLowerCase().indexOf(term.toLowerCase()) > -1).slice(0, 10),
      ),
    );
  formatterst = (x: { nombres: string }) => x.nombres;



  searchcl: OperatorFunction<string, readonly { nombre: string }[]> = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(200),
      map((term) =>
        term === '' ? [] : this.Asignaturas.filter((v) => v.nombre.toLowerCase().indexOf(term.toLowerCase()) > - 1 && v.programaAcademico?.id == this.RegistroEstudiantil.estudiante?.programaAcademico?.id).slice(0, 10),
      ),
    );
  formattercl = (x: { nombre: string }) => x.nombre;

  Idusuario: number | null = null;
  Idestudiante: number | null = null;
  IdProfesor: number | null = null;
  IdTipoUsuario: number | null = null;

  estudiantes: Estudiante[] = []; // Array para almacenar las entidades
  entidades: CicloEstudiantil[] = [];
  Ciclos: CicloEstudiantil[] = [];
  consultaCiclos: RegistroEstudiantil[] = [];
  consultaOtrosEstudiantes: RegistroEstudiantil[] = [];
  Asignaturas: Asignatura[] = [];

  mensajesError: string[] = [];
  RegistroEstudiantil: RegistroEstudiantil = this.inicializarregistro();
  entidadSeleccionada: CicloEstudiantil = this.inicializarEntidad();
  isEditing: boolean = false;
  filtro: string = '';
  filtrorg: string = '';
  modaltittle: string = '';
  page: number = 1;
  pagerg: number = 1;
  entidadesFiltradas(): CicloEstudiantil[] {
    // Filtra las entidades en función del valor de `filtro`
    if (!this.filtro) {
      return this.entidades;
    }
    const filtroLowerCase = this.filtro.toLowerCase();
    return this.entidades.filter(entidad =>
      entidad.nombre.toLowerCase().includes(filtroLowerCase) ||
      entidad.descripcion.toLowerCase().includes(filtroLowerCase)
    );
  }
  RegistrosFiltradas(): RegistroEstudiantil[] {
    // Filtra las entidades en función del valor de `filtro`
    if (!this.filtrorg) {
      return this.consultaCiclos;
    }
    const filtroLowerCase = this.filtrorg.toLowerCase();
    return this.consultaCiclos.filter(entidad =>
      entidad.estudiante?.nombres.toLowerCase().includes(filtroLowerCase) ||
      entidad.asignatura?.nombre.toLowerCase().includes(filtroLowerCase) ||
      entidad.asignatura?.profesor?.nombres.toLowerCase().includes(filtroLowerCase) ||
      entidad.cicloEstudiantil?.nombre.toLowerCase().includes(filtroLowerCase)
    );
  }
  EstudaintesFiltradas(idasignatura: number | null = null): RegistroEstudiantil[] {
    // Filtra las entidades en función del valor de `filtro`
   
    return this.consultaOtrosEstudiantes.filter(entidad => entidad.asignatura?.id == idasignatura );
  }
  rolAdmin: boolean = false;
  rolStudent: boolean = false;
  rolTeacher: boolean = false;

  ngOnInit(): void {
    this.obtenerEstudiantes();
    this.obtenerCiclos();
    this.obtenerEntidades();
    this.obtenerAsignaturas();
    this.Idusuario = this.globalData.Idusuario
    this.Idestudiante = this.globalData.Idestudiante
    this.IdProfesor = this.globalData.IdProfesor
    this.IdTipoUsuario = this.globalData.IdTipoUsuario

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
  obtenerCiclos(): void {
    this.Service.getAll().subscribe(Ciclo => {
      Ciclo.forEach(element => {
        if (element.estado)
          this.Ciclos.push(element)
      });
      console.log(Ciclo)
    }
    );
  }
  obtenerAsignaturas(): void {
    this.AsignaturaService.getAll().subscribe(asignaturas => {
      asignaturas.forEach(element => {
        if (element.estado)
          this.Asignaturas.push(element)
      });
      console.log(asignaturas)
    }
    );
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

  obtenerEntidades(): void {
    this.Service.getAll().subscribe(entidades => this.entidades = entidades);
  }

  seleccionarEntidad(entidad: CicloEstudiantil): void {
    this.entidadSeleccionada = { ...entidad };
    this.isEditing = true;
  }

  ConsultarRegistros(entidad: CicloEstudiantil): void {
    this.entidadSeleccionada = { ...entidad };
    this.modaltittle = entidad.nombre
    if (this.rolStudent) {
      this.RegistroEstudiantilService.getByStudent(entidad.id, this.Idestudiante == null ? 0 : this.Idestudiante).subscribe(ciclos => this.consultaCiclos = ciclos);
      this.RegistroEstudiantilService.getByStudentAllStundets(entidad.id, this.Idestudiante == null ? 0 : this.Idestudiante).subscribe(ciclos => this.consultaOtrosEstudiantes = ciclos);
    }
    if (this.rolTeacher)
      this.RegistroEstudiantilService.getByTeacher(entidad.id, this.IdProfesor == null ? 0 : this.IdProfesor).subscribe(ciclos => this.consultaCiclos = ciclos);
    if (this.rolAdmin)
      this.RegistroEstudiantilService.getByCiclo(entidad.id).subscribe(ciclos => this.consultaCiclos = ciclos);
  }

  datosrequeridos(): boolean {
    this.mensajesError = []
    let continuar = true
    if (this.entidadSeleccionada.fechaInicio > this.entidadSeleccionada.fechaFin) {
      continuar = false
      this.mensajesError.push('La fecha inicio no puede ser superior a la fecha fin')
    }
    return continuar
  }
  crearEntidad(): void {
    if (this.datosrequeridos())

      this.RegistroEstudiantil.idEstudiante = this.RegistroEstudiantil.estudiante?.id
    this.RegistroEstudiantil.idAsignatura = this.RegistroEstudiantil.asignatura?.id

    this.RegistroEstudiantilService.create(this.RegistroEstudiantil).subscribe({
      next: (entidad) => {
        // Si la creación es exitosa
        this.RegistroEstudiantil = this.inicializarEntidad();
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
          text: err.error.mensaje,
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
        this.RegistroEstudiantilService.delete(id).subscribe({
          next: () => {
            // Eliminar la entidad del array si la solicitud fue exitosa
            this.ConsultarRegistros(this.entidadSeleccionada)
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
    this.RegistroEstudiantil = this.inicializarregistro();
    this.isEditing = false;
  }

  private inicializarEntidad(): CicloEstudiantil {
    return {
      id: 0,
      nombre: '',
      descripcion: '',
      creditosMaximos: '',
      fechaInicio: '',
      fechaFin: '',
      estado: true
    };
  }
  private inicializarregistro(): RegistroEstudiantil {
    if (this.rolStudent) {
      return {
        id: 0,
        estudiante: this.estudiantes.find((v) => v.id == this.Idestudiante)
      };
    }
    return {
      id: 0
    };
  }
  ValA(param: any): any {
    if (param.id !== null && param.id !== undefined && param.id !== 0)
      return param
    else
      return undefined
  }
}
