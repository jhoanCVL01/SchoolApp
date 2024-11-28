using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Estudiante")]
public partial class Estudiante
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
    public int IdProgramaAcademico { get; set; }

    [ForeignKey("IdProgramaAcademico")]
    [InverseProperty("Estudiantes")]
    public virtual ProgramaAcademico? IdProgramaAcademicoNavigation { get; set; } = null!;

    [InverseProperty("IdEstudianteNavigation")]
    public virtual ICollection<RegistroEstudiantil> RegistrosEstudiantilesEstudiantes { get; set; } = new List<RegistroEstudiantil>();
    [InverseProperty("IdEstudianteNavigation")]
    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();


}
