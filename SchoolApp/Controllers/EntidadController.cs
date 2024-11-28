using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EntidadController : ControllerBase
    {
        //private readonly AppDbContext _context;

        //public EntidadController(AppDbContext context)
        //{
        //    _context = context;
        //}

        //[HttpGet]
        //[Authorize]
        //public async Task<ActionResult<IEnumerable<Entidad>>> GetAll()
        //{
        //    return await _context.Entidads.ToListAsync();
        //}

        //[HttpGet("{id}")]
        //[Authorize]
        //public async Task<ActionResult<Entidad>> GetById(int id)
        //{
        //    var entidad = await _context.Entidads.FindAsync(id);
        //    if (entidad == null) return NotFound();
        //    return entidad;
        //}

        //[HttpPost]
        //[Authorize(Roles = "Administrador")]
        //public async Task<ActionResult<Entidad>> Create(Entidad entidad)
        //{
        //    _context.Entidads.Add(entidad);
        //    await _context.SaveChangesAsync();
        //    return CreatedAtAction(nameof(GetById), new { id = entidad.Id }, entidad);
        //}

        //[HttpPut("{id}")]
        //[Authorize(Roles = "Administrador")]
        //public async Task<IActionResult> Update(int id, Entidad entidad)
        //{
        //    if (id != entidad.Id) return BadRequest();
        //    _context.Entry(entidad).State = EntityState.Modified;
        //    await _context.SaveChangesAsync();
        //    return NoContent();
        //}

        //[HttpDelete("{id}")]
        //[Authorize(Roles = "Administrador")]
        //public async Task<IActionResult> Delete(int id)
        //{
        //    var entidad = await _context.Entidads.FindAsync(id);
        //    if (entidad == null) return NotFound();
        //    _context.Entidads.Remove(entidad);
        //    await _context.SaveChangesAsync();
        //    return NoContent();
        //}
    }
}
