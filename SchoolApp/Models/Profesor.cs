using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Profesor")]
public partial class Profesor
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
    public bool Estado { get; set; }

    [InverseProperty("IdProfesorNavigation")]
    public virtual ICollection<Asignatura> Asignaturas { get; set; } = new List<Asignatura>();
    [InverseProperty("IdProfesorNavigation")]
    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();

}
