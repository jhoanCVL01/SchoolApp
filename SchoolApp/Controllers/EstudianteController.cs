using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstudianteController : ControllerBase
    {
        private readonly AppDbContext _context;

        public EstudianteController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<Estudiante>>> GetAll()
        {
            var entidad = await _context.Estudiante
             .Include(e => e.IdProgramaAcademicoNavigation)
             .Select(e => new
             {
                 e.Id,
                 e.Nombres,
                 e.Apellidos,
                 e.NumeroIdentificacion,
                 e.Direccion,
                 e.Ciudad,
                 e.Telefono,
                 e.Celular,
                 e.Correo,
                 e.FechaVinculacion,
                 e.IdProgramaAcademico,
                 e.Estado,
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
            var entidad = await _context.Estudiante
               .Include(e => e.IdProgramaAcademicoNavigation)
               .Select(e => new
               {
                   e.Id,
                   e.Nombres,
                   e.Apellidos,
                   e.NumeroIdentificacion,
                   e.Direccion,
                   e.Ciudad,
                   e.Telefono,
                   e.Celular,
                   e.Correo,
                   e.FechaVinculacion,
                   e.Estado,
                   e.IdProgramaAcademico,
                   ProgramaAcademico = new
                   {
                       e.IdProgramaAcademicoNavigation.Id,
                       e.IdProgramaAcademicoNavigation.Nombre,
                   }
               }).FirstOrDefaultAsync(e => e.Id == id);
            if (entidad == null)
                return NotFound();
            return entidad;

        }

        [HttpPost]
        public async Task<ActionResult<Estudiante>> Create(Estudiante entidad)
        {
            _context.Estudiante.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Estudiante entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.Estudiante.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.Estudiante.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
