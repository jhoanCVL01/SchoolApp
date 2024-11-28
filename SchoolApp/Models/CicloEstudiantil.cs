using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("CicloEstudiantil")]
public partial class CicloEstudiantil
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Nombre { get; set; } = null!;

    [StringLength(500)]
    public string Descripcion { get; set; } = null!;

    public bool Estado { get; set; }
    public DateOnly FechaInicio { get; set; }

    public DateOnly FechaFin { get; set; }
    public int CreditosMaximos { get; set; }

    [InverseProperty("IdCicloEstudiantilNavigation")]
    public virtual ICollection<RegistroEstudiantil> RegistrosEstudiantilesCicloEstudiantil { get; set; } = new List<RegistroEstudiantil>();
}
