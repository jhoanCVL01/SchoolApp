using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegistroEstudiantilController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RegistroEstudiantilController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RegistroEstudiantil>>> GetAll()
        {
            var entidad = await _context.RegistroEstudiantil
             .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                     e.IdAsignaturaNavigation.Nombre,
                     e.IdAsignaturaNavigation.CantidadCreditos,
                     Profesor = new
                     {
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                     }
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                     e.IdEstudianteNavigation.Apellidos,
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id,
                     e.IdCicloEstudiantilNavigation.Nombre,
                     e.IdCicloEstudiantilNavigation.FechaInicio,
                     e.IdCicloEstudiantilNavigation.FechaFin
                 }
             })
             .ToListAsync();

            return Ok(entidad);
        }
        [HttpGet("GetByCiclo/{idCiclo}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RegistroEstudiantil>>> GetByCiclo(int idCiclo)
        {
            var entidad = await _context.RegistroEstudiantil
             .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdEstudianteNavigation.IdProgramaAcademicoNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                     e.IdAsignaturaNavigation.Nombre,
                     e.IdAsignaturaNavigation.CantidadCreditos,
                     Profesor = new
                     {
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                     }
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                     e.IdEstudianteNavigation.Apellidos,
                     ProgramaAcademico = new
                     {
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Id,
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Nombre,
                     }
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id,
                     e.IdCicloEstudiantilNavigation.Nombre,
                     e.IdCicloEstudiantilNavigation.FechaInicio,
                     e.IdCicloEstudiantilNavigation.FechaFin
                 }
             }).Where(e => e.CicloEstudiantil.Id == idCiclo)
             .ToListAsync();

            return Ok(entidad);
        }

        [HttpGet("GetByStudent/{idStudent}/{idCiclo}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RegistroEstudiantil>>> GetByStudent(int idStudent, int idCiclo)
        {
            var entidad = await _context.RegistroEstudiantil
             .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdEstudianteNavigation.IdProgramaAcademicoNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                     e.IdAsignaturaNavigation.Nombre,
                     e.IdAsignaturaNavigation.CantidadCreditos,
                     Profesor = new
                     {
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                     }
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                     e.IdEstudianteNavigation.Apellidos,
                     ProgramaAcademico = new
                     {
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Id,
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Nombre,
                     }
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id,
                     e.IdCicloEstudiantilNavigation.Nombre,
                     e.IdCicloEstudiantilNavigation.FechaInicio,
                     e.IdCicloEstudiantilNavigation.FechaFin
                 }
             }).Where(e => e.Estudiante.Id == idStudent && e.CicloEstudiantil.Id == idCiclo)
             .ToListAsync();

            return Ok(entidad);
        }
        [HttpGet("GetByTeacher/{idTeacher}/{idCiclo}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RegistroEstudiantil>>> GetByTeacher(int idTeacher, int idCiclo)
        {
            var entidad = await _context.RegistroEstudiantil
             .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdEstudianteNavigation.IdProgramaAcademicoNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                     e.IdAsignaturaNavigation.Nombre,
                     e.IdAsignaturaNavigation.CantidadCreditos,
                     Profesor = new
                     {
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                     }
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                     e.IdEstudianteNavigation.Apellidos,
                     ProgramaAcademico = new
                     {
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Id,
                         e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Nombre,
                     }
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id,
                     e.IdCicloEstudiantilNavigation.Nombre,
                     e.IdCicloEstudiantilNavigation.FechaInicio,
                     e.IdCicloEstudiantilNavigation.FechaFin
                 }
             }).Where(e => e.CicloEstudiantil.Id == idCiclo && e.Asignatura.Profesor.Id == idTeacher)
             .ToListAsync();

            return Ok(entidad);
        }

        [HttpGet("GetByStudentAllStundets/{idStudent}/{idCiclo}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<RegistroEstudiantil>>> GetByStudentAllStundets(int idStudent, int idCiclo)
        {
            var ConsultaInicial = await _context.RegistroEstudiantil
             .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdEstudianteNavigation.IdProgramaAcademicoNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id
                    
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id
                 }
             }).Where(e => e.Estudiante.Id == idStudent && e.CicloEstudiantil.Id == idCiclo)
             .ToListAsync();

            var listaIdsAsignaturas = ConsultaInicial.Select(a => a.Asignatura.Id).ToList();

            var entidad = await _context.RegistroEstudiantil
            .Include(e => e.IdAsignaturaNavigation)
            .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
            .Include(e => e.IdEstudianteNavigation)
            .Include(e => e.IdEstudianteNavigation.IdProgramaAcademicoNavigation)
            .Include(e => e.IdCicloEstudiantilNavigation)
            .Select(e => new
            {
                e.Id,
                Asignatura = new
                {
                    e.IdAsignaturaNavigation.Id,
                    e.IdAsignaturaNavigation.Nombre,
                    e.IdAsignaturaNavigation.CantidadCreditos,
                    Profesor = new
                    {
                        e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                        e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                        e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                    }
                },
                Estudiante = new
                {
                    e.IdEstudianteNavigation.Id,
                    e.IdEstudianteNavigation.Nombres,
                    e.IdEstudianteNavigation.Apellidos,
                    ProgramaAcademico = new
                    {
                        e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Id,
                        e.IdEstudianteNavigation.IdProgramaAcademicoNavigation.Nombre,
                    }
                },
                CicloEstudiantil = new
                {
                    e.IdCicloEstudiantilNavigation.Id,
                    e.IdCicloEstudiantilNavigation.Nombre,
                    e.IdCicloEstudiantilNavigation.FechaInicio,
                    e.IdCicloEstudiantilNavigation.FechaFin
                }
            }).Where(e => e.CicloEstudiantil.Id == idCiclo && listaIdsAsignaturas.Contains(e.Asignatura.Id))
            .ToListAsync();
            return Ok(entidad);
        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<object>> GetById(int id)
        {
            var entidad = await _context.RegistroEstudiantil
           .Include(e => e.IdAsignaturaNavigation)
             .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdCicloEstudiantilNavigation)
             .Select(e => new
             {
                 e.Id,
                 Asignatura = new
                 {
                     e.IdAsignaturaNavigation.Id,
                     e.IdAsignaturaNavigation.Nombre,
                     e.IdAsignaturaNavigation.CantidadCreditos,
                     Profesor = new
                     {
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                         e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                     }
                 },
                 Estudiante = new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                     e.IdEstudianteNavigation.Apellidos,
                 },
                 CicloEstudiantil = new
                 {
                     e.IdCicloEstudiantilNavigation.Id,
                     e.IdCicloEstudiantilNavigation.Nombre,
                     e.IdCicloEstudiantilNavigation.FechaInicio,
                     e.IdCicloEstudiantilNavigation.FechaFin
                 }
             })
       .FirstOrDefaultAsync(e => e.Id == id);
            if (entidad == null) return NotFound();
            return entidad;
        }

        [HttpPost]
        public async Task<ActionResult<RegistroEstudiantil>> Create(RegistroEstudiantil entidad)
        {
            var infoCiclo = _context.CicloEstudiantil.Where(e => e.Id == entidad.IdCicloEstudiantil).SingleOrDefault();
            var infoAsignatura = _context.Asignatura.Where(e => e.Id == entidad.IdAsignatura).SingleOrDefault();
            int MaximoCreditos = infoCiclo.CreditosMaximos;
            int ContadorCreditos = 0;
            bool ProfesorIgual = false;
            var ConsultaInscripciones = _context.RegistroEstudiantil
               .Include(e => e.IdAsignaturaNavigation)
               .Include(e => e.IdAsignaturaNavigation.IdProfesorNavigation)
               .Select(e => new
               {
                   e.Id,
                   e.IdEstudiante,
                   e.IdCicloEstudiantil,
                   Asignatura = new
                   {
                       e.IdAsignaturaNavigation.Id,
                       e.IdAsignaturaNavigation.Nombre,
                       e.IdAsignaturaNavigation.CantidadCreditos,
                       Profesor = new
                       {
                           e.IdAsignaturaNavigation.IdProfesorNavigation.Id,
                           e.IdAsignaturaNavigation.IdProfesorNavigation.Nombres,
                           e.IdAsignaturaNavigation.IdProfesorNavigation.Apellidos,
                       }
                   }
               }).Where(e => e.IdEstudiante == entidad.IdEstudiante && e.IdCicloEstudiantil == entidad.IdCicloEstudiantil).ToList();
            foreach (var item in ConsultaInscripciones)
            {
                ContadorCreditos += item.Asignatura.CantidadCreditos;
                if (item.Asignatura.Profesor.Id == infoAsignatura.IdProfesor)
                {
                    ProfesorIgual = true;
                }
            }
            ContadorCreditos += infoAsignatura.CantidadCreditos;
            if (ContadorCreditos <= MaximoCreditos && !ProfesorIgual)
            {

                _context.RegistroEstudiantil.Add(entidad);
                await _context.SaveChangesAsync();
                return Ok();
            }
            else
            {
                if (ProfesorIgual)
                {
                    return BadRequest(new { mensaje = "No se pueden inscribir materias del mismo profesor en el mismo ciclo para el mismo estudiante" });
                }
                else
                {
                    return BadRequest(new { mensaje = "El número de créditos excede el máximo permitido por el ciclo seleccionado." });
                }
            }

        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, RegistroEstudiantil entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.RegistroEstudiantil.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.RegistroEstudiantil.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
