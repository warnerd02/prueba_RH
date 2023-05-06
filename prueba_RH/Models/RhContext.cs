using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace prueba_RH.Models;

public partial class RhContext : DbContext
{
    public RhContext()
    {
    }

    public RhContext(DbContextOptions<RhContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Departamento> Departamentos { get; set; }

    public virtual DbSet<Empleado> Empleados { get; set; }

    public virtual DbSet<Posicione> Posiciones { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-GU0UCN6J; Database=RH; Trusted_Connection=true;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Departamento>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Departam__3214EC078C758C4A");

            entity.Property(e => e.DescripcionDepartamento)
                .HasColumnType("text")
                .HasColumnName("Descripcion_departamento");
            entity.Property(e => e.NDepartamento)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("N_Departamento");
        });

        modelBuilder.Entity<Empleado>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Empleado__3214EC0752156B1F");

            entity.Property(e => e.Apellido)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.FechaNacimiento)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("Fecha_Nacimiento");
            entity.Property(e => e.IdDepartamentos).HasColumnName("Id_departamentos");
            entity.Property(e => e.IdPosicion).HasColumnName("Id_Posicion");
            entity.Property(e => e.Nombre)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Sexo)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Posicione>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__posicion__3214EC07C25AAB57");

            entity.ToTable("posiciones");

            entity.Property(e => e.DescripcionPosicion)
                .HasColumnType("text")
                .HasColumnName("Descripcion_posicion");
            entity.Property(e => e.IdDepartamentos).HasColumnName("Id_departamentos");
            entity.Property(e => e.NPosicion)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("N_Posicion");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
