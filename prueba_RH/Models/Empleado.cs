using System;
using System.Collections.Generic;

namespace prueba_RH.Models;

public partial class Empleado
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public string FechaNacimiento { get; set; } = null!;

    public string Sexo { get; set; } = null!;

    public int IdDepartamentos { get; set; }

    public int IdPosicion { get; set; }
}
