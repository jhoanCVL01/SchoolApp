using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Entidad")]
public partial class Entidad
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Nombre { get; set; } = null!;

    [StringLength(50)]
    public string Nit { get; set; } = null!;

    [StringLength(50)]
    public string Direccion { get; set; } = null!;

    [StringLength(50)]
    public string Ciudad { get; set; } = null!;

    [StringLength(50)]
    public string Telefono { get; set; } = null!;

    [StringLength(50)]
    public string Correo { get; set; } = null!;

    public bool Estado { get; set; }

    [InverseProperty("IdEmpresaNavigation")]
    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
