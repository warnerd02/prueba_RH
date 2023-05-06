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
    public class PosicionesController : Controller
    {
        private readonly RhContext _context;

        public PosicionesController(RhContext context)
        {
            _context = context;
        }

        // GET: Posiciones
        public async Task<IActionResult> Index()
        {
            var rhContext = _context.Posiciones.FromSqlRaw("sp_Read_posiciones");
            return View(await rhContext.ToListAsync());
        }

        // GET: Posiciones/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Posiciones == null)
            {
                return NotFound();
            }

            var posicione = await _context.Posiciones
                .Include(p => p.IdDepartamentos)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (posicione == null)
            {
                return NotFound();
            }

            return View(posicione);
        }

        // GET: Posiciones/Create
        public IActionResult Create()
        {
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id");
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int id, string NPosicion, int IdDepartamentos, string DescripcionPosicion, Posicione posicione)
        {
            if (ModelState.IsValid)
            {
                _context.Database.ExecuteSqlRaw($"exec sp_Agregar_Posicion @N_Posicion='{NPosicion}',@Id_departamentos={IdDepartamentos},@Descripcion_posicion='{DescripcionPosicion}'"); 
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", posicione.IdDepartamentos);
            return View(posicione);
        }

        // GET: Posiciones/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Posiciones == null)
            {
                return NotFound();
            }

            var posicione = await _context.Posiciones.FindAsync(id);
            if (posicione == null)
            {
                return NotFound();
            }
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", posicione.IdDepartamentos);
            return View(posicione);
        }

        // POST: Posiciones/Edit/5
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, string NPosicion, int IdDepartamentos, string DescripcionPosicion, Posicione posicione)
        {
            if (id != posicione.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                     _context.Database.ExecuteSqlRaw($"exec sp_Update_posiciones @Id = {id},@N_Posicion='{NPosicion}',@Id_departamentos={IdDepartamentos},@Descripcion_posicion='{DescripcionPosicion}'");
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PosicioneExists(posicione.Id))
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
            ViewData["IdDepartamentos"] = new SelectList(_context.Departamentos, "Id", "Id", posicione.IdDepartamentos);
            return View(posicione);
        }

        // GET: Posiciones/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Posiciones == null)
            {
                return NotFound();
            }

            var posicione = await _context.Posiciones
                .FirstOrDefaultAsync(m => m.Id == id);
            if (posicione == null)
            {
                return NotFound();
            }

            return View(posicione);
        }

        // POST: Posiciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Posiciones == null)
            {
                return Problem("Entity set 'RhContext.Posiciones'  is null.");
            }
            var posicione = await _context.Posiciones.FindAsync(id);
            if (posicione != null)
            {
                await _context.Database.ExecuteSqlRawAsync($"exec sp_Delete_posiciones @id={id}");
;            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PosicioneExists(int id)
        {
          return (_context.Posiciones?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
