using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsignaturaController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AsignaturaController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<Asignatura>>> GetAll()
        {
            var entidad = await _context.Asignatura
             .Include(e => e.IdProfesorNavigation)
             .Include(e => e.IdProgramaAcademicoNavigation)
             .Select(e => new
             {
                 e.Id,
                 e.Nombre,
                 e.Descripcion,
                 e.CantidadCreditos,
                 e.Estado,
                 Profesor = new
                 {
                     e.IdProfesorNavigation.Id,
                     e.IdProfesorNavigation.Nombres,
                     e.IdProfesorNavigation.Apellidos,
                 },
                 ProgramaAcademico = new
                 {
                     e.IdProgramaAcademicoNavigation.Id,
                     e.IdProgramaAcademicoNavigation.Nombre,
                 }
             })
             .ToListAsync();

            return Ok(entidad);
        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<object>> GetById(int id)
        {
            var entidad = await _context.Asignatura
             .Include(e => e.IdProgramaAcademicoNavigation)
               .Include(e => e.IdProfesorNavigation)
                 .Select(e => new
                 {
                     e.Id,
                     e.Nombre,
                     e.Descripcion,
                     e.CantidadCreditos,
                     e.Estado,
                     Profesor = new
                     {
                         e.IdProfesorNavigation.Id,
                         e.IdProfesorNavigation.Nombres,
                         e.IdProfesorNavigation.Apellidos,
                     },
                     ProgramaAcademico = new
                     {
                         e.IdProgramaAcademicoNavigation.Id,
                         e.IdProgramaAcademicoNavigation.Nombre,
                     }
                 }) // Incluye la entidad relacionada
               .FirstOrDefaultAsync(e => e.Id == id);
                    if (entidad == null) return NotFound();
            return entidad;
        }

        [HttpPost]
        public async Task<ActionResult<Asignatura>> Create(Asignatura entidad)
        {
            _context.Asignatura.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Asignatura entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.Asignatura.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.Asignatura.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
