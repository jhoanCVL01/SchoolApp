using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Empleado")]
public partial class Empleado
{
    [Key]
    public int Id { get; set; }

    [StringLength(100)]
    public string Nombres { get; set; } = null!;

    [StringLength(100)]
    public string Apellidos { get; set; } = null!;

    [StringLength(50)]
    public string NumeroIdentificacion { get; set; } = null!;

    [StringLength(50)]
    public string Direccion { get; set; } = null!;

    [StringLength(50)]
    public string Ciudad { get; set; } = null!;

    [StringLength(50)]
    public string Telefono { get; set; } = null!;

    [StringLength(50)]
    public string Celular { get; set; } = null!;

    [StringLength(50)]
    public string Correo { get; set; } = null!;

    public DateOnly FechaVinculacion { get; set; }

    [StringLength(50)]
    public string Cargo { get; set; } = null!;

    public int IdEmpresa { get; set; }

    [ForeignKey("IdEmpresa")]
    [InverseProperty("Empleados")]
    public virtual Entidad? IdEmpresaNavigation { get; set; } = null!;
}
