using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("ProgramaAcademico")]
public partial class ProgramaAcademico
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Nombre { get; set; } = null!;

    [StringLength(500)]
    public string Descripcion { get; set; } = null!;
    public bool Estado { get; set; }

    [InverseProperty("IdProgramaAcademicoNavigation")]
    public virtual ICollection<Estudiante> Estudiantes { get; set; } = new List<Estudiante>();
    [InverseProperty("IdProgramaAcademicoNavigation")]
    public virtual ICollection<Asignatura> Asignaturas { get; set; } = new List<Asignatura>();
}
