using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsuarioController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetAll()
        {
            var entidad = await _context.Usuarios
             .Include(e => e.IdTipoUsuarioNavigation)
             .Include(e => e.IdEstudianteNavigation)
             .Include(e => e.IdProfesorNavigation)
             .Select(e => new
             {
                 e.Id,
                 e.Username,
                 e.IdProfesor,
                 e.IdEstudiante,
                 TipoUsuario = new
                 {
                     e.IdTipoUsuarioNavigation.Id,
                     e.IdTipoUsuarioNavigation.Nombre,
                     e.IdTipoUsuarioNavigation.Descripcion,
                 },
                 Estudiante = e.IdEstudianteNavigation != null? new
                 {
                     e.IdEstudianteNavigation.Id,
                     e.IdEstudianteNavigation.Nombres,
                 } : null,
                 Profesor = e.IdProfesorNavigation != null ? new
                 {
                     e.IdProfesorNavigation.Id,
                     e.IdProfesorNavigation.Nombres,
                 } : null
             })
             .ToListAsync();

            return Ok(entidad);
        }
        [HttpGet("GetTipoUsuarios")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<TipoUsuario>>> GetTipoUsuarios()
        {
            return await _context.TipoUsuarios.ToListAsync();

        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<object>> GetById(int id)
        {
            var entidad = await _context.Usuarios
            .Include(e => e.IdTipoUsuarioNavigation)
                 .Select(e => new
                 {
                     e.Id,
                     e.Username,
                     e.IdProfesor,
                     e.IdEstudiante,
                     TipoUsuario = new
                     {
                         e.IdTipoUsuarioNavigation.Id,
                         e.IdTipoUsuarioNavigation.Nombre,
                         e.IdTipoUsuarioNavigation.Descripcion,
                     }
                 })
           .FirstOrDefaultAsync(e => e.Id == id);
            if (entidad == null) return NotFound();
            return entidad;
        }

        [HttpPost]
        public async Task<ActionResult<Usuario>> Create(Usuario entidad)
        {
            if (entidad.IdEstudiante == 0)
                entidad.IdEstudiante = null;
            if (entidad.IdProfesor == 0)
                entidad.IdProfesor = null;
            _context.Usuarios.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Usuario entidad)
        {
            if (id != entidad.Id) return BadRequest();
            if (entidad.IdEstudiante == 0)
                entidad.IdEstudiante = null;
            if (entidad.IdProfesor == 0)
                entidad.IdProfesor = null;
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.Usuarios.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.Usuarios.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
