using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("Usuario")]
public partial class Usuario
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Username { get; set; } = null!;

    [StringLength(50)]
    public string Password { get; set; } = null!;

    public int IdTipoUsuario { get; set; }
    public int? IdEstudiante { get; set; } = 0;
    public int? IdProfesor { get; set; } = 0;


    [ForeignKey("IdTipoUsuario")]
    [InverseProperty("Usuarios")]
    public virtual TipoUsuario? IdTipoUsuarioNavigation { get; set; } = null!;
    [ForeignKey("IdProfesor")]
    [InverseProperty("Usuarios")]
    public virtual Profesor? IdProfesorNavigation { get; set; } = null!;
    [ForeignKey("IdEstudiante")]
    [InverseProperty("Usuarios")]
    public virtual Estudiante? IdEstudianteNavigation { get; set; } = null!;
}
