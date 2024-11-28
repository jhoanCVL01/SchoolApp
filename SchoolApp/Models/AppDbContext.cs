using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace IFX_NETWORKS.Models;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ProgramaAcademico> ProgramaAcademico { get; set; }
    public virtual DbSet<Estudiante> Estudiante { get; set; }
    public virtual DbSet<Profesor> Profesor { get; set; }
    public virtual DbSet<CicloEstudiantil> CicloEstudiantil { get; set; }
    public virtual DbSet<Asignatura> Asignatura { get; set; }
    public virtual DbSet<RegistroEstudiantil> RegistroEstudiantil { get; set; }
    public virtual DbSet<TipoUsuario> TipoUsuarios { get; set; }
    public virtual DbSet<Usuario> Usuarios { get; set; }

    //public virtual DbSet<Entidad> Entidads { get; set; }
    //public virtual DbSet<Empleado> Empleados { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=DefaultConnection");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<Asignatura>(entity =>
        {
            entity.HasOne(d => d.IdProfesorNavigation).WithMany(p => p.Asignaturas)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Asignatura_Profesor");
            entity.HasOne(d => d.IdProgramaAcademicoNavigation).WithMany(p => p.Asignaturas)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_Asignatura_ProgramaAcademico");
        });

        modelBuilder.Entity<Estudiante>(entity =>
        {
            entity.HasOne(d => d.IdProgramaAcademicoNavigation).WithMany(p => p.Estudiantes)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_Estudiante_ProgramaAcademico");
        });

        modelBuilder.Entity<RegistroEstudiantil>(entity =>
        {
            entity.HasOne(d => d.IdCicloEstudiantilNavigation).WithMany(p => p.RegistrosEstudiantilesCicloEstudiantil)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RegistroEstudiantil_CicloEstudiantil");
            entity.HasOne(d => d.IdEstudianteNavigation).WithMany(p => p.RegistrosEstudiantilesEstudiantes)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_RegistroEstudiantil_Estudiantes");
            entity.HasOne(d => d.IdAsignaturaNavigation).WithMany(p => p.RegistrosEstudiantilesAsignatura)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_RegistroEstudiantil_Asignaturas");
        });
      
       
        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasOne(d => d.IdTipoUsuarioNavigation).WithMany(p => p.Usuarios)
               .OnDelete(DeleteBehavior.ClientSetNull)
               .HasConstraintName("FK_Usuario_TipoUsuario");
            entity.HasOne(d => d.IdProfesorNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.IdProfesor)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Usuario_Profesor")
                .IsRequired(false);
            entity.Property(d => d.IdProfesor)
                .IsRequired(false);
            entity.HasOne(d => d.IdEstudianteNavigation).WithMany(p => p.Usuarios)
              .HasForeignKey(d => d.IdEstudiante)
              .OnDelete(DeleteBehavior.ClientSetNull)
              .HasConstraintName("FK_Usuario_Estudiante")
              .IsRequired(false);
            entity.Property(d => d.IdEstudiante)
                .IsRequired(false);

        });
      

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
