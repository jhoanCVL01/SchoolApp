using IFX_NETWORKS.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
       // private readonly AppDbContext _context;

       // public EmpleadoController(AppDbContext context)
       // {
       //     _context = context;
       // }

       // [HttpGet]
       // [Authorize]
       // public async Task<ActionResult<IEnumerable<Empleado>>> GetAll()
       // {
       //     var empleados = await _context.Empleados
       //  .Include(e => e.IdEmpresaNavigation)
       //  .Select(e => new
       //  {
       //      e.Id,
       //      e.Nombres,
       //      e.Apellidos,
       //      e.NumeroIdentificacion,
       //      e.Direccion,
       //      e.Ciudad,
       //      e.Telefono,
       //      e.Celular,
       //      e.Correo,
       //      e.FechaVinculacion,
       //      e.Cargo,
       //      Empresa = new
       //      {
       //          e.IdEmpresaNavigation.Id,
       //          e.IdEmpresaNavigation.Nombre,
       //          e.IdEmpresaNavigation.Nit,
       //          e.IdEmpresaNavigation.Direccion,
       //          e.IdEmpresaNavigation.Ciudad,
       //          e.IdEmpresaNavigation.Telefono,
       //          e.IdEmpresaNavigation.Correo,
       //          e.IdEmpresaNavigation.Estado
       //      }
       //  })
       //  .ToListAsync();

       //     return Ok(empleados);
       // }

       // [HttpGet("{id}")]
       // [Authorize]
       // public async Task<ActionResult<object>> GetById(int id)
       // {
       //     var empleado = await _context.Empleados
       //.Include(e => e.IdEmpresaNavigation)
       //  .Select(e => new 
       //  {
       //      e.Id,
       //      e.Nombres,
       //      e.Apellidos,
       //      e.NumeroIdentificacion,
       //      e.Direccion,
       //      e.Ciudad,
       //      e.Telefono,
       //      e.Celular,
       //      e.Correo,
       //      e.FechaVinculacion,
       //      e.Cargo,
       //      Empresa = new
       //      {
       //          e.IdEmpresaNavigation.Id,
       //          e.IdEmpresaNavigation.Nombre,
       //          e.IdEmpresaNavigation.Nit,
       //          e.IdEmpresaNavigation.Direccion,
       //          e.IdEmpresaNavigation.Ciudad,
       //          e.IdEmpresaNavigation.Telefono,
       //          e.IdEmpresaNavigation.Correo,
       //          e.IdEmpresaNavigation.Estado
       //      }
       //  }) // Incluye la entidad relacionada
       //.FirstOrDefaultAsync(e => e.Id == id);
       //     if (empleado == null) return NotFound();
       //     return empleado;
       // }

       // [HttpPost]
       // [Authorize(Roles = "Administrador")]
       // public async Task<ActionResult<Empleado>> Create(Empleado empleado)
       // {
       //     _context.Empleados.Add(empleado);
       //     await _context.SaveChangesAsync();
       //     return CreatedAtAction(nameof(GetById), new { id = empleado.Id }, empleado);
       // }

       // [HttpPut("{id}")]
       // [Authorize(Roles = "Administrador")]
       // public async Task<IActionResult> Update(int id, Empleado empleado)
       // {
       //     if (id != empleado.Id) return BadRequest();
       //     _context.Entry(empleado).State = EntityState.Modified;
       //     await _context.SaveChangesAsync();
       //     return NoContent();
       // }

       // [HttpDelete("{id}")]
       // [Authorize(Roles = "Administrador")]
       // public async Task<IActionResult> Delete(int id)
       // {
       //     var empleado = await _context.Empleados.FindAsync(id);
       //     if (empleado == null) return NotFound();
       //     _context.Empleados.Remove(empleado);
       //     await _context.SaveChangesAsync();
       //     return NoContent();
       // }
    }
}
