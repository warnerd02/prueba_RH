using System;
using System.Collections.Generic;

namespace prueba_RH.Models;

public partial class Departamento
{
    public int Id { get; set; }

    public string NDepartamento { get; set; } = null!;

    public string DescripcionDepartamento { get; set; } = null!;
}
