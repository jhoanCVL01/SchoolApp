using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProgramaAcademicoController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ProgramaAcademicoController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<ProgramaAcademico>>> GetAll()
        {
           return await _context.ProgramaAcademico.ToListAsync();

        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<object>> GetById(int id)
        {
            var entidad = await _context.ProgramaAcademico.FindAsync(id);
            if (entidad == null) return NotFound();
            return entidad;
        }

        [HttpPost]
        public async Task<ActionResult<ProgramaAcademico>> Create(ProgramaAcademico entidad)
        {
            _context.ProgramaAcademico.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, ProgramaAcademico entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.ProgramaAcademico.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.ProgramaAcademico.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
