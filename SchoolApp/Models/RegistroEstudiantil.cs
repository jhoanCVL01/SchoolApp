using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("RegistroEstudiantil")]
public partial class RegistroEstudiantil
{
    [Key]
    public int Id { get; set; }

    public int IdEstudiante { get; set; }

    [ForeignKey("IdEstudiante")]
    [InverseProperty("RegistrosEstudiantilesEstudiantes")]
    public virtual Estudiante? IdEstudianteNavigation { get; set; } = null!;
    public int IdCicloEstudiantil { get; set; }

    [ForeignKey("IdCicloEstudiantil")]
    [InverseProperty("RegistrosEstudiantilesCicloEstudiantil")]
    public virtual CicloEstudiantil? IdCicloEstudiantilNavigation { get; set; } = null!;

    public int IdAsignatura { get; set; }

    [ForeignKey("IdAsignatura")]
    [InverseProperty("RegistrosEstudiantilesAsignatura")]
    public virtual Asignatura? IdAsignaturaNavigation { get; set; } = null!;
  
}
