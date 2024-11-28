using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

[Table("TipoUsuario")]
public partial class TipoUsuario
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string Nombre { get; set; } = null!;

    [StringLength(50)]
    public string Descripcion { get; set; } = null!;

    [InverseProperty("IdTipoUsuarioNavigation")]
    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();
}
