using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using prueba_RH.Models;

namespace prueba_RH.Controllers
{
    public class EmpleadoesController : Controller
    {
        private readonly RhContext _context;

        public EmpleadoesController(RhContext context)
        {
            _context = context;
        }

        // GET: Empleadoes
        public async Task<IActionResult> Index()
        {
            var rhContext = _context.Empleados.FromSqlRaw("sp_Read_Empleado");
            return View(await rhContext.ToListAsync());
        }

        // GET: Empleadoes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Empleados == null)
            {
                return NotFound();
            }

            var empleado = await _context.Empleados

                .FirstOrDefaultAsync(m => m.Id == id);
            if (empleado == null)
            {
                return NotFound();
            }

            return View(empleado);
        }

        // GET: Empleadoes/Create
        public IActionResult Create()
        {
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id");
            ViewData["IdPosicion"] = new SelectList(_context.Posiciones, "Id", "Id");
            return View();
        }

        // POST: Empleadoes/Create
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int Id,string Nombre, string Apellido, string FechaNacimiento, string Sexo, int IdDepartamentos,int IdPosicion, Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                _context.Database.ExecuteSqlRaw($"exec sp_Agregar_Empleado @Nombre='{Nombre}',@Apellido='{Apellido}',@Fecha_Nacimiento='{FechaNacimiento}',@Sexo='{Sexo}',@Id_departamentos={IdDepartamentos},@Id_Posicion={IdPosicion}");
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", empleado.IdDepartamentos);
            ViewData["IdPosicion"] = new SelectList(_context.Posiciones, "Id", "Id", empleado.IdPosicion);
            return View(empleado);
        }

        // GET: Empleadoes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Empleados == null)
            {
                return NotFound();
            }

            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado == null)
            {
                return NotFound();
            }
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", empleado.IdDepartamentos);
            ViewData["IdPosicion"] = new SelectList(_context.Posiciones, "Id", "Id", empleado.IdPosicion);
            return View(empleado);
        }

        // POST: Empleadoes/Edit/5
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, int Id, string Nombre, string Apellido, string FechaNacimiento, string Sexo, int IdDepartamentos, int IdPosicion, Empleado empleado)
        {
            if (id != empleado.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Database.ExecuteSqlRaw($"exec sp_Update_empleado @Id={id}, @Nombre='{Nombre}',@Apellido='{Apellido}',@Fecha_Nacimiento='{FechaNacimiento}',@Sexo='{Sexo}',@Id_departamentos={IdDepartamentos},@Id_Posicion={IdPosicion}"); ;
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmpleadoExists(empleado.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", empleado.IdDepartamentos);
            ViewData["IdPosicion"] = new SelectList(_context.Posiciones, "Id", "Id", empleado.IdPosicion);
            return View(empleado);
        }

        // GET: Empleadoes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Empleados == null)
            {
                return NotFound();
            }

            var empleado = await _context.Empleados
                
                .FirstOrDefaultAsync(m => m.Id == id);
            if (empleado == null)
            {
                return NotFound();
            }

            return View(empleado);
        }

        // POST: Empleadoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Empleados == null)
            {
                return Problem("Empleados is null.");
            }
            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado != null)
            {
                _context.Database.ExecuteSqlRaw($"exec sp_Delete_Empleado @id={id}"); ;
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EmpleadoExists(int id)
        {
          return (_context.Empleados?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
