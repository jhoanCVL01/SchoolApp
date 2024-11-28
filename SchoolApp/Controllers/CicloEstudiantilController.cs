using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CicloEstudiantilController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CicloEstudiantilController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<IEnumerable<CicloEstudiantil>>> GetAll()
        {
            return await _context.CicloEstudiantil.ToListAsync();
        }

        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<CicloEstudiantil>> GetById(int id)
        {
            var result = await _context.CicloEstudiantil.FindAsync(id);
            if (result == null) return NotFound();
            return result;
        }

        [HttpPost]
        public async Task<ActionResult<CicloEstudiantil>> Create(CicloEstudiantil entidad)
        {
            _context.CicloEstudiantil.Add(entidad);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, CicloEstudiantil entidad)
        {
            if (id != entidad.Id) return BadRequest();
            _context.Entry(entidad).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entidad = await _context.CicloEstudiantil.FindAsync(id);
            if (entidad == null) return NotFound();
            _context.CicloEstudiantil.Remove(entidad);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
