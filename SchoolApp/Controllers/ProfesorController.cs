using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfesorController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ProfesorController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<Profesor>>> GetAll()
        {
            return await _context.Profesor.ToListAsync();
        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<Profesor>> GetById(int id)
        {
            var result = await _context.Profesor.FindAsync(id);
            if (result == null) return NotFound();
            return result;
        }

        [HttpPost]
        public async Task<ActionResult<Profesor>> Create(Profesor entidad)
        {
            _context.Profesor.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, Profesor entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.Profesor.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.Profesor.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
