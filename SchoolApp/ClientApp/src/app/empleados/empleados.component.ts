import { Component, OnInit } from '@angular/core';
import { EmpleadosService, Empleado } from '../empleados/empleados.service';
import { EntidadesService, Entidad } from '../entidades/entidades.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-empleados',
  templateUrl: './empleados.component.html',
  styleUrls: ['./empleados.component.css']
})
export class EmpleadosComponent implements OnInit {
  empleados: Empleado[] = [];
  entidades: Entidad[] = []; // Array para almacenar las entidades
  empleadoSeleccionado: Empleado = this.inicializarEmpleado();
  isEditing: boolean = false;
  filtro: string = '';
  page: number = 1;

  constructor(
    private empleadosService: EmpleadosService,
    private entidadesService: EntidadesService // Inyecta el servicio de entidades
  ) { }

  empleadosFiltrados(): Empleado[] {
    // Filtra las entidades en función del valor de `filtro`
    if (!this.filtro) {
      return this.empleados;
    }
    const filtroLowerCase = this.filtro.toLowerCase();
    return this.empleados.filter(empleado =>
      empleado.nombres.toLowerCase().includes(filtroLowerCase) ||
      empleado.apellidos.toLowerCase().includes(filtroLowerCase) ||
      empleado.numeroIdentificacion.toLowerCase().includes(filtroLowerCase) ||
      empleado.direccion.toLowerCase().includes(filtroLowerCase) ||
      empleado.ciudad.toLowerCase().includes(filtroLowerCase) ||
      empleado.telefono.toLowerCase().includes(filtroLowerCase) ||
      empleado.correo.toLowerCase().includes(filtroLowerCase)
    );
  }

  ngOnInit(): void {
    this.obtenerEmpleados();
    this.cargarEntidades(); // Carga las entidades al inicializar el componente
  }

  obtenerEmpleados(): void {
    this.empleadosService.getAll().subscribe(empleados => {
      this.empleados = empleados
      console.log(empleados)
    }
    );
  }

  cargarEntidades(): void {
    this.entidadesService.getAll().subscribe(entidades => this.entidades = entidades);
  }

  seleccionarEmpleado(empleado: Empleado): void {
    this.empleadoSeleccionado = { ...empleado };
    this.empleadoSeleccionado.idEmpresa = empleado.empresa?.id
    this.isEditing = true;
  }

  crearEmpleado(): void {
    this.empleadosService.create(this.empleadoSeleccionado).subscribe({
      next: (empleado) => {
        // Si la creación es exitosa
        this.empleados.push(empleado);
        this.empleadoSeleccionado = this.inicializarEmpleado();
        this.obtenerEmpleados()
        Swal.fire({
          title: '¡Éxito!',
          text: 'El registro se guardó correctamente.',
          icon: 'success',
          confirmButtonText: 'Aceptar'
        });
      },
      error: (err) => {
        // Si ocurre un error
        console.error('Error al crear el empleado:', err); // Esto es útil para depuración
        Swal.fire({
          title: 'Error',
          text: 'Ocurrió un problema al guardar el registro. Por favor, inténtalo de nuevo.',
          icon: 'error',
          confirmButtonText: 'Aceptar'
        });
      }
    });
  }

  actualizarEmpleado(): void {
    this.empleadosService.update(this.empleadoSeleccionado.id, this.empleadoSeleccionado).subscribe({
    
      next: () => {
        const index = this.empleados.findIndex(e => e.id === this.empleadoSeleccionado.id);
        if (index !== -1) {
          this.empleados[index] = { ...this.empleadoSeleccionado };
        }
        this.limpiarSeleccion();
        this.obtenerEmpleados()
        Swal.fire({
          title: '¡Éxito!',
          text: 'El registro se actualizó correctamente.',
          icon: 'success',
          confirmButtonText: 'Aceptar'
        });
      },
      error: (err) => {
        console.error('Error al actualizar el empleado:', err); 
  
        let mensaje = 'Ocurrió un problema al actualizar el registro. Por favor, inténtalo de nuevo.';
        if (err.status === 404) {
          mensaje = 'La empleado no fue encontrada. Verifica que existe antes de actualizar.';
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

  eliminarEmpleado(id: number): void {
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
        this.empleadosService.delete(id).subscribe({
          next: () => {
            // Eliminar el empleado del array si la solicitud fue exitosa
            this.empleados = this.empleados.filter(empleado => empleado.id !== id);
            Swal.fire({
              title: '¡Eliminado!',
              text: 'El registro ha sido eliminado correctamente.',
              icon: 'success',
              confirmButtonText: 'Aceptar'
            });
          },
          error: (err) => {
            console.error('Error al eliminar el empleado:', err); // Para depuración en consola
  
            let mensaje = 'Ocurrió un problema al intentar eliminar el registro. Por favor, inténtalo de nuevo.';
            if (err.status === 404) {
              mensaje = 'El empleado no fue encontrada. Es posible que ya haya sido eliminada.';
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
    this.empleadoSeleccionado = this.inicializarEmpleado();
    this.isEditing = false;
  }

  private inicializarEmpleado(): Empleado {
    return {
      id: 0,
      nombres: '',
      apellidos: '',
      numeroIdentificacion: '',
      direccion: '',
      ciudad: '',
      telefono: '',
      celular: '',
      correo: '',
      fechaVinculacion: '',
      cargo: '',
      idEmpresa: 0
    };
  }
}