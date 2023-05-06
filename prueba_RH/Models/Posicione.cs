using System;
using System.Collections.Generic;

namespace prueba_RH.Models;

public partial class Posicione
{
    public int Id { get; set; }

    public string NPosicion { get; set; } = null!;

    public int? IdDepartamentos { get; set; }

    public string? DescripcionPosicion { get; set; }
}
