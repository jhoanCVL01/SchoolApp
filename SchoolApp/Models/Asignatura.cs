using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Asignatura")]
public partial class Asignatura
{
    [Key]
    public int Id { get; set; }

    [StringLength(100)]
    public string Nombre { get; set; } = null!;

    [StringLength(500)]
    public string Descripcion { get; set; } = null!;

    public int CantidadCreditos { get; set; }
    public bool Estado { get; set; }
    public int IdProfesor { get; set; }
    public int IdProgramaAcademico { get; set; }

    [ForeignKey("IdProfesor")]
    [InverseProperty("Asignaturas")]
    public virtual Profesor? IdProfesorNavigation { get; set; } = null!;
    [ForeignKey("IdProgramaAcademico")]
    [InverseProperty("Asignaturas")]
    public virtual ProgramaAcademico? IdProgramaAcademicoNavigation { get; set; } = null!;

    [InverseProperty("IdAsignaturaNavigation")]
    public virtual ICollection<RegistroEstudiantil> RegistrosEstudiantilesAsignatura { get; set; } = new List<RegistroEstudiantil>();

}
